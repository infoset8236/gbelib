package kr.co.whalesoft.app.cms.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import kr.go.gbelib.app.common.api.SSOAPI;
import org.apache.commons.lang.StringUtils;
import org.bouncycastle.cert.ocsp.RespData;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ksign.access.wrapper.api.SSORspData;
import com.ksign.access.wrapper.api.SSOService;
import com.ksign.access.wrapper.sso.sso10.*;
import com.ksign.access.wrapper.api.*;

import kr.co.whalesoft.app.cms.accountLock.AccountLock;
import kr.co.whalesoft.app.cms.accountLock.AccountLockService;
import kr.co.whalesoft.app.cms.auth.AuthService;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.member.MemberService;
import kr.co.whalesoft.app.cms.memberGroup.MemberGroup;
import kr.co.whalesoft.app.cms.memberGroup.MemberGroupService;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.common.api.MemberAPI;
import kr.go.gbelib.app.module.loginLog.LoginLog;
import kr.go.gbelib.app.module.loginLog.LoginLogService;

@Controller
@RequestMapping(value = {"/cms/login","/pms/login","/dms/login"})
public class LoginController extends BaseController {

	private final String basePath = "/cms/login/";

	/*	private final String basePath2 = "/cms/member/";  */

	@Autowired
	private LoginService service;

	@Autowired
	private AuthService authService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberGroupService memberGroupService;

	@Autowired
	private AccountLockService accountLockService;

	@Autowired
	private HomepageService homepageService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private LoginLogService loginLogService;

	@RequestMapping(value = {"/index.*"})
	public String index(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String returnUrl = null;
		String redirectURL = "https://" + request.getServerName();
		SSORspData rspData = null;
		SSOService ssoService = SSOService.getInstance();
		String result = null;
		try {
			//sso서버에서 토큰 획득

			rspData = ssoService.ssoGetLoginData(request);
//				System.out.println("@@@@@@@@@@@@@@@@sso test token rspData.getResultCode : " + rspData.getResultCode());
		}catch (Exception e){
//				System.out.println("sso token get fail");
			result = "noData";
		}

		if(!"noData".equals(result)) { //토큰 정보를 가져오는데 오류가 나지 않았다면
			if(rspData.getResultCode() == SSORspData.SSO_OK) { // 토큰 정보가 유효하다면 (유효하면 0 , 유효하지 않으면 -1)
				//sso
				String uid = rspData.getAttribute("KSIGN_FED_USER_ID");
				if(uid == null) {
					uid = rspData.getAttribute("UID");
				}

				//토큰정보에서 가져온 ID 값으로 관리자 정보가 있는지 확인
				Member member = new Member();
				member.setMember_id(uid);
				member = memberService.getMemberOne(member);

				//토큰정보에서 가져온 ID 값을 소문자로 변환하여 관리자 정보가 있는지 확인
				if (member.getMember_name() == null) {
					member.setMember_id(uid.toLowerCase());
					member = memberService.getMemberOne(member);
				}

				if(member.getMember_name() != null) { //토큰 정보와 일치하는 관리자가 있을경우
					//로그인 처리---->
					member.setLogin(true);
					service.setSessionMember(member, request);
					loginLogService.addLoginLog(new LoginLog(member, request, "CMS"));
					//<----로그인 처리

					if(member.isLogin()) {
						//로그인이 됐다면
						String getUri = request.getRequestURI().substring(request.getContextPath().length());
						if (getUri.startsWith("/cms/")){
							redirectURL = "redirect:" + redirectURL + "/cms/index.do";
							//접속 URI 가져오기
						}else if(getUri.startsWith("/pms/")) {
							redirectURL = "redirect:" + redirectURL + "/pms/index.do";
							//접속 URI 가져오기
						}else if(getUri.startsWith("/dms/")) {
							redirectURL = "redirect:" + redirectURL + "/dms/index.do";
							//접속 URI 가져오기
						}
						return redirectURL;
					}else {
						model.addAttribute("login", new Login());
					}
				}else {
					model.addAttribute("login", new Login());
				}


//					int redirectPort = request.getServerPort();
//						if (redirectPort != 443) {
//							redirectURL += ":"+redirectPort;
//					}

//					if(request.getSession().getAttribute("returnUrl") != null){
//						returnUrl = String.valueOf(request.getSession().getAttribute("returnUrl"));
//						if (returnUrl.contains("/cms/")) {
//							redirectURL = "redirect:" + redirectURL + "/cms/index.do";
//						} else {
//	//							redirectURL = "redirect:" + request.getSession().getAttribute("returnUrl");
//							redirectURL = "redirect:" + redirectURL + getPath(request.getRequestURI()) + "/index.do";
//						}
//					}else{
//						redirectURL = "redirect:" + redirectURL + getPath(request.getRequestURI()) + "/index.do";
//					}

//					return redirectURL;
//
			}else if(rspData == null || rspData.getResultCode() == -1) {

				//cms
				model.addAttribute("login", new Login());
			}
		}else {
			model.addAttribute("login", new Login());
		}

		//관리자 로그인후 이동할 이전 주소 기록
		if(request.getHeader("referer") != null && !request.getHeader("referer").isEmpty() && request.getHeader("referer").indexOf("login/index.") == -1 && request.getHeader("referer").indexOf("/cms/aside.") == -1){
			request.getSession().setAttribute("returnUrl", request.getHeader("referer"));
			log.debug("retrunUrl : "+request.getSession().getAttribute("returnUrl"));
		}


		return basePath + "index";
	}

	@RequestMapping(value = {"/redirect.*"})
	public String redirect(Model model, Menu menu) {
		return basePath + "redirect";
	}

	/**
	 * 로그인 처리
	 * @param member
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login.*", method=RequestMethod.POST)
	public String loginProc(Model model, @Valid Login login,BindingResult result, HttpServletRequest request, RedirectAttributes redirectAttributes, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		String redirectURL = "https://" + request.getServerName();
		String returnUrl = getPath(request.getRequestURI()) + "/index.do";

		Member member = new Member();
		Member memberApi = new Member();
		member.setMember_id(login.getMember_id());
		member.setMember_pw(login.getMember_pw());
		memberApi.setCheck_certify_data(login.getMember_id().toUpperCase()); //대문자로변환 (ILUS API에 관리자 ID는 모두 대문자)
		Map<String, String> adminMember =   MemberAPI.getLoginMemberCertify("WEB", memberApi);

		String loginResult = service.login(member, request);
		if(loginResult.equals("LOGIN")) {
			/**
			 * 비밀번호 만료일자가 지난 경우 패스워드 변경유도 페이지로 이동.
			 */
			try {
				if (!StringUtils.isEmpty(member.getPassword_update_date())
						&& !StringUtils.equalsIgnoreCase(member.getPassword_update_date(), "null")
						&& !StringUtils.isEmpty(member.getPassword_expiry_day())) {

					DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyyMMdd");

					DateTime updateDate = fmt.parseDateTime(member.getPassword_update_date());
					DateTime currentDate = DateTime.now();


					Days daysBetween = Days.daysBetween(updateDate, currentDate);

					int expiryDay = Integer.parseInt(member.getPassword_expiry_day());

					if (daysBetween.getDays() > expiryDay) {
						homepage.setHomepage_code(member.getLoca());
						Homepage getHomepage = homepageService.getHomepageOneByCode(homepage);

						int menuIdx = homepageService.getMenuIdxByLinkUrl(getHomepage.getHomepage_id(), "/intro/join/changePwForm.do");

						returnUrl = String.format("https://gbelib.kr/%s/intro/join/passwordExpiry.do?menu_idx=%s", getHomepage.getContext_path(), menuIdx);

						request.getSession().setAttribute("passwordExpiry", returnUrl);

					}
				}
			} catch (Exception e) {

			}

			if(request.getSession().getAttribute("returnUrl") != null){
				returnUrl = String.valueOf(request.getSession().getAttribute("returnUrl"));
				if (returnUrl.contains("/cms/")) {
					redirectURL = "redirect:" + redirectURL + "/cms/index.do";
				} else {
					redirectURL = "redirect:" + redirectURL + getPath(request.getRequestURI()) + "/index.do";
				}
			}else{
				redirectURL = "redirect:" + redirectURL + getPath(request.getRequestURI()) + "/index.do";
			}

			Map<String, Object> param = new HashMap<String, Object>();

			param.put("user_id", member.getMember_id());

			boolean checkSSOLogin = SSOAPI.sendSSO(param, "find");

			if (checkSSOLogin) {
				String objectString = SSOAPI.getSSOInfo(param, "find");

				String addtimeKey = "addtime:";
				String addTime = objectString.substring(
						objectString.indexOf(addtimeKey) + addtimeKey.length(),
						objectString.indexOf(",", objectString.indexOf(addtimeKey))
				);

				String useripKey = "userip:";
				String userIp = objectString.substring(
						objectString.indexOf(useripKey) + useripKey.length(),
						objectString.indexOf(",", objectString.indexOf(useripKey))
				);

				String serverIdKey = "serverid:";
				String serverId = "";
				if (objectString.contains(serverIdKey)) {
					int startIndex = objectString.indexOf(serverIdKey) + serverIdKey.length();
					int endIndex = objectString.indexOf(",", startIndex);

					if (endIndex == -1) {
						endIndex = objectString.indexOf("}", startIndex);
					}

					serverId = objectString.substring(startIndex, endIndex);
				}

				member.setAddTime(addTime);
				member.setUserIp(userIp);
				member.setServerId(serverId);

				service.setSessionMember(member, request);

				model.addAttribute("memberId", member.getMember_id());
				model.addAttribute("userIp", userIp);

				return basePath + "ssoCheck";
			}

			try {
				// <SSO.1> SSO 서비스 객체 획득
				SSOService ssoService = SSOService.getInstance();
				String avps = "member_name="+member.getMember_name();
				// <SSO.3>. 인증 토큰 생성 요청
				String reqCtx = request.getContextPath();
				String agentIp = String.valueOf(request.getLocale());
				SSORspData rspData = null;

				if (returnUrl == null || returnUrl.isEmpty()) {
					returnUrl = getPath(request.getRequestURI()) + "/index.do";
				}

				if (!returnUrl.startsWith("http")) {
					returnUrl = homepage.getDomain() + returnUrl;
				}

				if (returnUrl.contains("sso.gbelib.kr")) {
					returnUrl = "https://www.gbelib.kr/cms/index.do";
				}

				rspData = ssoService.ssoReqIssueToken(request, response, "form-based", member.getMember_id(), avps, returnUrl, agentIp, request.getRemoteAddr());

				if(rspData != null && rspData.getResultCode() == -1){
					String alertMsg = "사용자 인증토큰 요청정보 생성에 실패하였습니다.";
					String nextURI = "/cms/index.do";
					service.alertMessageAndUrl(alertMsg, nextURI, request, response);
					return null;
				}

			} catch(Exception e) {
				e.printStackTrace();
			}

			return "redirect:" + returnUrl.replaceAll("^http://(www\\.)?gbelib\\.kr", "https://www.gbelib.kr");
		} else if(loginResult.equals("LOCKED")) {
			service.alertMessage("로그인 5회 중 5회 이상 실패\\n입력하신 아이디에 대해서 10분간 접속을 차단합니다.", request, response);
			return null;
		} else if(loginResult.equals("FAILED")) {
			AccountLock accountLock = accountLockService.getAccountLock(new AccountLock(member, request.getRemoteAddr()));
			service.alertMessage(String.format("로그인 5회 중 %d회 실패\\n아이디 또는 비밀번호를 다시 확인하세요", accountLock.getCount()), request, response);
			return null;
		}

		return redirectURL;
	}

	@RequestMapping(value = {"/adminEdit.*"})
	public String edit(Model model, Member member, Homepage homepage, HttpServletRequest request) throws AuthException {
		member.setAdmin(getSessionIsAdmin(request));
		member.setAuth_id(getSessionMemberInfo(request).getAuth_id());

		if ( member.getEditMode().equals("ADD") ) {

			MemberGroup memberGroup = new MemberGroup();
			//홈페이지 사이트목록 가져오기.
			model.addAttribute("homepageList", homepageService.getHomepage());
			//내권한 사이트목록 가져와서 집어넣기.
			model.addAttribute("member", member);
			model.addAttribute("getMemberGroupList", memberGroupService.getMemberGroupList(memberGroup));
		}
		model.addAttribute("authList", authService.getAuth("AUTH001"));
		model.addAttribute("cellPhoneCode", codeService.getCode(member.getHomepage_id(), "C0002"));
		model.addAttribute("phoneCode", codeService.getCode(member.getHomepage_id(), "C0003"));
		return returnUrl("adminEdit_ajax", request);
	}

	@RequestMapping(value = {"/getLoginLinkMember.*"})
	public @ResponseBody JsonResponse getLinkMember(Model model, Member member, HttpServletRequest request) {
		member.setCheck_certify_data(member.getMember_id());
		JsonResponse jr = new JsonResponse();
		jr.setData(MemberAPI.getLoginMemberCertify("WEB", member));
		return jr;
	}

	@RequestMapping(value = { "/save.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Member member, BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse(request);

		if ( "ADD".equals(member.getEditMode()) ) {
			ValidationUtils.rejectIfEmpty(result, "member_id", "자료관리ID를 입력해주세요.");
			ValidationUtils.rejectIfEmpty(result, "member_name", "관리자명을 입력해주세요.");
			ValidationUtils.rejectOnlyEngNumSpec(result, "member_pw", 8, 20, "비밀번호는 영문, 숫자, 특수문자 조합 8자 이상 20자 이하로 입력하세요.");
			if ( memberService.checkMemberId(member) > 0 ) {
				result.reject("중복된 ID가 있습니다.");
			}

		}

		if ( !result.hasErrors() ) {
//			if (Integer.parseInt(getSessionMemberInfo(request).getAuth_id()) <= 200) {
			res.setValid(true);
			member.setCud_id(getSessionMemberId(request));
			member.setAdd_ip(request.getRemoteAddr());
			res.setData(member.getPram("index"));
			res.setUrl("index.do");
			if (member.getEditMode().equals("ADD")) {
				memberService.addMember(member);
				res.setMessage("등록되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	/**
	 * 로그아웃 처리
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/logout.*")
	public String logout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
//		String redirectURL = request.getServerName() + ":" + request.getServerPort();
		String redirectURL = request.getServerName();
		service.logout(request);
		String result = null;
		String SSO_SERVER = null;
		String logoutParam = null;
		//SSO 로그아웃 처리
		try {
			SSO_SERVER = SSOService.getInstance().getServerScheme();
//			logoutParam = request.getParameter("logout");
		}catch(Exception e) {
//			System.out.println("@@@@@@@@@@@@@@@@@@@@ sso logout > get SSO_SERVER ERROR");
			result = "error";
		}
//		if(!"error".equals(result) && SSO_SERVER != null && !"1".equals(logoutParam)) {
		if(!"error".equals(result) && SSO_SERVER != null) {
			return "redirect:"+SSO_SERVER + "/sso/pmi-logout-url.jsp?returl=https://" + redirectURL +  getPath(request.getRequestURI()) + "/login/index.do";
		}else {
			return "redirect:https://" + redirectURL + getPath(request.getRequestURI()) + "/login/index.do";
		}
	}


	//접속URI를 기준으로 PMS로 갈건지 CMS로 갈건지 결정
	public String getPath(String uri){
		String path = "/cms";
		if(uri.startsWith("/pms/")){
			path = "/pms";
		}else if(uri.startsWith("/dms/")){
			path = "/dms";
		} else {

		}
		return path;
	}

	private String returnUrl(String url, HttpServletRequest request) {
		return basePath + url;
	}

	@RequestMapping(value="/ssoLogout.*")
	public String ssoLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Member member = getSessionMemberInfo(request);

		String returnUrl = "";
		if(member != null && member.getBefore_url() != null) {
			returnUrl = member.getBefore_url();
		}

		if ( StringUtils.isEmpty(returnUrl) || returnUrl.indexOf("/login/") > -1 ) {
			returnUrl = String.format("%s/cms/index.do", homepage.getDomain()).replaceAll("^http://", "https://");
			if (request.getRequestURL().toString().contains("localhost")) {
				returnUrl = String.format("%s/cms/index.do", "http://localhost");
			}
		}

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("user_id", member.getMember_id());
		param.put("server_gid", member.getServerId());

		boolean deleteSSOLogin = SSOAPI.sendSSO(param, "delete");

		if (!deleteSSOLogin) {
			String alertMsg = "사용자 인증토큰 삭제에 실패하였습니다.";
			String nextURI = "/" + homepage.getContext_path() + "/index.do";
			service.alertMessageAndUrl(alertMsg, nextURI, request, response);
			return null;
		}

		{
			try {
				if(!StringUtils.equals(homepage.getContext_path(), "app")) {
					SSOService ssoService = SSOService.getInstance();
					String avps = "";

					String reqCtx = request.getContextPath();
					String agentIp = String.valueOf(request.getLocale());

					SSORspData rspData = null;

					if(!returnUrl.startsWith("http")) {
						returnUrl = homepage.getDomain() + returnUrl;
					}

					rspData = ssoService.ssoReqIssueToken(request, response, "form-based", member.getMember_id(), avps, returnUrl, agentIp, request.getRemoteAddr());

					if(rspData != null && rspData.getResultCode() == -1) {
						String alertMsg = "사용자 인증토큰 요청정보 생성에 실패하였습니다.";
						String nextURI = "/" + homepage.getContext_path() + "/index.do";
						service.alertMessageAndUrl(alertMsg, nextURI, request, response);
						return null;
					}
				}

			} catch(Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:" + returnUrl.replaceAll("^http://", "https://");
	}

}