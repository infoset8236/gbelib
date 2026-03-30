package kr.go.gbelib.app.intro.join;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yhdb.solution.secukeypad.interweb.SecuKeypadConstant;
import com.yhdb.solution.secukeypad.interweb.SecuKeypadDecoder;

import kr.go.gbelib.app.cms.module.teach.Teach;
import kr.go.gbelib.app.cms.module.teach.TeachService;
import kr.go.gbelib.app.cms.module.teach.teachBookManage.TeachBookManage;
import kr.go.gbelib.app.cms.module.teach.teachBookManage.TeachBookManageService;
import kr.go.gbelib.app.cms.module.teachBook.TeachBook;
import kr.go.gbelib.app.cms.module.teachBook.TeachBookService;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.TrainingService;
import kr.go.gbelib.app.cms.module.training.trainingBookManage.TrainingBookManage;
import kr.go.gbelib.app.cms.module.training.trainingBookManage.TrainingBookManageService;
import kr.go.gbelib.app.cms.module.training.trainingBookQrManage.TrainingBookQrManage;
import kr.go.gbelib.app.cms.module.training.trainingBookQrManage.TrainingBookQrManageService;
import kr.go.gbelib.app.common.api.LoginAPI;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.yaml.snakeyaml.util.UriEncoder;

import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.app.cms.login.LoginService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.member.MemberService;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.app.cms.site.Site;
import kr.co.whalesoft.app.cms.site.SiteService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.StaticVariables;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.cms.module.elib.lending.Lending;
import kr.go.gbelib.app.cms.module.elib.lending.LendingService;
import kr.go.gbelib.app.common.api.ApiResponse;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.common.api.MemberAPI;
import kr.go.gbelib.app.module.loginLog.LoginLogService;

@Controller
@RequestMapping(value = {"/{homepagePath}/intro/join"})
public class CommonJoinController extends BaseController {

	private String basePath = "/homepage/%s/commonIntro/join/";

	@Autowired
	private JoinService joinService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private SiteService siteService;

	@Autowired
	private LoginService loginService;

	@Autowired
	private HomepageService homepageService;

	@Autowired
	private LendingService lendingService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private LoginLogService loginservice;

	@Autowired
	private TrainingService trainingService;

	@Autowired
	private TrainingBookManageService trainingBookManageService;

	@Autowired
	private TrainingBookQrManageService trainingBookQrManageService;

	@Autowired
	private TeachService teachService;

	@Autowired
	private TeachBookManageService teachBookManageService;

	@Autowired
	private TeachBookService teachBookService;

	@ModelAttribute("siteList")
	public List<Site> getAreaCdList(HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		return siteService.getSiteListAll(new Site(homepage.getHomepage_id()));
	}

	@RequestMapping(value = {"/index.*"})
	public String index(Model model, Member member, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_full_path_name("회원가입 > 회원유형확인");
//		member = getSessionMemberInfo(request);
		model.addAttribute("newMember", member);
		return String.format(basePath, homepage.getFolder()) + "index";
	}

	/**
	 * 약관인증
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/step2.*"}, method = RequestMethod.POST)
	public String step2(Model model, Member member, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_full_path_name("회원가입 > 이용약관동의");
		model.addAttribute("newMember", member);
		model.addAttribute("prtcNotice",MemberAPI.getPrtcNoticeList("WEB"));
//		model.addAttribute("libraryList", LibSearchAPI.getLibraryList());
		return String.format(basePath, homepage.getFolder()) + "step2";
	}

	/**
	 * 본인인증
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/step3.*"}, method = RequestMethod.POST)
	public String step3(Model model, Member member, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_full_path_name("회원가입 > 본인확인");
		model.addAttribute("loginMenuIdx", menuService.getMenuIdxByLinkUrl(new Menu(homepage.getHomepage_id(), "/intro/login/index.do")));
		model.addAttribute("newMember", member);
		return String.format(basePath, homepage.getFolder()) + "step3";
	}

	/**
	 * 회원구분에 따른 본인인증
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/cert.*"}, method = RequestMethod.POST)
	public String cert(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		String certType = request.getParameter("certType");
		if (StringUtils.isEmpty(certType)) {
			codeService.alertMessagePopup("잘못된 접근입니다.", request, response);
			return null;
		}

		if (!StringUtils.isEmpty(certType) && certType.toLowerCase().contains("sms")) {
			String sReturnUrl = "https://www.gbelib.kr/intro/join/certResponse.do";

			String sErrorUrl = "https://www.gbelib.kr/intro/join/certResponse.do";
//			String sReturnUrl = "http://whalesoft.co.kr:11880/intro/join/certResponse.do";
//			String sErrorUrl = "http://whalesoft.co.kr:11880/intro/join/certResponse.do";

			model.addAttribute("result", joinService.getSmsEncData(request, sReturnUrl, sErrorUrl));
		} else if (certType.toLowerCase().contains("gpin")) {
			String sReturnUrl = "https://www.gbelib.kr/intro/join/certResponse.do";
//			String sReturnUrl = "http://whalesoft.co.kr:11880/intro/join/certResponse.do";


			model.addAttribute("result", joinService.getIpinEncData(request, sReturnUrl));
		}

		String mode = String.valueOf(request.getParameter("mode"));
		request.getSession().setAttribute("certType", certType);
		request.getSession().setAttribute("certMode", mode);
		return String.format(basePath, homepage.getFolder()) + "cert_ajax";
	}

	/**
	 * 회원구분에 따른 본인인증 수신
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/certResponse.*"})
	public String certResponse(Model model, Member member, HttpServletRequest request, HttpServletResponse response) {
		response.setHeader("Cache-Control","no-store");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires",0);
		if (request.getProtocol().equals("HTTP/1.1")) {
		        response.setHeader("Cache-Control", "no-cache");
		}

		Homepage homepage = (Homepage) request.getAttribute("homepage");
		String certType = String.valueOf(request.getSession().getAttribute("certType")).toLowerCase();
		String mode = String.valueOf(request.getSession().getAttribute("certMode")).toLowerCase();
//		String certType = request.getParameter("certType").toLowerCase();
//		certType = certType.toLowerCase();
		boolean certResult = false;

		if (!StringUtils.isEmpty(certType) && certType.contains("sms")) {
			member = joinService.smsCertProc(request, member);
		} else if (!StringUtils.isEmpty(certType) && certType.contains("gpin")) {
			member = joinService.ipinCertProc(request, member);
		}

		if (!member.isCertComplete()) {
			model.addAttribute("certFailed", true);
			return String.format(basePath, homepage.getFolder()) + "certReseponse_ajax";
		}

		if (StringUtils.isNotEmpty(mode) && mode.equals("findpw")) {
			model.addAttribute("findPw", true);
			request.getSession().setAttribute("findPw", "o");
			request.getSession().setAttribute("certMember", member);
			return String.format(basePath, homepage.getFolder()) + "certReseponse_ajax";
		}

		model.addAttribute("member", member);
		request.getSession().setAttribute("certMember", member);
		request.getSession().setAttribute("certType", certType);

		System.out.println("certType = " + certType);
		if (!StringUtils.isEmpty(certType) && certType.contains("parent")) {
			//보호자 인증
			model.addAttribute("parent", true);
		} else if (!StringUtils.isEmpty(certType) && !certType.contains("parent")) {
			//실제 가입자 인증
			model.addAttribute("dupCheck", MemberAPI.checkDupUser("WEB", member, "0001", member.getCi_value()));
			System.out.println("member.toString() = " + member.toString());
			model.addAttribute("dupList", MemberAPI.getDupUserList("WEB", member, "0001", member.getCi_value()));
			System.out.println("MemberAPI.getDupUserList(\"WEB\", member, \"0004\", member.getCi_value()) = " + MemberAPI.getDupUserList("WEB", member, "0004", member.getCi_value()));
//			model.addAttribute("dupCheck", false);
		} else {
			model.addAttribute("certFailed", certResult);
		}

		return String.format(basePath, homepage.getFolder()) + "certReseponse_ajax";
	}

	/**
	 * 회원정보입력
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = {"/edit.*"}, method = RequestMethod.POST)
	public String edit(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_full_path_name("회원가입 > 회원정보입력");
//		request.getSession().invalidate();
		if ( member.getEditMode().equals("MODIFY") ) {
//			member = getSessionMemberInfo(request);
			Map<String, String> memberInfo = MemberAPI.getMember("WEB", getSessionMemberInfo(request));
			member.setMember_name(memberInfo.get("USER_NAME"));
			member.setBirth_day(memberInfo.get("BIRTHD"));
			member.setSex(memberInfo.get("SEX"));
			member.setLoca(memberInfo.get("LOCA"));
			member.setAddress1(memberInfo.get("ADDRS"));
			member.setSms_service_yn(memberInfo.get("SMS_CHECK"));
			member.setEmail_service_yn(memberInfo.get("MAIL_CHECK"));

			String phone = memberInfo.get("TEL_NO");
			mergeTelno(member, phone);

			String cellPhone = memberInfo.get("MOBILE_NO");
			mergeCellphone(member, cellPhone);

			String email = memberInfo.get("EMAIL");
			if ( StringUtils.isEmpty(email) ) {
				String[] arr = email.split("@");
				member.setEmail1(arr[0]);
				if ( arr.length > 1 ) {
					member.setEmail2(arr[1]);
				}
			}

//			member.setDi_value(memberInfo.get("DUPINFO"));
//			member.setCi_value(memberInfo.get("CONN_INFO"));
			member.setZipcode(memberInfo.get("ZIP_CODE"));

		}
		else {

			request.getSession().setAttribute("dls_id", null);
			request.getSession().setAttribute("dls_ip", null);

			member.setLoca(homepage.getHomepage_code());
//			String agreeCodes = member.getAgree_codes();
			Member certMember = (Member) request.getSession().getAttribute("certMember");
			if (certMember != null) {
				
				//회원가입시 본인인증 취약점 조치
				boolean nameCheck = false;
				boolean genderCheck = false;
				boolean birthCheck = false;
				nameCheck = member.getCheck_name().equals(certMember.getMember_name());
				System.out.println("checkName : " + member.getCheck_name() + "certName : " + certMember.getMember_name() + " nameCheck : " + nameCheck);
				genderCheck = member.getGender().equals(certMember.getSex());
				System.out.println("checkGender : " + member.getGender() + "certGender : " + certMember.getSex() + " genderCheck : " + genderCheck);
				birthCheck = member.getBirth_date().equals(certMember.getBirth_day());
				System.out.println("checkBirth : " + member.getBirth_date() + "certBirth : " + certMember.getBirth_day() + " birthCheck : " + birthCheck);
				
				if (nameCheck && genderCheck && birthCheck) {
				
					member.setMember_name(certMember.getMember_name());
					member.setBirth_day(certMember.getBirth_day());
					if (certMember.getSex().equals("1")) {
						member.setSex("0001");
					} else {
						member.setSex("0002");
					}
					if (StringUtils.isNotEmpty(certMember.getCell_phone())) {
						member.setCell_phone(certMember.getCell_phone());
					}
					member.setCi_value(certMember.getCi_value());
					member.setDi_value(certMember.getDi_value());
				}else {
					joinService.alertMessageAndUrl("입력하신 정보와 인증데이터가 다릅니다.",String.format("%s://%s/%s/index.do?",request.getScheme(), homepage.getDomainWithoutProtocol(),homepage.getContext_path()),request, response);
					
					return null;
				}
			}
			
		}
		model.addAttribute("newMember", member);
		model.addAttribute("telCode", codeService.getCode("CMS", "C0003"));
		model.addAttribute("phoneCode", codeService.getCode("CMS", "C0002"));
		model.addAttribute("email", codeService.getCode("CMS", "C0010"));
		model.addAttribute("libList", MemberAPI.getLibInfoQry("WEB", "0001", null));
//		return returnPage;
		return String.format(basePath, homepage.getFolder()) + "edit";
	}


	/**
	 * 회원정보입력
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/edit2.*"}, method = RequestMethod.POST)
	public String edit2(Model model, Member member, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
//		request.getSession().invalidate();
		if ( member.getEditMode().equals("MODIFY") ) {
//			member = getSessionMemberInfo(request);
			Map<String, String> memberInfo = MemberAPI.getMember("WEB", getSessionMemberInfo(request));
			member.setMember_name(memberInfo.get("USER_NAME"));
			member.setBirth_day(memberInfo.get("BIRTHD"));
			member.setSex(memberInfo.get("SEX"));
			member.setLoca(memberInfo.get("LOCA"));
			member.setAddress1(memberInfo.get("ADDRS"));
			member.setSms_service_yn(memberInfo.get("SMS_CHECK"));
			member.setEmail_service_yn(memberInfo.get("MAIL_CHECK"));

			String phone = memberInfo.get("TEL_NO");
			mergeTelno(member, phone);

			String cellPhone = memberInfo.get("MOBILE_NO");
			mergeCellphone(member, cellPhone);

			String email = memberInfo.get("EMAIL");
			if ( StringUtils.isEmpty(email) ) {
				String[] arr = email.split("@");
				member.setEmail1(arr[0]);
				if ( arr.length > 1 ) {
					member.setEmail2(arr[1]);
				}
			}

//			member.setDi_value(memberInfo.get("DUPINFO"));
//			member.setCi_value(memberInfo.get("CONN_INFO"));
			member.setZipcode(memberInfo.get("ZIP_CODE"));

		}
		else {
			member.setLoca(homepage.getHomepage_code());
			String agreeCodes = member.getAgree_codes();
//			if ( agreeCodes != null ) {
//				String[] agreeCodesArr = agreeCodes.split(",");
//				if ( agreeCodesArr.length == 4 ) {
//					returnPage = basePath + "edit";
//					if ( MemberAPI.agreePrtcInfo("WEB", member, agreeCodesArr) ) {
//						returnPage = basePath + "edit";
//					}
//				}
//			}
		}
		model.addAttribute("newMember", member);
		model.addAttribute("telCode", codeService.getCode("CMS", "C0003"));
		model.addAttribute("phoneCode", codeService.getCode("CMS", "C0002"));
		model.addAttribute("email", codeService.getCode("CMS", "C0010"));
		model.addAttribute("libList", MemberAPI.getLibInfoQry("WEB", "0001", null));
//		return returnPage;
		return String.format(basePath, homepage.getFolder()) + "edit2";
	}

	@RequestMapping(value = { "/check.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse check(Member member, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);

		ValidationUtils.rejectIfEmpty(result, "member_id", "사용자ID를 입력해주세요.");
		ValidationUtils.rejectOnlyEngNum(result, "member_id", 6, 20, "아이디는 영문, 숫자 조합 6자 이상 20자 이하로 입력하세요.");
		if (StringUtils.isNotEmpty(member.getMember_id())) {
			try {
				Long.parseLong(member.getMember_id());
				result.addError(new ObjectError("member_id", null));
			} catch ( Exception e ) {
			}
		}

		if ( !result.hasErrors() ) {
			if ( MemberAPI.checkUserId("WEB", member, "WEBID") ) {
				if (memberService.getMemberOne(member) == null) {
					res.setValid(true);
//					res.setMessage("사용 가능한 ID 입니다.");
				} else {
					res.setValid(false);
				}
			}
			else {
				res.setValid(false);
//				res.setMessage("사용 불가능한 ID 입니다.");
			}
		} else {
			res.setValid(false);
//			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/modifyForm.*"})
	public String modifyForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		String requestURL = request.getRequestURL().toString();
		if ( !requestURL.startsWith("https://") ) {
//			return "redirect:https://" + requestURL.substring(6) + "?menu_idx=" + request.getParameter("menu_idx");
//			return "redirect:" + String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(),homepage.getContext_path(), member.getMenu_idx());
		}

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(),homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}
		member = getSessionMemberInfo(request);
		Map<String, String> memberInfo = MemberAPI.getMember("WEB", member);
		member.setMember_name(memberInfo.get("USER_NAME"));
		member.setWeb_id(memberInfo.get("WEB_ID"));
		member.setBirth_day(memberInfo.get("BIRTHD"));
		member.setSex(memberInfo.get("SEX"));
		member.setSms_service_yn(memberInfo.get("SMS_CHECK"));
		member.setEmail_service_yn(memberInfo.get("MAIL_CHECK"));

		String phone = memberInfo.get("TEL_NO");
		mergeTelno(member, phone);
		String cellPhone = memberInfo.get("MOBILE_NO");
		mergeCellphone(member, cellPhone);

		String email = memberInfo.get("EMAIL");
		if ( !StringUtils.isEmpty(email) ) {
			String[] arr = email.split("@");
			if (arr != null && arr.length > 1) {
				member.setEmail1(arr[0]);
				if ( arr.length > 1 ) {
					member.setEmail2(arr[1]);
				}
			}
		}

		// FIXME

		/*member.setDi_value(memberInfo.get("DUPINFO"));*/
		member.setCi_value(memberInfo.get("CONN_INFO"));
		member.setZipcode(memberInfo.get("ZIP_CODE"));
		member.setAddress1(memberInfo.get("ADDRS").replaceAll(" null", ""));
		member.setLoca(memberInfo.get("LOCA"));
		member.setLoca_name(memberInfo.get("LOCA_NAME"));


		Lending lending = new Lending();
		lending.setMember_id(getSessionMemberId(request));
		lending.setMenu("LENDING");
		int elibLendCnt = lendingService.getLendMemberListCnt(lending);
		lending.setMenu("RESERVE");
		int elibReserveCnt = lendingService.getReserveMemberListCnt(lending);

		model.addAttribute("elibLendCnt", elibLendCnt + elibReserveCnt);
		model.addAttribute("newMember", new Member());
		model.addAttribute("member", member);
		model.addAttribute("memberInfo", member);
		model.addAttribute("libList", MemberAPI.getLibInfoQry("WEB", "0001", null));
		model.addAttribute("telCode", codeService.getCode("CMS", "C0003"));
		model.addAttribute("phoneCode", codeService.getCode("CMS", "C0002"));
		model.addAttribute("email", codeService.getCode("CMS", "C0010"));
		return String.format(basePath, homepage.getFolder()) + "modifyForm";
	}

	@RequestMapping(value = { "/save.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Member member, BindingResult result, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		JsonResponse res = new JsonResponse(request);

		if ( "ADD".equals(member.getEditMode()) || "INTEGRATION".equals(member.getEditMode()) ) {
			if (StringUtils.equals(member.getLangMode(), "eng")) {
				ValidationUtils.rejectIfEmpty(result, "member_id", "Please enter ID");
				ValidationUtils.rejectOnlyEngNum(result, "member_id", "ID can only be English or numeric");
				ValidationUtils.rejectOnlyEngNum(result, "member_id", 6, 20, "Please enter 6 or more characters and 20 or less alphanumeric characters.");
				ValidationUtils.rejectIfEmpty(result, "member_pw", "Please enter password");
//			ValidationUtils.rejectIfEmpty(result, "member_name", "이름을 입력해주세요.");
//			ValidationUtils.rejectIfEmpty(result, "birth_day", "생년월을 입력해주세요");
//			ValidationUtils.rejectIfNotDate(result, "birth_day", "생년월일 형식이 올바르지 않습니다.");
//			ValidationUtils.rejectIfEmpty(result, "phone2", "집 전화번호를 입력하세요.");
//			ValidationUtils.rejectIfEmpty(result, "phone3", "집 전화번호를 입력하세요.");
				ValidationUtils.rejectIfEmpty(result, "cell_phone", "Please enter Mobile phone number");
//			ValidationUtils.rejectIfEmpty(result, "cell_phone2", "휴대폰 번호를 입력하세요.");
//			ValidationUtils.rejectIfEmpty(result, "cell_phone3", "휴대폰 번호를 입력하세요.");
//			ValidationUtils.rejectNotFullEmailType(result, "email", "이메일 형식이 올바르지 않습니다.");
				ValidationUtils.rejectIfEmpty(result, "zipcode", "Please enter Address");
				ValidationUtils.rejectIfEmpty(result, "address1", "Please enter Address");
				ValidationUtils.rejectIfEmpty(result, "loca", "Please select Affiliated library");
			} else {
				if ("ADD".equals(member.getEditMode())) {
					ValidationUtils.rejectIfEmpty(result, "member_id", "아이디를 입력해주세요.");
					ValidationUtils.rejectOnlyEngNum(result, "member_id", "아이디는 영문 또는 숫자만 사용가능합니다.");
					ValidationUtils.rejectOnlyEngNum(result, "member_id", 6, 20, "아이디는 영문, 숫자 조합 6자 이상 20자 이하로 입력하세요.");
					if (StringUtils.isNotEmpty(member.getMember_id())) {
						try {
							Integer.parseInt(member.getMember_id());
							result.reject("아이디는 영문, 숫자로 조합하여 입력하세요.");
						} catch ( Exception e ) {
						}
					}
				}
				if ("ADD".equals(member.getEditMode())) {
					ValidationUtils.rejectIfEmpty(result, "member_id", "아이디를 입력해주세요.");
					ValidationUtils.rejectOnlyEngNum(result, "member_id", "아이디는 영문 또는 숫자만 사용가능합니다.");
					ValidationUtils.rejectOnlyEngNum(result, "member_id", 6, 20, "아이디는 영문, 숫자 조합 6자 이상 20자 이하로 입력하세요.");
					if (StringUtils.isNotEmpty(member.getMember_id())) {
						try {
							Integer.parseInt(member.getMember_id());
							result.reject("아이디는 영문, 숫자로 조합하여 입력하세요.");
						} catch ( Exception e ) {
						}
					}
				}
				ValidationUtils.rejectIfEmpty(result, "member_pw", "비밀번호를 입력해주세요.");
//			ValidationUtils.rejectIfEmpty(result, "member_name", "이름을 입력해주세요.");
//			ValidationUtils.rejectIfEmpty(result, "birth_day", "생년월을 입력해주세요");
//			ValidationUtils.rejectIfNotDate(result, "birth_day", "생년월일 형식이 올바르지 않습니다.");
//			ValidationUtils.rejectIfEmpty(result, "phone2", "집 전화번호를 입력하세요.");
//			ValidationUtils.rejectIfEmpty(result, "phone3", "집 전화번호를 입력하세요.");
				ValidationUtils.rejectIfEmpty(result, "cell_phone", "휴대폰 번호를 입력하세요.");
//			ValidationUtils.rejectIfEmpty(result, "cell_phone2", "휴대폰 번호를 입력하세요.");
//			ValidationUtils.rejectIfEmpty(result, "cell_phone3", "휴대폰 번호를 입력하세요.");
//			ValidationUtils.rejectNotFullEmailType(result, "email", "이메일 형식이 올바르지 않습니다.");
				ValidationUtils.rejectIfEmpty(result, "zipcode", "주소를 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "address1", "주소를 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "loca", "소속 도서관이 선택되지 않았습니다.");

			}

		}
		else if ( "MODIFY".equals(member.getEditMode()) || "MODIFY2".equals(member.getEditMode()) ) {
			if (StringUtils.isNotEmpty(member.getCard_password())) {
				ValidationUtils.rejectExceptNumber(result, "card_password", 4, "대출증 비밀번호 설정은 숫자 4자리로 입력해주세요.");
			}
			if ("MODIFY2".equals(member.getEditMode())) {
				ValidationUtils.rejectIfEmpty(result, "web_id", "아이디를 입력해주세요.");
				ValidationUtils.rejectOnlyEngNum(result, "web_id", "아이디는 영문 또는 숫자만 사용가능합니다.");
				ValidationUtils.rejectOnlyEngNum(result, "web_id", 6, 20, "아이디는 영문, 숫자 조합 6자 이상 20자 이하로 입력하세요.");
			}
//			ValidationUtils.rejectIfEmpty(result, "member_pw", "비밀번호를 입력해주세요.");
			ValidationUtils.rejectIfEmpty(result, "cell_phone2", "휴대폰 번호를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "cell_phone3", "휴대폰 번호를 입력하세요.");
			ValidationUtils.rejectExceptNumber(result, "cell_phone2", 3, 4, "휴대전화 4자리로 입력해주세요.");
			ValidationUtils.rejectExceptNumber(result, "cell_phone3", 4, "휴대전화 4자리로 입력해주세요.");
			ValidationUtils.rejectIfEmpty(result, "zipcode", "주소를 입력해주세요.");
			ValidationUtils.rejectIfEmpty(result, "address1", "주소를 입력해주세요.");
			ValidationUtils.rejectIfEmpty(result, "loca", "소속 도서관이 선택되지 않았습니다.");

			Lending lending = new Lending();
			lending.setMember_id(getSessionMemberId(request));
			lending.setMenu("LENDING");
			int elibLendCnt = lendingService.getLendMemberListCnt(lending);
			lending.setMenu("RESERVE");
			int elibReserveCnt = lendingService.getReserveMemberListCnt(lending);

			if ((elibLendCnt + elibReserveCnt) > 0) {
				String currLoca = getSessionMemberInfo(request).getLoca();
				String modLoca = member.getLoca();
				if (StringUtils.isNotEmpty(modLoca)) {
					if (!StringUtils.equals(currLoca, modLoca)) {
						result.reject("대출, 예약중인 전자 콘텐츠가 있는 경우 소속도서관을 변경할 수 없습니다.");
					}
				}
			}
		}

		if ( !result.hasErrors() ) {
			if ( member.getEditMode().equals("ADD") ) {
				String addResult = joinService.addMember(request, member);
				if (addResult.equals("0")) {
					res.setValid(true);
					if (StringUtils.equals(member.getLangMode(), "eng")) {
						res.setMessage("Congratulations. Sign up is complete.");
					} else {
						res.setMessage("회원가입이 완료되었습니다.");
					}
					int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/login/index.do");
					res.setUrl(String.format("https://%s/%s/intro/login/index.do?menu_idx=%d", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), menuIdx));
					request.getSession().invalidate();
				} else {
					res.setValid(true);
					res.setMessage(addResult);
				}
			} else if ( member.getEditMode().equals("MODIFY") ) {
//				if ( MemberAPI.checkMemberPasswd("WEB", member) ) {
					if ( MemberAPI.updateMember("WEB", member, false) ) {
						res.setValid(true);
						res.setMessage("수정되었습니다.");
						Member sessionMember = getSessionMemberInfo(request);
						sessionMember.setLoca(member.getLoca());
						loginService.setSessionMember(sessionMember, request);
						int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/modifyForm.do");
						res.setUrl(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%d", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), menuIdx));
					} else {
						res.setValid(false);
						res.setMessage("수정 실패하였습니다. 잠시후 다시 시도해주세요.");
					}
//				} else {
//					res.setValid(false);
//					res.setMessage("비밀번호를 확인해주세요.");
//				}
			} else if ( member.getEditMode().equals("MODIFY2") ) {//기존회원 아이디생성 //사용안함!
				member.setUser_id(getSessionUserId(request));
				if ( MemberAPI.updateMember("WEB", member, true) ) {
					res.setValid(true);
					res.setMessage("수정되었습니다.");
					int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/modifyForm.do");
					res.setUrl(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%d", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), menuIdx));
				} else {
					res.setValid(false);
					res.setMessage("수정 실패하였습니다. 잠시후 다시 시도해주세요..");
				}
			} else if ( member.getEditMode().equals("INTEGRATION") ) {//통합회원 전환
				Member certMember = (Member) request.getSession().getAttribute("certMember");
				if(certMember != null) {
					member.setCi_value(certMember.getCi_value());
					member.setDi_value(certMember.getDi_value());
				}
				if ( MemberAPI.updateMember("WEB", member, true) ) {
					try {
						joinService.integrationMember(member);//회원통합 프로시저 콜
					}
					catch ( Exception e ) {
					}
					MemberAPI.agreePrtcInfo("WEB", member.getUser_id(), member.getLoca(), "1,2,6".split(","));
					res.setValid(true);
					res.setMessage("수정되었습니다.");
//					int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/modifyForm.do");
//					res.setUrl(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%d", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), menuIdx));
					res.setUrl(String.format("http://%s/%s/index.do", homepage.getDomainWithoutProtocol(), homepage.getContext_path()));
				} else {
					res.setValid(false);
					res.setMessage("수정 실패하였습니다. 잠시후 다시 시도해주세요..");
				}

			} else if ( member.getEditMode().equals("DELETE") ) {
//				if ( MemberAPI.deleteMember("WEB", member) ) {
//					res.setValid(true);
//					res.setMessage("탈퇴되었습니다. 이용해주셔서 감사합니다.");
//				}
//				else {
//					res.setValid(false);
//					res.setMessage("삭제 실패하였습니다. 잠시후 다시 시도해주세요.");
//				}
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/editAgree.*"})
	public String editAgree(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}

		model.addAttribute("member", getSessionMemberInfo(request));
		model.addAttribute("prtcNotice",MemberAPI.getPrtcNoticeList("WEB"));
		model.addAttribute("libraryList", LibSearchAPI.getLibraryList());

		return String.format(basePath, homepage.getFolder()) + "editAgree";
	}

	@RequestMapping(value = { "/saveAgree.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse saveAgree(Member member, BindingResult result, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		JsonResponse res = new JsonResponse(request);

		if ( !result.hasErrors() ) {
			MemberAPI.agreePrtcInfo("WEB", member.getMember_id(), member.getLoca(), member.getAgree_codes().replaceAll(" ", "").split(","));
			res.setValid(true);
			res.setUrl(String.format("https://%s/%s/index.do", homepage.getDomainWithoutProtocol(), homepage.getContext_path()));
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/changePwForm.*"})
	public String changePwForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/changePwForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}
		member = getSessionMemberInfo(request);
		Map<String, String> memberInfo = MemberAPI.getMember("WEB", member);
		member.setMember_name(memberInfo.get("USER_NAME"));
		member.setBirth_day(memberInfo.get("BIRTHD"));
		member.setSex(memberInfo.get("SEX"));


//		model.addAttribute("member", member);
		model.addAttribute("memberInfo", member);
		return String.format(basePath, homepage.getFolder()) + "changePwForm";
	}

	@RequestMapping(value = {"/setPwForm.*"})
	public String changePwForm2(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");


		String findpw = String.valueOf(request.getSession().getAttribute("findPw"));
		Member certMember = (Member) request.getSession().getAttribute("certMember");
		certMember.setCell_phone(member.getCell_phone());
		
		if ( StringUtils.isNotEmpty(findpw) && findpw.equals("o")) {

//			Map<String, String> memberInfo = MemberAPI.getDupUser("WEB", new Member(), "0004", certMember.get("CONN_INFO"));//ci로 유저 가져온다
		Map<String, String> memberInfo = null;
//		List<Map<String, String>> memberInfoList = MemberAPI.getDupUserList("WEB", new Member(), "0004", certMember.getCi_value());//ci로 유저 가져온다
		List<Map<String, String>> memberInfoList = MemberAPI.getDupUserList("WEB", certMember, "0001", null);//생년월일로 유저 가져온다


		if (memberInfoList == null || memberInfoList.size() < 1) {
			model.addAttribute("unusual", "true");
			joinService.alertMessage("통합회원 전환 진행을 하지 않았거나 존재하지 않는 회원입니다.", request, response);
			return null;
		}

		if(member != null && member.getWeb_id() != null) {
			for ( Map<String, String> map : memberInfoList ) {
				if (member.getWeb_id().equals(map.get("WEB_ID"))) {
					memberInfo = map;
					break;
				}
			}
		}

//		Member certMember = (Member) request.getSession().getAttribute("certMember");
//		if ( StringUtils.isNotEmpty(findpw) && findpw.equals("o")) {
//
//			Map<String, String> memberInfo = MemberAPI.getDupUser("WEB", new Member(), "0004", certMember.getCi_value());//ci로 유저 가져온다

			if ( memberInfo == null) {
				model.addAttribute("unusual", "true");
				joinService.alertMessage("가입된 이용자가 아닙니다.", request, response);
				return null;
			}

			if (!member.getMember_name().equals(memberInfo.get("USER_NAME"))) {
				model.addAttribute("unusual", "true");
				joinService.alertMessage("입력하신 정보가 올바르지 않습니다. 입력 정보를 확인해주세요. ", request, response);
				System.out.println("@@@@@@@@@@@@@@@@ setPwError : 001 : " + certMember.getCi_value() + ", " + member.getMember_name() + ", " + memberInfo.get("USER_NAME"));
				return null;
			}

			if (!member.getWeb_id().equals(memberInfo.get("WEB_ID"))) {
				model.addAttribute("unusual", "true");
				joinService.alertMessage("입력하신 정보가 올바르지 않습니다. 입력 정보를 확인해주세요.", request, response);
				System.out.println("@@@@@@@@@@@@@@@@ setPwError : 002 : "  + certMember.getCi_value() + ", " + member.getWeb_id() + ", " + memberInfo.get("WEB_ID"));
				return null;
			}

			if (!member.getCell_phone().equals(memberInfo.get("MOBILE_NO").replaceAll("-", ""))) {
				model.addAttribute("unusual", "true");
				joinService.alertMessage("입력하신 정보가 올바르지 않습니다. 입력 정보를 확인해주세요.", request, response);
				System.out.println("@@@@@@@@@@@@@@@@ setPwError : 003 : "  + certMember.getCi_value() + ", " + member.getCell_phone() + ", " + memberInfo.get("MOBILE_NO"));
				return null;
			}

			model.addAttribute("unusual", "false");

			member.setUser_id(memberInfo.get("USER_ID"));
			model.addAttribute("memberInfo", member);
		} else {
			model.addAttribute("unusual", "true");
			joinService.alertMessage("잘못된 접근입니다.", request, response);
			return null;
		}

		return String.format(basePath, homepage.getFolder()) + "changePwForm2";
	}

	@RequestMapping(value = {"/createIdForm.*"})
	public String createIdForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/changePwForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}
		member = getSessionMemberInfo(request);
		Map<String, String> memberInfo = MemberAPI.getMember("WEB", member);
		member.setMember_name(memberInfo.get("USER_NAME"));
		member.setBirth_day(memberInfo.get("BIRTHD"));
		member.setSex(memberInfo.get("SEX"));


		model.addAttribute("member", member);
		model.addAttribute("memberInfo", member);
		return String.format(basePath, homepage.getFolder()) + "createIdForm";
	}

	@RequestMapping(value = {"/secessionForm.*"})
	public String secessionForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/changePwForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}

		member = getSessionMemberInfo(request);
		Map<String, String> memberInfo = MemberAPI.getMember("WEB", member);
		member.setMember_name(memberInfo.get("USER_NAME"));
		member.setBirth_day(memberInfo.get("BIRTHD"));
		member.setSex(memberInfo.get("SEX"));


		model.addAttribute("member", member);
		model.addAttribute("memberInfo", member);
		return String.format(basePath, homepage.getFolder()) + "secessionForm";
	}

	@RequestMapping(value = { "/changePw.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse changePw(Member member, BindingResult result, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/changePwForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()), request, response);
			return null;
		}

		JsonResponse res = new JsonResponse(request);

		if (!result.hasErrors()) {
			if (MemberAPI.checkMemberPasswd("WEB", member)) {
				MemberAPI.updateMemberPasswd("WEB", getSessionUserId(request), member.getMemberNewPw());
				int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/changePwForm.do");
				res.setUrl(String.format("https://%s/%s/intro/join/changePwForm.do?menu_idx=%d", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), menuIdx));
				res.setValid(true);
				res.setMessage("비밀번호가 정상적으로 변경되었습니다.");
			} else {
				res.setValid(false);
				res.setMessage("기존 비밀번호가 올바르지 않습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = { "/setPw.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse setPw(Member member, BindingResult result, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		JsonResponse res = new JsonResponse(request);

		if (!result.hasErrors()) {
			if (MemberAPI.updateMemberPasswd("WEB", member.getUser_id(), member.getMemberNewPw())) {
				int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/login/index.do");
				String before_url = UriEncoder.encode(String.format("https://%s/%s/index.do", homepage.getDomainWithoutProtocol(), homepage.getContext_path()));

				res.setUrl(String.format("https://%s/%s/intro/login/index.do?menu_idx=%d&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), menuIdx, before_url));
				res.setValid(true);
				res.setMessage("비밀번호가 정상적으로 설정되었습니다.");
			} else {
				res.setValid(false);
				res.setMessage("비밀번호 설정에 실패했습니다. 관리자에게 문의하세요.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = { "/secession.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse secession(Member member, BindingResult result, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()), request, response);
			return null;
		}

		JsonResponse res = new JsonResponse(request);

		if (!result.hasErrors()) {
			member.setUser_id(getSessionUserId(request));
			member.setLoca(getSessionMemberInfo(request).getLoca());

			Map<String, Object> loanList = LibSearchAPI.getMyLibraryList("WEB", member.getUser_id(), "LOAN", "0001");
			List<Map<String, Object>> loanList1 = (List<Map<String, Object>>) loanList.get("dsMyLibraryList");

			if (loanList1 != null && loanList1.size() > 0) {
				res.setValid(false);
				res.setMessage("미반납 도서가 있는 경우 탈퇴 하실 수 없습니다.");
			} else {
				// 아이디, 비번, 이름 복호화
				if(memberService.decryptMember(member) == false) {
					res.setValid(false);
					res.setMessage("비밀번호를 다시 확인하세요");
					return res;
				}

				if (MemberAPI.checkMemberPasswd("WEB", member)) {
					Map<String, String> map = MemberAPI.deleteMember("WEB", getSessionMemberInfo(request));

					if ( map == null ) {
						request.getSession().invalidate();
						res.setUrl(String.format("http://%s/%s/index.do", homepage.getDomainWithoutProtocol(), homepage.getContext_path()));
						res.setValid(true);
						res.setMessage("정상적으로 탈퇴 되었습니다. 이용해 주셔서 감사합니다.");
					}
					else {
						String code = map.get("code");
						String message = map.get("message");

						res.setValid(false);
						if(StringUtils.isEmpty(message)) {
							res.setMessage("삭제 실패하였습니다(" + code + "). 잠시후 다시 시도해주세요.");
						} else {
							res.setMessage(message);
						}
					}
				} else {
					res.setValid(false);
					res.setMessage("비밀번호가 올바르지 않습니다.");
				}
			}

		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/findMemberIdForm.*"})
	public String findMemberIdForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		model.addAttribute("memberInfo", member);
		return String.format(basePath, homepage.getFolder()) + "findMemberIdForm";
	}

	@RequestMapping(value = {"/findId.*"})
	public String findId(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		model.addAttribute("memberInfo", MemberAPI.getMember("WEB", member));
		return String.format(basePath, homepage.getFolder()) + "findId_ajax";
	}

	@RequestMapping(value = {"/findMemberPwForm.*"})
	public String findMemberPwForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		model.addAttribute("memberInfo", member);
		return String.format(basePath, homepage.getFolder()) + "findMemberPwForm";
	}

	@RequestMapping(value = {"/bookConnIdForm.*"})
	public String bookConnIdForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		model.addAttribute("memberInfo", member);
		return String.format(basePath, homepage.getFolder()) + "bookConnIdForm";
	}


	@RequestMapping(value = { "/findMemberId.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse findMemberId(Member member, BindingResult result, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		JsonResponse res = new JsonResponse(request);

		ValidationUtils.rejectIfEmpty(result, "member_name", "성명을 입력해주세요.");
		ValidationUtils.rejectIfEmpty(result, "birth_day", "생년월일을 입력해주세요.");
		ValidationUtils.rejectExceptNumber(result, "birth_day", "생년월일은 숫자만 입력가능합니다.");
		ValidationUtils.rejectIfEmpty(result, "cell_phone", "휴대전화번호를 입력해주세요.");
		ValidationUtils.rejectExceptNumber(result, "cell_phone", "휴대저화번호는 숫자만 입력가능합니다.");

		if (!result.hasErrors()) {
			member.setCheck_certify_type("MOBILE");
			member.setCheck_certify_data(member.getCell_phone());
			Map<String, String> memberInfo = MemberAPI.getMemberCertify("WEB", member);
			if (memberInfo != null) {
				res.setUrl("findId.do?user_id="+memberInfo.get("USER_ID"));
				res.setValid(true);
			} else {
				res.setValid(false);
				res.setMessage("입력하신 정보와 일치하는 정보가 존재하지 않습니다.\n입력 정보를 확인해주세요");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = { "/userInfoSearch.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse userInfoSearch(Member member, BindingResult result, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		JsonResponse res = new JsonResponse(request);

		ValidationUtils.rejectIfEmpty(result, "user_id", "대출자번호를 입력해주세요.");
		ValidationUtils.rejectIfEmpty(result, "user_name", "이름을 입력해주세요.");

		if (!result.hasErrors()) {
			Map<String, String> memberInfo = MemberAPI.getMember("WEB", member);
			if (memberInfo != null) {

				if(memberInfo.get("USER_NAME").toString().equals(member.getUser_name())) {

					if(StringUtils.isNotEmpty(memberInfo.get("WEB_ID"))) {
						res.setValid(false);
						res.setMessage("아이디가 존재합니다.\n아이디 찾기 후 로그인 하시기 바랍니다.");
						System.out.println("WEB ID already exsits");
						return res;
					}

					String status = MemberAPI.getCheckBookConn("WEB", memberInfo);
					if(StringUtils.equals(status, "COMPLETE")) {
						res.setValid(true);
						res.setUrl("bookConnCert.do?menu_idx=" + member.getMenu_idx());
						request.getSession().setAttribute("memberInfo", memberInfo);
					} else {
						res.setValid(false);
						res.setMessage("책이음 회원이 아닙니다. 도서관에 문의하세요.");
						System.out.println("API action.lnk.LnkBcReqUserStatus NOTAPPLY");
					}
				} else {
					res.setValid(false);
					res.setMessage("등록되지 않은 사용자입니다. 도서관에 문의하세요.");
					System.out.println("API member : " + memberInfo.get("USER_NAME").toString() + ", INPUT member : " + member.getUser_name());
					System.out.println("USER_ID : " + member.getUser_id() + ", user_name : " + member.getUser_name());
				}

			} else {
				res.setValid(false);
				res.setMessage("등록되지 않은 사용자입니다. 도서관에 문의하세요.");
				System.out.println("userInfoSearch.do MemberAPI.getMember IS NULL");
				System.out.println("USER_ID : " + member.getUser_id() + ", user_name : " + member.getUser_name());
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/bookConnCert.*"}, method = RequestMethod.GET)
	public String bookConnCert(Model model, Member member, HttpServletRequest request) {
		Homepage homepage = (Homepage)request.getAttribute("homepage");

		model.addAttribute("memberInfo", member);

		return String.format(basePath, homepage.getFolder()) + "bookConnCert";
	}

	@RequestMapping(value = {"/bookConnIdEdit.*"})
	public String bookConnIdEdit(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		@SuppressWarnings("unchecked")
		Map<String, String> memberInfo = (Map<String, String>)request.getSession().getAttribute("memberInfo");
		Member certMember = (Member)request.getSession().getAttribute("certMember");

		String mobile_no = StringUtils.defaultString((String)memberInfo.get("MOBILE_NO")).replaceAll("-", "");
		String cell_phone = StringUtils.defaultString(certMember.getCell_phone()).replaceAll("-", "");

		String conn_info = (String)memberInfo.get("CONN_INFO");
		String ci_value = certMember.getCi_value();

		if(!cell_phone.equals(mobile_no)) {
			joinService.alertMessageAndUrl("휴대전화 번호가 일치하지 않습니다.",String.format("/%s/intro/join/bookConnIdForm.do?menu_idx=%s", homepage.getContext_path(), member.getMenu_idx()), request, response);
		}

		if(!ci_value.equals(conn_info)) {
			joinService.alertMessageAndUrl("본인인증 정보가 일치하지 않습니다.",String.format("/%s/intro/join/bookConnIdForm.do?menu_idx=%s", homepage.getContext_path(), member.getMenu_idx()), request, response);
		}

		member.setUser_id(memberInfo.get("USER_ID").toString());

		model.addAttribute("member", member);

		return String.format(basePath, homepage.getFolder()) + "bookConnIdEdit";
	}

	@RequestMapping(value = {"/webIdSave.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse webIdSave(Member member, BindingResult result, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		/* 유효성 검증 >>>>> */
		JsonResponse res = new JsonResponse(request);
		ValidationUtils.rejectIfEmpty(result, "web_id", "아이디를 입력해주세요.");
		ValidationUtils.rejectOnlyEngNum(result, "web_id", "아이디는 영문 또는 숫자만 사용가능합니다.");
		ValidationUtils.rejectOnlyEngNum(result, "web_id", 6, 20, "아이디는 영문, 숫자 조합 6자 이상 20자 이하로 입력하세요.");
		ValidationUtils.rejectIfEmpty(result, "member_pw", "비밀번호를 입력해주세요.");
		/* <<<<< 유효성 검증 */

		if(!result.hasErrors()) {
			if(member.getEditMode().equals("ADD")) {
				@SuppressWarnings("unchecked")
				Map<String, String> memberInfo = (Map<String, String>)request.getSession().getAttribute("memberInfo");

				try {
					String cell_phone = (String)memberInfo.get("MOBILE_NO");
					member.setCell_phone1(cell_phone.substring(0, 3));
					member.setCell_phone2(cell_phone.substring(3, 7));
					member.setCell_phone3(cell_phone.substring(7));
					member.setZipcode((String)memberInfo.get("ZIP_CODE"));
					member.setAddress1((String)memberInfo.get("ADDRS"));
					member.setSms_service_yn(memberInfo.get("SMS_CHECK"));
					member.setEmail_service_yn(memberInfo.get("MAIL_CHECK"));
				} catch(NullPointerException e) {
					res.setValid(false);
					res.setMessage("책이음 웹 아이디 생성에 실패하였습니다. 도서관에 문의하세요.");
					System.out.println("webIdSave.do API MEMBER PARAMS IS NULL");
					return res;
				}

				if(MemberAPI.updateMember("WEB", member, true)) {
					res.setValid(true);
					res.setMessage("책이음 웹 아이디 생성이 완료되었습니다.");
					res.setUrl(String.format("/%s/index.do", homepage.getContext_path()));
				} else {
					res.setValid(false);
					res.setMessage("책이음 웹 아이디 생성에 실패하였습니다. 도서관에 문의하세요.");
					System.out.println("webIdSave.do MemberAPI.updateMember CREATE FAIL");
//					res.setUrl(String.format("/%s/index.do", homepage.getContext_path()));
				}

			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		request.getSession().removeAttribute("memberInfo");

		return res;
	}

	@RequestMapping(value = {"/integration.*"})
	public String integration(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Member sessionMember = getSessionMemberInfo(request);
		sessionMember.setMenu_idx(member.getMenu_idx());
		model.addAttribute("newMember", sessionMember);
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_name("통합회원 전환");
		request.setAttribute("menuOne", menuOne);
		model.addAttribute("libraryList", LibSearchAPI.getLibraryList());
		model.addAttribute("prtcNotice",MemberAPI.getPrtcNoticeList("WEB"));
		return String.format(basePath, homepage.getFolder()) + "integration";
	}

	@RequestMapping(value = {"/integration1.*"})
	public String integration1(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Member sessionMember = getSessionMemberInfo(request);
		sessionMember.setMenu_idx(member.getMenu_idx());
		model.addAttribute("newMember", sessionMember);
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_name("통합회원 전환");
		request.setAttribute("menuOne", menuOne);
		return String.format(basePath, homepage.getFolder()) + "integration1";
	}

	@RequestMapping(value = {"/integration2.*"}, method=RequestMethod.POST)
	public String integration2(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");


		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_name("아이디 선택");
		request.setAttribute("menuOne", menuOne);
		Object tempObj = request.getSession().getAttribute("certMember");
		Member certMember = null;
		boolean hasCert = false;
		if (tempObj != null && tempObj instanceof Member) {
			certMember = (Member) tempObj;
			hasCert = true;
		} else {
			certMember = getSessionMemberInfo(request);
			if (certMember != null && StringUtils.isEmpty(certMember.getCi_value())) {
				return "redirect:integration1.do?menu_idx="+member.getMenu_idx();
			}
		}
		List<Map<String, String>> ciList = MemberAPI.getDupUserList("WEB", certMember, "0004", certMember.getCi_value());
		List<Map<String, String>> memberList = new ArrayList<Map<String, String>>();
		List<String> userIdList = new ArrayList<String>();
		List<String> userSeqNoList = new ArrayList<String>();
		if (ciList == null || ciList.size() < 1) {
//			siteService.alertMessage("조회된 결과가 없습니", request, response);
//			return null;
			ciList = MemberAPI.getDupUserList("WEB", certMember, "0001", certMember.getCi_value());
			Member loginMember = getSessionMemberInfo(request);
			if (loginMember.isLogin()) {
				ciList = MemberAPI.getDupUserList("WEB", getSessionMemberInfo(request), "0001", "");
			}
		}
//
//		if (ciList == null || ciList.size() < 1) {
//			if (isLogin(request)) {
//				Member loginMember = getSessionMemberInfo(request);
//				Map<String, String> map = MemberAPI.getMember("WEB", loginMember);
//				if (map != null) {
//					ciList.add(map);
//				}
//			}
//		}

		for (Map<String, String> map : ciList) {
			if (!userIdList.contains(map.get("USER_ID"))) {
				memberList.add(map);
				userIdList.add(map.get("USER_ID"));
				userSeqNoList.add(map.get("SEQ_NO"));
			}

			Member tempMember = new Member();
			tempMember.setMember_name(map.get("USER_NAME"));
			tempMember.setBirth_day(map.get("BIRTHD"));
			tempMember.setMobile_no(map.get("MOBILE_NO"));
			List<Map<String, String>> tempList = MemberAPI.getDupUserList("WEB", tempMember, "0001", "");
			if (tempList != null && tempList.size() > 0) {
				for (Map<String, String> map2 : tempList) {
					if (!userIdList.contains(map2.get("USER_ID"))) {
						memberList.add(map2);
						userIdList.add(map2.get("USER_ID"));
						userSeqNoList.add(map2.get("SEQ_NO"));
					}
				}
			}
		}

		if ( StringUtils.isNotEmpty(certMember.getCell_phone()) ) {
			Member tempMember = new Member();
			tempMember.setMember_name(certMember.getMember_name());
			tempMember.setBirth_day(certMember.getBirth_day());
			tempMember.setMobile_no(certMember.getCell_phone());
			List<Map<String, String>> tempList = MemberAPI.getDupUserList("WEB", tempMember, "0001", "");
			if (tempList != null && tempList.size() > 0) {
				for (Map<String, String> map2 : tempList) {
					if (!userIdList.contains(map2.get("USER_ID"))) {
						memberList.add(map2);
						userIdList.add(map2.get("USER_ID"));
						userSeqNoList.add(map2.get("SEQ_NO"));
					}
				}
			}
		}

		int decLength = 0;
		int asteriskLength = 0;
		for (String str : userIdList) {
			if (str.startsWith("*")) {
				asteriskLength++;
			} else {
				decLength++;
			}
		}
		member.setCi_value(certMember.getCi_value());
		member.setDi_value(certMember.getDi_value());
		member.setIntegrationIdList(StringUtils.join(userIdList, ","));
		member.setIntegrationSeqNoList(StringUtils.join(userSeqNoList, ","));
		if (hasCert) {
			member.setSex(certMember.getSex());
			member.setMember_name(certMember.getMember_name());
			member.setBirth_day(certMember.getBirth_day());
		}
//		request.getSession().setAttribute("certMember", certMember);
		model.addAttribute("multiId", (decLength > 0 && asteriskLength > 0));
		model.addAttribute("dupList", memberList);
		model.addAttribute("newMember", member);
		return String.format(basePath, homepage.getFolder()) + "integration2";
	}

	@RequestMapping(value = {"/integration3.*"})
	public String integration3(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		//member = 일루스에서 선택한 회원.
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		if (StringUtils.equals(member.getUnAgreeFlag(), "0002")) {
			menuOne.setMenu_name("회원정보 수정");
		} else {
			menuOne.setMenu_name("통합회원 전환");
		}
		request.setAttribute("menuOne", menuOne);

		Member certMember = null;
		try {
			certMember = (Member) request.getSession().getAttribute("certMember");
		} catch ( Exception e ) {
		}

		boolean hasCert = false;
		if (certMember == null || StringUtils.isEmpty(certMember.getCertType())) {
			//로그인하고 인증없이 들어오는 경우 로그인한 세션정보를 가져온다.
			certMember = getSessionMemberInfo(request);
		} else {
			hasCert = true;
			//회원가입 또는 로그인 인증 하고 들어오는 경우
			//request에서 받은 certMember의 값을 그대로 쓴다.
		}

		certMember.setUnAgreeFlag(member.getUnAgreeFlag());
		certMember.setUser_id(member.getIntegrationId());
		certMember.setIntegrationId(member.getIntegrationId());
		certMember.setIntegrationIdList(member.getIntegrationIdList());
		certMember.setIntegrationSeqNo(member.getIntegrationSeqNo());
		certMember.setIntegrationSeqNoList(member.getIntegrationSeqNoList());

		Map<String, String> memberInfo = MemberAPI.getMember("WEB", certMember);

		if (!hasCert) {
			//로그인하고 인증없이 들어오는 경우 선택 아이디의 정보로 넣는다.
			certMember.setMember_name(memberInfo.get("USER_NAME"));
    		certMember.setBirth_day(memberInfo.get("BIRTHD"));
    		certMember.setSex(memberInfo.get("SEX"));
    		//

		} else {
			//인증받고 온 경우 인증받은걸로 한다.
			//certMember자체가 인증결과이기때문에 아무것도 안한다.
			if (StringUtils.equals(certMember.getSex(), "1") || StringUtils.equals(certMember.getSex(), "0001")) {
				//1남자
				certMember.setSex("0001");
			} else {
				//2여자
				certMember.setSex("0002");
			}
		}
		certMember.setWeb_id(memberInfo.get("WEB_ID"));
		certMember.setSms_service_yn(memberInfo.get("SMS_CHECK"));
		certMember.setEmail_service_yn(memberInfo.get("MAIL_CHECK"));

		String phone = memberInfo.get("TEL_NO");
		mergeTelno(certMember, phone);

		if (StringUtils.isEmpty(certMember.getCell_phone())) {
			String cellPhone = memberInfo.get("MOBILE_NO");
			mergeCellphone(certMember, cellPhone);
		}

		String email = memberInfo.get("EMAIL");
		if ( !StringUtils.isEmpty(email) ) {
			String[] arr = email.split("@");
			if (arr != null && arr.length > 1) {
				certMember.setEmail1(arr[0]);
				if ( arr.length > 1 ) {
					certMember.setEmail2(arr[1]);
				}
			}
		}

		/*member.setDi_value(memberInfo.get("DUPINFO"));*/
//		certMember.setCi_value(memberInfo.get("CONN_INFO"));
		certMember.setZipcode(memberInfo.get("ZIP_CODE"));
		certMember.setAddress1(memberInfo.get("ADDRS").replaceAll("null", ""));
		certMember.setLoca(memberInfo.get("LOCA"));
		certMember.setLoca_name(memberInfo.get("LOCA_NAME"));

		model.addAttribute("newMember", new Member());
		model.addAttribute("member", certMember);
		model.addAttribute("memberInfo", certMember);
		model.addAttribute("libList", MemberAPI.getLibInfoQry("WEB", "0001", null));
		model.addAttribute("telCode", codeService.getCode("CMS", "C0003"));
		model.addAttribute("phoneCode", codeService.getCode("CMS", "C0002"));
		model.addAttribute("email", codeService.getCode("CMS", "C0010"));


		return String.format(basePath, homepage.getFolder()) + "integration3";
	}

	@RequestMapping (value = { "/checkDls.*" })
	public String checkDls(Model model, HttpServletRequest request) {
		String ck_flag = request.getParameter("ck_flag");
		String member_nm = request.getParameter("member_nm");
		System.out.println("@@@@@@@@@@@@@@@@ ck_flag : " + ck_flag);
		System.out.println("@@@@@@@@@@@@@@@@ member_nm : " + member_nm);
		boolean isDlsMember = false;
		String isDlsMemberName=null;
		
		if (StringUtils.isNotEmpty(ck_flag)) {
			if (StringUtils.equals(ck_flag.toLowerCase(), "true")) {
				Member member = getSessionMemberInfo(request);
				System.out.println("@@@@@@@@@@@@@@@@ member.getMember_name() : " + member.getMember_name());
//				System.out.println("@@@@@@@@@@@@@@@@ member.getMember_name() : " + member.getMember_name());
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//				int currYear = Integer.parseInt(sdf.format(new Date()));
//				if (StringUtils.isNotEmpty(member.getBirth_day())) {
//					int memberYear = Integer.parseInt(member.getBirth_day().substring(0, 4));
//					if (currYear - memberYear >= 20) {
//						isDlsMember = false;
//					}
//				} else {
					if (StringUtils.isNotEmpty(member_nm)) {
//						System.out.println("@@@@@@@@@@@@@@@@ dls check1 ");
						if (StringUtils.equals(member.getMember_name(), member_nm)) {
//							System.out.println("@@@@@@@@@@@@@@@@ dls check2 ");
							member.setDls_id(String.valueOf(request.getSession().getAttribute("dls_id")));
							member.setUser_ip(String.valueOf(request.getSession().getAttribute("dls_ip")));
							member.setLib_id(member.getUser_id());
							member.setUser_name(member.getMember_name());
							if (MemberAPI.updateMemberRegular("WEB", member, false)) {
//								System.out.println("@@@@@@@@@@@@@@@@ dls check3 ");
								memberService.addDlsMember(member);
								isDlsMember = true;
								isDlsMemberName= "Y";
							} else {
//								System.out.println("@@@@@@@@@@@@@@@@ dls check4 ");
								isDlsMember = false;
								isDlsMemberName= "N";
							}
						}
					}
//				}
			}
		}

		model.addAttribute("isDlsMember", isDlsMember);
		return basePath + "checkDls_ajax";
	}

	/**
	 * 회원가입시 DLS인증
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping (value = { "/checkDlsA.*" })
	public String checkDlsA(Model model, HttpServletRequest request) {
		String ck_flag = request.getParameter("ck_flag");
		String member_nm = request.getParameter("member_nm");
		System.out.println("@@@@@@@@@@@@@@@@ ck_flagA : " + ck_flag);
		System.out.println("@@@@@@@@@@@@@@@@ member_nmA : " + member_nm);
		boolean isDlsMember = false;
		String isDlsMemberName=null;

		if (StringUtils.isNotEmpty(ck_flag)) {
//			System.out.println("@@@@@@@@@@@@@@@@ dlsA check1 ");
			if (StringUtils.equals(ck_flag.toLowerCase(), "true")) {
//				System.out.println("@@@@@@@@@@@@@@@@ dlsA check2 ");
				Member member = (Member)loginService.getSessionMember(request);
				System.out.println("@@@@@@@@@@@@@@@@ member.getMember_name()1 : " + member.getMember_name());
				if(StringUtils.isEmpty(member.getMember_name())) {
					member = (Member) request.getSession().getAttribute("certMember");
				}
				System.out.println("@@@@@@@@@@@@@@@@ member.getMember_name()2 : " + member.getMember_name());
				if (StringUtils.isNotEmpty(member_nm)) {
//					System.out.println("@@@@@@@@@@@@@@@@ dlsA check3 ");
					
					if (StringUtils.equals(member.getMember_name(), member_nm)) {
//						System.out.println("@@@@@@@@@@@@@@@@ dlsA check4 ");
//						MemberAPI.addMemberRegular("WEB", member);
						member.setDls_id(String.valueOf(request.getSession().getAttribute("dls_id")));
						request.getSession().setAttribute("certMember", member);
//						member.setUser_ip(String.valueOf(request.getSession().getAttribute("dls_ip")));
//						member.setLib_id(member.getUser_id());
//						member.setUser_name(member.getMember_name());
//						memberService.addDlsMember(member);
						isDlsMemberName= "Y";
						isDlsMember = true;
					} else {
						isDlsMemberName= "N";
					}
				}
			}
		}

		if (!isDlsMember) {
			request.getSession().setAttribute("dls_id", null);
		}

		model.addAttribute("isDlsMemberName", isDlsMemberName);
		model.addAttribute("isDlsMember", isDlsMember);
		return basePath + "checkDlsA_ajax";
	}

	@RequestMapping (value = { "/dlsIdCheck.*" })
	public @ResponseBody JsonResponse dlsIdCheck(Member member, BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse(request);

		if ( !result.hasErrors() ) {
			boolean hasId = memberService.isPassDlsId(member);
			request.getSession().setAttribute("dls_id", null);
			request.getSession().setAttribute("dls_ip", null);
			if (!hasId) {
				request.getSession().setAttribute("dls_id", member.getDls_id());
				request.getSession().setAttribute("dls_ip", request.getRemoteAddr());
			}
			res.setValid(hasId);
		}

		return res;
	}


	@RequestMapping(value = {"/changeName.*"})
	public String changeName(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}

		String oldName = String.valueOf(request.getSession().getAttribute("oldName"));
		String newName = String.valueOf(request.getSession().getAttribute("newName"));

		if (StringUtils.isEmpty(oldName) || StringUtils.isEmpty(newName)) {
			homepageService.alertMessageAndUrl("잘못된 접근입니다.", String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path()), request, response);
			return null;
		}

		Member sessionMember = getSessionMemberInfo(request);
		sessionMember.setMenu_idx(member.getMenu_idx());
		model.addAttribute("newMember", sessionMember);
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_name("성명 변경");
		request.setAttribute("menuOne", menuOne);
		return String.format(basePath, homepage.getFolder()) + "changeName";
	}

	@RequestMapping (value = { "/cName.*" })
	public @ResponseBody JsonResponse cName(Member member, BindingResult result, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		JsonResponse res = new JsonResponse(request);

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			res.setValid(false);
			res.setUrl(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx()));
			result.reject("로그인 후 이용가능합니다.");
			return res;
		}

		String oldName = String.valueOf(request.getSession().getAttribute("oldName"));
		String newName = String.valueOf(request.getSession().getAttribute("newName"));

		if (StringUtils.isEmpty(oldName) || StringUtils.isEmpty(newName)) {
			res.setValid(false);
			res.setUrl(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path()));
			result.reject("잘못된 접근입니다.");
			return res;
		}

		if ( !result.hasErrors() ) {
			Member updateMember = new Member();
			updateMember.setMember_name(newName);
			updateMember.setUser_id(getSessionUserId(request));
			boolean updateResult = MemberAPI.updateMemberName("WEB", updateMember);
			res.setValid(updateResult);

			if (updateResult) {
				memberService.addChangeNameHistory(getSessionMemberInfo(request));
				res.setUrl(String.format("/%s/intro/login/logout.do?relogin=true", homepage.getContext_path()));
				res.setMessage("정상적으로 변경되었습니다. 재로그인 후 이용하시기 바랍니다.");
			} else {
				res.setMessage("다시 시도해주세요.");
			}
		}

		return res;
	}
	
	/**
	 * 비대면 확인 입력 폼 - 준회원이 비대면 확인 서비스를 통해 정회원으로 전환
	 * @author whalesoft HAESU 2022. 03. 16.
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping (value = {"/untactForm.*"})
	public String untactForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		String requestURL = request.getRequestURL().toString();

		//로그인여부확인
		//비로그인은 이용불가
		if (!isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			int loginMenuIdx = menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 196));
			String before_url = String.format("/%s/intro/join/untactForm.do?menu_idx=%d", homepage.getContext_path(), member.getMenu_idx());
			joinService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("/%s/intro/login/index.do?menu_idx=%d&before_url=%s", homepage.getContext_path(), loginMenuIdx, before_url), request, response);
			return null;
		}

		//정회원여부확인
		//정회원은 이용불가
		Member sessionMemberInfo = getSessionMemberInfo(request);
		System.out.println("@@@@@@@@@ sessionMemberInfo.getUser_id() : " + sessionMemberInfo.getUser_id());
		System.out.println("@@@@@@@@@ sessionMemberInfo.getStatus_code() : " + sessionMemberInfo.getStatus_code());
		if (sessionMemberInfo.getStatus_code().equals("0001") || sessionMemberInfo.getStatus_code().equals("0")) {
			joinService.alertMessageAndUrl("이미 인증 받은 회원입니다.", String.format("/%s/index.do", homepage.getContext_path()), request, response);
			return null;
		}
		
		if (StringUtils.equals(sessionMemberInfo.getSex(), null) || StringUtils.equals(sessionMemberInfo.getSex(), "")) {
			request.getSession().invalidate();
			joinService.alertMessageAndUrl("회원의 성별이 존재하지 않습니다. 회원가입 최신화 단계를 진행해주세요.", String.format("/%s/intro/join/index.do?menu_idx=%d", homepage.getContext_path(), 70), request, response);
			return null;
		}
		Member loginMember = new Member();
		loginMember.setMember_id(sessionMemberInfo.getMember_id());
		String loginTime = loginservice.getLoginDate(loginMember);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = date.parse(loginTime);
		model.addAttribute("loginTime", dateTime.getTime());
		model.addAttribute("homepage", homepage);
		
		return String.format(basePath, homepage.getFolder()) + "untactForm";
	}
	
	/**
	 * 경북도민인증 결과 전송페이지
	 * @author whalesoft HAESU 2022. 03. 16.
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/untactReceive.*"})
	public String untactReceive(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		System.out.println("@@@@@@@@ untactReceive에 들어왔습니다.");
		System.out.println("@@@@@@@@@@@@@@@@ getFolder : " + homepage.getFolder());
		return String.format(basePath, homepage.getFolder()) + "untactReceive_ajax";
	}

	/**
	 * 비대면 확인 로직
	 * 주민등록번호와 이름을 입력 받는다.
	 *
	 *	@author whalesoft HAESU 2022. 03. 16.
	 * @param result
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping (value = {"/untactCheck.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse untactCheck(Member member, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);

		//정회원여부확인
		//정회원은 이용불가
		Member sessionMemberInfo = getSessionMemberInfo(request);
		System.out.println("@@@@@@@@@ sessionMemberInfo.getStatus_code() : " + sessionMemberInfo.getStatus_code());
		if (sessionMemberInfo.getStatus_code().equals("0001") || sessionMemberInfo.getStatus_code().equals("0")) {
			result.reject("이미 인증 받은 회원입니다.");
		}
//
		if (StringUtils.isEmpty(sessionMemberInfo.getMember_name())) {
			result.reject("비정상적인 접근입니다.");
		}


		if (!result.hasErrors()) {
//			member.setTx_id("2022031810033697500601011");
			
			Member cert = memberService.getTbPisc01(member);
		 	validateTbpisc01(cert,request,res);
		 	if(!res.isValid()) return res;
			
			/**
			 * 서비스 결과
			 * 1:성공
			 * 2:주민등록번호오류
			 * 3:성명오류
			 * 4:거주자아님
			 * 9:시스템오류
			 * 99:등록된이용기관이아님
			 */
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd"); 
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yyMMdd");
//			sessionMemberInfo.setBirth_day("19790630");
//			sessionMemberInfo.setMember_id("inmypart");
//			sessionMemberInfo.setUser_id("14703116000935");
			String sdfFormat = sessionMemberInfo.getBirth_day().substring(0,4) + "-" + sessionMemberInfo.getBirth_day().substring(4,6)+"-"+sessionMemberInfo.getBirth_day().substring(6,8);
			
			System.out.println(sessionMemberInfo.getBirth_day());
			System.out.println(sessionMemberInfo.getBirthday());
			Date formatDate = null;
			try {
				formatDate = dtFormat.parse(sdfFormat);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String strNewDtFormat = newDtFormat.format(formatDate);
			
			if (!StringUtils.equals(cert.getBirthday(), strNewDtFormat)) {
				res.setValid(false);
				res.setMessage("경북도민인증시 입력하신 생년월일과, 로그인한 회원의 생년월일이 일치하지 않습니다.\r\n확인 후 다시 진행해주세요.");
				return res;
			}
			
			if (!sessionMemberInfo.getMember_id().equals("inmypart")) {
				if (!StringUtils.startsWith(cert.getHangkikCd(), "47")) {
					res.setValid(false);
					res.setMessage("경상북도 거주자만 인증 가능합니다.");
					return res;
				}
			}
			
//
//			//ci 세팅
			Map<String, String> checkDupUser = MemberAPI.getMember("WEB", sessionMemberInfo);//아이디로 조회
			String ci = String.valueOf(checkDupUser.get("CONN_INFO"));//ci값 꺼내기
			sessionMemberInfo.setCi_value(ci);//ci 세팅

			String birth_day = sessionMemberInfo.getBirth_day();
			sessionMemberInfo.setBirth_day(birth_day.replaceAll("-", ""));//생년월일세팅
			sessionMemberInfo.setLoca(sessionMemberInfo.getLoca());//도서관부호 세팅
			sessionMemberInfo.setIn_ip(request.getRemoteAddr());//아이피 세팅
			
			Map<String, String> list = MemberAPI.updateMemberAgent("WEB",sessionMemberInfo);
			String regular = String.valueOf(list.get("code"));
			if (StringUtils.equals(regular, "0")) {
				res.setValid(true);
				res.setMessage("인증이 완료되었습니다.\r\n※ 재로그인 후 이용 가능합니다.");
				Homepage homepage = (Homepage) request.getAttribute("homepage");
//    			res.setUrl(String.format("/%s/intro/login/index.do?menu_idx=%d", homepage.getContext_path(), loginMenuIdx));
				res.setUrl(String.format("/%s/intro/login/logout.do?menu_idx=69&relogin=true", homepage.getContext_path()));
			} else {
				res.setValid(false);
				try {
					System.out.println("@@@@@@@@@@@@@@@@ untact failed MemberId 1 : " + getSessionMemberId(request));
					res.setMessage(String.valueOf(list.get("message")));
				} catch (Exception e) {
					res.setMessage("인증에 실패하였습니다. 도서관으로 문의 바랍니다.");
					System.out.println("@@@@@@@@@@@@@@@@ untact failed MemberId 2 : " + getSessionMemberId(request));
				}
			}

		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	/**
	 * YUNHAESU 20220318
	 * 도민인증 null체크 및 validation 체크
	 * @param cert
	 * @param request
	 * @return
	 */
	private JsonResponse validateTbpisc01(Member cert, HttpServletRequest request, JsonResponse res) {
		if (StringUtils.isEmpty(cert.getBirthday())) {
			res.setValid(false);
			res.setMessage("BirthDay가 null 입니다.");
			return res;
		}
		
		if(StringUtils.isEmpty(cert.getServiceResult())) {
			res.setValid(false);
			res.setMessage("ServiceResult가 null 입니다.");
			return res;
		}
		
		if (!StringUtils.equals(cert.getServiceResult(), "1")) {
			res.setValid(false);
			res.setMessage("주민등록번호를 확인해주세요.");
			return res;
		}
		
		if (StringUtils.isEmpty(cert.getHangkikCd()) || StringUtils.equalsIgnoreCase(cert.getHangkikCd(), "null")) {
			res.setValid(false);
			res.setMessage("인증에 오류가 발생하였습니다. 다시 시도해주세요.");
			return res;
		}
		
		res.setValid(true);
		return res;
	}
	
	/**
	 * 정회원전환 확인페이지
	 * @author whalesoft YONGJU 2022. 1. 7.
	 * @param model
	 * @param member
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/regularMember.*"})
	public String regularMember(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		//로그인여부확인
		//비로그인은 이용불가
		if (!isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			int loginMenuIdx = menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 5));
			String before_url = String.format("/%s/intro/join/untactForm.do?menu_idx=%d", homepage.getContext_path(), member.getMenu_idx());
			joinService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("/%s/intro/login/index.do?menu_idx=%d&before_url=%s", homepage.getContext_path(), loginMenuIdx, before_url), request, response);
			return null;
		}

		//정회원여부확인
		//정회원은 이용불가
		Member sessionMemberInfo = getSessionMemberInfo(request);
		if (sessionMemberInfo.getStatus_code().equals("0001") || sessionMemberInfo.getStatus_code().equals("0")) {
			joinService.alertMessageAndUrl("이미 인증 받은 회원입니다.", String.format("/%s/index.do", homepage.getContext_path()), request, response);
			return null;
		}

		return String.format(basePath, homepage.getFolder()) + "regularMember";
	}

	/**
	 * 약관인증(개인정보 재동의) 폼
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/reAgree.*"})
	public String reAgree(Model model, Member member, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		model.addAttribute("newMember", member);
		model.addAttribute("prtcNotice",MemberAPI.getPrtcNoticeList("WEB"));
//		model.addAttribute("libraryList", LibSearchAPI.getLibraryList());
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_name("이용약관 및 개인정보 수집·이용 재동의");
		request.setAttribute("menuOne", menuOne);
		return String.format(basePath, homepage.getFolder()) + "reAgree";
	}

	/**
	 * 약관인증(개인정보 재동의)
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping (value = { "/reAgreeA.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse reAgreeA(Member member, BindingResult result, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		JsonResponse res = new JsonResponse(request);

		if ( !result.hasErrors() ) {
			res.setValid(true);
			Member sessionMember = getSessionMemberInfo(request);
			sessionMember.setAgree_codes(member.getAgree_codes());
			MemberAPI.agreePrtcInfo("WEB", sessionMember.getUser_id(), sessionMember.getLoca(), sessionMember.getAgree_codes().replaceAll(" ", "").split(","));

			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR, 2);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			sessionMember.setAgree_date_str(sdf.format(cal.getTime()));
			HttpSession session = request.getSession();
			session.setAttribute(StaticVariables.MEMBER, sessionMember);

			res.setMessage("재동의가 완료되었습니다.");
			res.setUrl(String.format("/%s/index.do", homepage.getContext_path()));
		}
		else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	/**
	 * 최근접속등 표시 페이지
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/accessInfo.*"})
	public String accessInfo(Model model, Member member, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		model.addAttribute("newMember", member);
//		model.addAttribute("libraryList", LibSearchAPI.getLibraryList());
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		if (menuOne == null) {
			int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/modifyForm.do");
			return "redirect:/"+homepage.getContext_path()+"/intro/join/accessInfo.do?menu_idx="+menuIdx;
		}
		menuOne.setMenu_name("최근 접속 기록");
		request.setAttribute("menuOne", menuOne);
		return String.format(basePath, homepage.getFolder()) + "accessInfo";
	}

	/**
	 * 책이음회원전환
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/klMemberForm.*"})
	public String klMemberForm(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/modifyForm.do?menu_idx=%s", homepage.getDomainWithoutProtocol(),homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}

		model.addAttribute("newMember", member);
//		model.addAttribute("prtcNotice",MemberAPI.getPrtcNoticeList("WEB"));
//		model.addAttribute("libraryList", LibSearchAPI.getLibraryList());
		Menu menuOne = (Menu) request.getAttribute("menuOne");
		menuOne.setMenu_name("책이음서비스신청");
		request.setAttribute("menuOne", menuOne);
		return String.format(basePath, homepage.getFolder()) + "klMemberForm";
	}


	/**
	 * 책이음회원전환
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping (value = { "/klMemberSave.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse klMemberSave(Member member, BindingResult result, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		JsonResponse res = new JsonResponse(request);

		if ( !result.hasErrors() ) {
			res.setValid(true);

			Member sessionMember;
			try {
				sessionMember = (Member) request.getSession().getAttribute("tempMemberSession");
			} catch ( Exception e ) {
				sessionMember = getSessionMemberInfo(request);
			}

			if (sessionMember == null) {
				sessionMember = getSessionMemberInfo(request);
			}

//			String kl_member_yn = sessionMember.getKl_member_yn();
//			if (StringUtils.equals(kl_member_yn, "Y")) {
//				res.setMessage("회원님은 이미 책이음 회원입니다.");
//				return res;
//			}
//
//			if (StringUtils.equals(sessionMember.getStatement_alias(), "책이음서비스")) {
//				res.setMessage("이미 책이음회원 전환신청을 하였습니다.\n동작구 통합도서관 소속 도서관에 방문하여 책이음회원 전환을 진행해 주세요.\n책이음회원이 아닐 경우 상호대차 이용이 불가능합니다.");
//				return res;
//			}


//			String kl_member_yn2 = request.getParameter("kl_member_yn");
//			if (StringUtils.equals(kl_member_yn2, "Y")) {
//				String certYn = sessionMember.getCert_yn();
//				if (!StringUtils.equals(certYn, "Y")) {
//					res.setMessage("개인식별정보가 누락되었으니 기존회원 재인증을 통해 인증 후 신청 바랍니다.");
//					return res;
//				}
//			}


			//개인정보 수집이용에 대한 동의
			ApiResponse agreeInfo = MemberAPI.agreePrtcInfoWithGrpCode("WEB", sessionMember, "0002", "4,5".split(","));

			if (agreeInfo.getStatus()) {
				res.setValid(true);
//				res.setMessage("책이음전환 신청이 완료되었습니다.\n\n책이음회원 전환을 완료하기 위해서는 도서관에 방문하여 책이음회원 전환을 해야 책이음회원전환이 완료되며, 상호대차 이용이 가능하므로 반드시 도서관에 방문하여 책이음회원전환을 진행해주시길 바랍니다.");
//				res.setMessage("책이음 전환 신청이 완료되었습니다.\n\n책이음회원 전환을 완료하기 위해서는 도서관에 방문하여 책이음회원 전환을 해야 책이음회원전환이 완료됩니다.");
				res.setMessage("책이음회원 전환 신청을 완료하였습니다.\n\n신분증을 지참하고 회원증을 발급 한 도서관에 방문하여 전환을 완료하시기 바랍니다.");

				res.setUrl(String.format("/%s/index.do", homepage.getContext_path()));
			} else {
				res.setValid(false);
				res.setMessage(agreeInfo.getMessage());
			}

		}
		else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	/**
	 * 패스워드 만료 페이지
	 * @author YONGJU 2018. 9. 27.
	 * @param member
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/passwordExpiry.*"})
	public String passwordExpiry(Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		return String.format(basePath, homepage.getFolder()) + "passwordExpiry";
	}

	private void mergeTelno(Member member, String phone) {
		if ( !StringUtils.isEmpty(phone) ) {
			phone = phone.replaceAll("-", "");
			try {
				Long.parseLong(phone);
				if ( phone.length() > 3 ) {
					member.setPhone1(phone.substring(0, 3));
				} else {
					member.setPhone1(phone.substring(0));
				}

				String phoneTemp = phone.substring(3);
				if ( phoneTemp.length() >= 8 ) {
					member.setPhone2(phone.substring(3, 7));
					member.setPhone3(phone.substring(7));
				} else {
					member.setPhone2(phone.substring(3, 6));
					member.setPhone3(phone.substring(6));
				}
			}
			catch (NumberFormatException e) {
				if (phone.length() >= 11) {
					member.setPhone1(phone.substring(0, 3));
					member.setPhone2(phone.substring(3, 7));
					member.setPhone3(phone.substring(7));
				} else if (phone.length() == 10) {
					member.setPhone1(phone.substring(0, 3));
					member.setPhone2(phone.substring(3, 6));
					member.setPhone3(phone.substring(6));
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

	private void mergeCellphone(Member member, String cellPhone) {
		if ( !StringUtils.isEmpty(cellPhone) ) {
			try {
				cellPhone = cellPhone.replaceAll("-", "");
				Long.parseLong(cellPhone);
				if ( cellPhone.length() > 3 ) {
					member.setCell_phone1(cellPhone.substring(0, 3));
				} else {
					member.setCell_phone1(cellPhone.substring(0));
				}

				String phoneTemp = cellPhone.substring(3);
				if ( phoneTemp.length() >= 8 ) {
					member.setCell_phone2(cellPhone.substring(3, 7));
					member.setCell_phone3(cellPhone.substring(7));
				} else {
					member.setCell_phone2(cellPhone.substring(3, 6));
					member.setCell_phone3(cellPhone.substring(6));
				}
			} catch (NumberFormatException e) {
				// 숫자가 아니면 파싱안함.
				if (cellPhone.length() >= 11) {
					member.setCell_phone1(cellPhone.substring(0, 3));
					member.setCell_phone2(cellPhone.substring(3, 7));
					member.setCell_phone3(cellPhone.substring(7));
				} else if (cellPhone.length() == 10) {
					member.setCell_phone1(cellPhone.substring(0, 3));
					member.setCell_phone2(cellPhone.substring(3, 6));
					member.setCell_phone3(cellPhone.substring(6));
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
	/**	경북 학생인증(정회원)
	 * @param model
	 * @param member
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = {"/indexDls.*"})
	public String editDLS(Model model, Member member,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			member.setBefore_url(String.format("https://%s/%s/intro/join/indexDls.do?menu_idx=%s", homepage.getDomainWithoutProtocol(),homepage.getContext_path(), member.getMenu_idx()));
			codeService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("https://%s/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getDomainWithoutProtocol(), homepage.getContext_path(), member.getMenu_idx(), member.getBefore_url()), request, response);
			return null;
		}
		
		return String.format(basePath, homepage.getFolder()) + "indexDls";
	}
	
	
	/**
	 * 회원가입 후 페이지
	 * @author whalesoft HAESU 2022. 3. 29.
	 * @param model
	 * @param member
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/changeover.*"})
	public String changeover(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		int dlsMenuIdx = menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 197));
		int untactMenuIdx = menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 196));

		model.addAttribute("dlsMenuIdx", dlsMenuIdx);
		model.addAttribute("untactMenuIdx", untactMenuIdx);

		return String.format(basePath, homepage.getFolder()) + "changeover";
	}

	@RequestMapping(value = "/qrCheck.*")
	public String qrCheck(Model model, HttpServletRequest request) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		return String.format(basePath, homepage.getFolder()) + "qrCheck";
	}

	@RequestMapping(value = "/qrLoginProc.*")
	public String qrLoginProc(@RequestParam(required = false) String training_idx, @RequestParam(required = false) String token, @RequestParam(required = false) String qr_count,
							  @RequestParam(required = false) String teach_idx, @RequestParam(required = false) String qr_check_type, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		try {
			if ("TEACH".equals(qr_check_type)) {
				Teach teach = new Teach();
				teach.setTeach_idx(Integer.parseInt(teach_idx));
				teach.setHomepage_id(homepage.getHomepage_id());

				Teach qrTeach = teachService.getTeachByQr(teach);

				if (qrTeach == null) {
					teachService.alertMessage("등록된 강좌가 없습니다.", request, response);
					return null;
				}

				if (!token.equals(qrTeach.getToken())) {
					teachService.alertMessage("이미 만료된 토큰입니다.", request, response);
					return null;
				}

				TeachBookManage teachBookManage = new TeachBookManage();
				teachBookManage.setStudent_name(member.getMember_name());
				teachBookManage.setApplicant_cell_phone(member.getCell_phone());
				teachBookManage.setTeach_idx(Integer.valueOf(teach_idx));

				if (teachBookManageService.checkTeachStudentCount(teachBookManage) <= 0) {
					teachBookManageService.alertMessage("해당 강좌신청자가 아닙니다.", request, response);
					return null;
				} else {
					TeachBookManage checkTeachBookManage = teachBookManageService.checkTeachStudent(teachBookManage);

					TeachBook teachBook = new TeachBook();
					teachBook.setHomepage_id(homepage.getHomepage_id());
					teachBook.setGroup_idx(qrTeach.getGroup_idx());
					teachBook.setCategory_idx(qrTeach.getCategory_idx());
					teachBook.setTeach_idx(qrTeach.getTeach_idx());

					Date today = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					teachBook.setTeach_date(sdf.format(today));
					teachBook.setStatus("1");
					teachBook.setAdd_id(member.getMember_id());

					if (checkTeachBookManage != null) {
						teachBook.setStudent_idx(checkTeachBookManage.getStudent_idx());

						if ("2".equals(checkTeachBookManage.getTeach_status()) || teachBookService.checkTeachBookStudentByDate(teachBook) > 0) {
							teachBookManageService.alertMessage("이미 출석체크가 완료되었습니다.", request, response);
							return null;
						}
					}

					teachBookManage.setTeach_status("2");
					teachBookManage.setTeach_type("1");
					teachBookManageService.modifyTeachStudent(teachBookManage);

					if ( teachBookService.checkTeachBookStudentByDate(teachBook) == 0 ) {
						teachBookService.addTeachBook(teachBook);
					}
				}
			} else {
				boolean sessionValid = SecuKeypadDecoder.sessionValidation(request);

				String decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);

				if (sessionValid) {
					if(decodeStr != null && !decodeStr.equals("")) {
						decodeStr = decodeStr.replace(" ", "&nbsp;");
						member.setMember_pw(decodeStr);
					}
				}

				Object result = LoginAPI.login(member);
				if ( result instanceof Member ) {
					member = (Member) result;

					TrainingBookQrManage trainingBookQrManage = new TrainingBookQrManage();
					trainingBookQrManage.setHomepage_id(homepage.getHomepage_id());
					trainingBookQrManage.setTraining_idx(Integer.parseInt(training_idx));
					trainingBookQrManage.setQr_count(Integer.parseInt(qr_count));

					TrainingBookQrManage qrTraining = trainingBookQrManageService.getTrainingBookQrManage(trainingBookQrManage);

					if (qrTraining == null) {
						trainingBookManageService.alertMessage("생성된 qr이 없습니다.", request, response);
						return null;
					}

					if (!token.equals(qrTraining.getToken())) {
						trainingService.alertMessage("이미 만료된 토큰입니다.", request, response);
						return null;
					}

					TrainingBookManage trainingBookManage = new TrainingBookManage();
					trainingBookManage.setWeb_id(member.getMember_id());
					trainingBookManage.setQr_count(Integer.valueOf(qr_count));
					trainingBookManage.setTraining_idx(Integer.valueOf(training_idx));

					if (trainingBookManageService.checkTrainingStudentCount(trainingBookManage) <= 0) {
						trainingBookManageService.alertMessage("해당 연수신청자가 아닙니다.", request, response);
						return null;
					} else {
						TrainingBookManage checkTrainingBookManage = trainingBookManageService.checkTrainingStudent(trainingBookManage);

						if (checkTrainingBookManage != null) {
							if ("2".equals(checkTrainingBookManage.getTraining_status())) {
								trainingBookManageService.alertMessage("이미 출석체크가 완료되었습니다.", request, response);
								return null;
							}
						}

						trainingBookManage.setTraining_status("2");
						trainingBookManage.setTraining_type("1");
						trainingBookManageService.modifyTrainingStudent(trainingBookManage);
					}
				} else {
					trainingService.alertMessage("아이디 또는 비밀번호를 다시 확인하세요.", request, response);
					return null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			trainingService.alertMessage("문제가 발생했습니다. 관리자에게 문의해주세요.",  request, response);
			return null;
		}

		String returnUrl = String.format("%s/%s/index.do", homepage.getDomain(), homepage.getContext_path());
		trainingService.alertMessageAndUrl("출석체크가 완료되었습니다.", returnUrl, request, response);
		return null;
	}

}