package kr.go.gbelib.app.intro.login;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.gbelib.app.common.api.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ksign.access.wrapper.api.SSORspData;
import com.ksign.access.wrapper.api.SSOService;
import com.yhdb.solution.secukeypad.interweb.SecuKeypadConstant;
import com.yhdb.solution.secukeypad.interweb.SecuKeypadDecoder;
import com.yhdb.solution.secukeypad.interweb.SecuKeypadException;

import kr.co.whalesoft.app.cms.accountLock.AccountLock;
import kr.co.whalesoft.app.cms.accountLock.AccountLockService;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.app.cms.homepageAccess.HomepageAccessService;
import kr.co.whalesoft.app.cms.login.LoginService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.member.MemberService;
import kr.co.whalesoft.app.cms.memberGroup.MemberGroup;
import kr.co.whalesoft.app.cms.memberGroup.MemberGroupService;
import kr.co.whalesoft.app.cms.memberGroupSubord.MemberGroupSubordService;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.app.cms.module.bookStoreReq.BookStoreReqService;
import kr.co.whalesoft.app.cms.site.Site;
import kr.co.whalesoft.app.cms.site.SiteService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.go.gbelib.app.cms.module.elib.lending.Lending;
import kr.go.gbelib.app.cms.module.elib.lending.LendingService;
import kr.go.gbelib.app.cms.module.teacher.Teacher;
import kr.go.gbelib.app.cms.module.teacher.TeacherService;
import kr.go.gbelib.app.module.loginLog.LoginLog;
import kr.go.gbelib.app.module.loginLog.LoginLogService;

@Controller
@RequestMapping(value = {"/{homepagePath}/intro/login"})
public class CommonLoginController extends BaseController {

	private String basePath = "/homepage/%s/commonIntro/login/";

	@Autowired
	private LoginService service;

	@Autowired
	private CodeService codeService;

	@Autowired
	private SiteService siteService;

	@Autowired
	private BookStoreReqService bookStoreReqService;

	@Autowired
	private HomepageService homepageService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private HomepageAccessService homepageAccessService;

	@Autowired
	private LendingService lendingService;

	@Autowired
	private TeacherService teacherService;

	@Autowired
	private MemberGroupService memberGroupService;

	@Autowired
	private MemberGroupSubordService memberGroupSubordService;

	@Autowired
	private AccountLockService accountLockService;

	@Autowired
	private LoginLogService loginLogService;

	@ModelAttribute("siteList")
	public List<Site> getAreaCdList(HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		return siteService.getSiteListAll(new Site(homepage.getHomepage_id()));
	}

	@RequestMapping(value = {"/index.*"}, method = RequestMethod.GET)
	public String login(Model model, Member member, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		String beforeUrl = member.getBefore_url();
		if (StringUtils.isEmpty(beforeUrl)) {
			beforeUrl = String.format("/%s/index.do", homepagePath);
			member.setBefore_url(beforeUrl);
		}
		int idmenuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/findMemberIdForm.do");
		int pwmenuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/findMemberPwForm.do");
		int joinmenuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/index.do");
		int menuIdxBookConn = homepageService.getMenuIdxByProgramIdx(homepage.getHomepage_id(), 165);

		model.addAttribute("menuIdxId", idmenuIdx);
		model.addAttribute("menuIdxPw", pwmenuIdx);
		model.addAttribute("menuIdxJoin", joinmenuIdx);
		model.addAttribute("menuIdxBookConn", menuIdxBookConn);
		model.addAttribute("homepageName", homepage.getHomepage_name());
		model.addAttribute("member", member);
		return String.format(basePath, homepage.getFolder()) + "index";
	}

	@RequestMapping(value = {"/loginProc.*"}, method = RequestMethod.POST)
	public String loginProc(Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath, RedirectAttributes redirectAttributes) throws Exception {
 		Homepage homepage = (Homepage) request.getAttribute("homepage");
		request.removeAttribute("userIdLoginFail");

		String viewGubun = request.getParameter("viewGubun");
		if (viewGubun == null) {
			// 아이디, 비번, 이름 복호화
			if(memberService.decryptMember(member) == false) {
				codeService.alertMessage("아이디 또는 비밀번호를 다시 확인하세요", request, response);
//			System.out.println("@@@@@@@@@@@@@@@@ idpw not matched");
				return null;
			}
		} else {
			String inputValue = "";
			String hashValue = "";
			String decodeStr = "";

			boolean sessionValid = SecuKeypadDecoder.sessionValidation(request);

			if("pc".equals(viewGubun)) {
				try {
					if(sessionValid == true){
						//문자키패드 사용시
						inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);
						hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);
						decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET);

						
						if(decodeStr != null && !decodeStr.equals("")) {
							decodeStr = decodeStr.replace(" ", "&nbsp;");
							member.setMember_pw(decodeStr);
						} 
						//숫자키패드 사용시
						/*
						inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER);
						hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER);
						decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_NUMBER).replace(" ", "&nbsp;");
						*/
					}
				} catch(SecuKeypadException e) {
					System.out.println("SecuKeypadException occurred");
					System.out.println(e.getErrCode()+" : "+ e.getErrMsg());
				}
			} else {
				try {
					if(sessionValid == true){
						//문자키패드 사용시
						inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET);
						hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET);
						
						decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET);
						
						if(decodeStr != null && !decodeStr.equals("")) {
							decodeStr = decodeStr.replace(" ", "&nbsp;");
							member.setMember_pw(decodeStr);
						} 

						//숫자키패드 사용시
						/*
						inputValue = SecuKeypadDecoder.getInputValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER);
						hashValue = SecuKeypadDecoder.getHashValue(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER);
						decodeStr = SecuKeypadDecoder.decode(request, SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_NUMBER).replace(" ", "&nbsp;");
						*/
						
					}
				} catch(SecuKeypadException e) {
					System.out.println("SecuKeypadException occurred");
					System.out.println(e.getErrCode()+" : "+ e.getErrMsg());
				}
			}

			
		}


		//String returnUrl = member.getBefore_url();
		
		String returnUrl = "";
		if(member != null && member.getBefore_url() != null) {
			returnUrl = member.getBefore_url();
		}
		
		if ( StringUtils.isEmpty(returnUrl) || returnUrl.indexOf("/login/") > -1 ) {
			returnUrl = String.format("%s/%s/index.do", homepage.getDomain(), homepagePath);
			if (request.getRequestURL().toString().contains("localhost")) {
				returnUrl = String.format("%s/%s/index.do", "http://localhost", homepagePath);
			}
		}

		// 비번 틀려서 계정이 잠김
		if("Y".equals(accountLockService.isLocked(new AccountLock(member, request.getRemoteAddr())))) {
			codeService.alertMessage("로그인 5회 중 5회 이상 실패\\n입력하신 아이디에 대해서 10분간 접속을 차단합니다.", request, response);
			return null;
		}

		Object result = LoginAPI.login(member);
		if ( result instanceof Member ) {
			accountLockService.loginSucceeded(new AccountLock(member, request.getRemoteAddr()));
			loginLogService.addLoginLog(new LoginLog(member, request, homepage));

			try {
				Member tempMember = (Member) result;
				if (tempMember.getAuth_id().equals("20000") && StringUtils.equals(member.getLoginType2(), "num")) {
					if (StringUtils.isNotEmpty(tempMember.getWeb_id())) {
    					request.getSession().setAttribute("userIdLoginFail", true);
    					return String.format("redirect:https://%s/%s/intro/login/index.do?menu_idx=%d", homepage.getDomainWithoutProtocol(), homepagePath, member.getMenu_idx());
					}
				}

				member = (Member) result;


				member.setLogin(true);

				if(homepagePath.equals("yd")) {
					member.setBookStore(bookStoreReqService.getBookStoreReqCount(member.getUser_id()));
				}
				member.setLast_login_ip(homepageAccessService.getLastHomepageAccess(member));
				memberService.addMemberLastLogin(member, request);

				//관리자확인
				String memberId = member.getMember_id();
				member.setMember_id(member.getWeb_id());
				Member adminMember = memberService.getMemberOne(member);
				if(adminMember != null) {
//				member.setAuthMap(adminMember.getAuthMap());
					member.setLink_member_yn(adminMember.getLink_member_yn());
					member.setAdmin(adminMember.isAdmin());
					member.setAuthorityHomepageList(adminMember.getAuthorityHomepageList());
//				member.setAuth_id(adminMember.getAuth_id());
//				member.setAuth_id_list(adminMember.getAuth_id_list());
//				member.setHomepage_id(adminMember.getHomepage_id());
//				if (StringUtils.equals(adminMember.getAuth_id(), "100")) {
//					member.setAdmin(true);
//				}
				}
				member.setMember_id(memberId);

				Teacher teacher = new Teacher();
				teacher.setMember_key(member.getSeq_no());
				teacher = teacherService.checkTeacher2(teacher);
				if (teacher != null && teacher.getTeacher_idx() != 0) {
					member.setTeacher_yn("Y");
				}

				/**
				 * 개인정보 동의 기간 설정
				 */
				boolean hasAdded2years = false;
				Date lastLoanDate = new Date();
				try {
					lastLoanDate = member.getAgree_date();
					Calendar cal = Calendar.getInstance();
					String[] parsePatterns = {"yyyyMMdd"};
					String[] parsePatterns2 = {"yyyy-MM-dd"};
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

					Map<String, String> paramMap = new HashMap<String, String>();
					paramMap.put("vStartPos", "1");
					paramMap.put("vEndPos", "1");
					paramMap.put("vSortKey", "LOAN_DATE");
					paramMap.put("vSortDir", "DESC");
					Map<String, Object> loanListTmp = LibSearchAPI.getMyLibrarySearchList("WEB", member.getUser_id(), "LOAN", null, paramMap);
					if (loanListTmp != null) {
						@SuppressWarnings ("unchecked")
						List<Map<String, String>> loanList = (List<Map<String, String>>) loanListTmp.get("dsMyLibraryList");
						if (loanList != null && loanList.size() > 0) {
							Map<String, String> lastLoan = loanList.get(0);
							String lastLoanDateStr = lastLoan.get("LOAN_DATE");
							if (StringUtils.isNotEmpty(lastLoanDateStr)) {
								lastLoanDate = DateUtils.parseDate(lastLoanDateStr, parsePatterns);
								if (member.getAgree_date() == null) {
									lastLoanDate = cal.getTime();
									cal.setTime(lastLoanDate);
									cal.add(Calendar.YEAR, 2);
									hasAdded2years = true;
									member.setAgree_date_str(sdf.format(cal.getTime()));
								} else {
									if (member.getAgree_date().compareTo(lastLoanDate) > 0) {
										lastLoanDate = member.getAgree_date();
									}
									cal.setTime(lastLoanDate);
									cal.add(Calendar.YEAR, 2);
									hasAdded2years = true;
									member.setAgree_date_str(sdf.format(cal.getTime()));
								}
							} else {
								if (member.getAgree_date() != null) {
									lastLoanDate = member.getAgree_date();
									cal.setTime(lastLoanDate);
									cal.add(Calendar.YEAR, 2);
									hasAdded2years = true;
									member.setAgree_date_str(sdf.format(cal.getTime()));
								}
							}
						}
					}
					Lending lending = new Lending();
					lending.setMember_id(member.getWeb_id());
					List<Lending> lendingList = lendingService.getLendMemberList(lending);
					if (lendingList != null && lendingList.size() > 0) {
						String LastlendDtStr = lendingList.get(0).getLend_dt();
						if (StringUtils.isNotEmpty(LastlendDtStr)) {
							Date elibLastLendDate = DateUtils.parseDate(lendingList.get(0).getLend_dt(), parsePatterns2);
							if (member.getAgree_date() == null) {
								cal.setTime(elibLastLendDate);
								cal.add(Calendar.YEAR, 2);
								hasAdded2years = true;
								member.setAgree_date_str(sdf.format(cal.getTime()));
							} else {
								if (lastLoanDate.compareTo(elibLastLendDate) < 0) {
									cal.setTime(elibLastLendDate);
									cal.add(Calendar.YEAR, 2);
									hasAdded2years = true;
									member.setAgree_date_str(sdf.format(cal.getTime()));
								}
							}
						}
					}

					if (!hasAdded2years) {
						cal.setTime(member.getAgree_date());
						cal.add(Calendar.YEAR, 2);
						member.setAgree_date_str(sdf.format(cal.getTime()));
					}

				} catch ( NullPointerException e ) {
					e.printStackTrace();
				} catch ( Exception e ) {
					e.printStackTrace();
				}


				if ((member.getAuthMap() == null || member.getAuthMap().isEmpty()) && !member.isAdmin()) {
					if (StringUtils.equals(member.getUnAgreeFlag(), "0001")) {
						//통합회원
						if(adminMember != null) {
							//관리자 링크회원이면 기존 그룹에 추가
							member.setAuthGroupIdxList(memberGroupSubordService.getAuthGroupIdxList(adminMember));
							//통합회원그룹에 속하게 한다. 도서관은 하드코딩한다...
							if (!member.getAuthGroupIdxList().contains(149)) {
								member.getAuthGroupIdxList().add(149);
							}
						} else if (member.getAuthGroupIdxList() == null || member.getAuthGroupIdxList().size() < 1) {
							//관리자 링크회원 아니면 새로 생성
							member.setAuthGroupIdxList(new ArrayList<Integer>());
							//통합회원그룹에 속하게 한다. 도서관은 하드코딩한다...
							member.getAuthGroupIdxList().add(149);
						}
//					String imsiId = member.getMember_id();
//					member.setMember_id(member.getSeq_no());
						//그룹-멤버 관계 테이블에 넣는다.
						memberGroupSubordService.addAuthGroupMember(member);
						//권한맵을 새로 불러온다.
						member.setAuthMap(memberService.getMemberAuth(member));
					} else {
						if(adminMember != null) {
							member.setAuthGroupIdxList(memberGroupSubordService.getAuthGroupIdxList(adminMember));
							Homepage homepageTmp = new Homepage();
							homepageTmp.setHomepage_code(member.getLoca());
							String locaHomepageId = homepageService.getHomepageOneByCode(homepageTmp).getHomepage_id();

							MemberGroup memberGroup = new MemberGroup();
							memberGroup.setSite_id(locaHomepageId);

							//내 소속도서관의 사용자 그룹에만 지정한다.
							member.getAuthGroupIdxList().add(memberGroupService.getSiteUserGroupOne(memberGroup).getMember_group_idx());
						}
						if (member.getAuthGroupIdxList() == null || member.getAuthGroupIdxList().size() < 1) {
							member.setAuthGroupIdxList(new ArrayList<Integer>());
							//통합회원그룹에 속하게 한다.
							Homepage homepageTmp = new Homepage();
							homepageTmp.setHomepage_code(member.getLoca());
							String locaHomepageId = homepageService.getHomepageOneByCode(homepageTmp).getHomepage_id();

							MemberGroup memberGroup = new MemberGroup();
							memberGroup.setSite_id(locaHomepageId);

							//내 소속도서관의 사용자 그룹에만 지정한다.
							member.getAuthGroupIdxList().add(memberGroupService.getSiteUserGroupOne(memberGroup).getMember_group_idx());
						}
						//그룹-회원 관계테이블에 넣는다.
						memberGroupSubordService.addAuthGroupMember(member);
//					//권한정보를 다시 가져온다.
						member.setAuthMap(memberService.getMemberAuth(member));
					}

				}
			} catch ( Exception e ) {
				System.out.println("@@@@@@@@@@@@@@@@ loginProcFailed : " + e.getMessage());
			}

			service.setSessionMember(member, request);
			
			Member member2 = getSessionMemberInfo(request);
			
			// ------------------------ 모바일 회원증 -----------------------//
			if ("0".equals(member2.getStatus_code())) {
				try {
					MemberAPI.userCardModSp( member2.getUser_no(), "0001", member2.getUser_no());
				} catch (Exception e) {
					log.error("API 통신오류 관리자에게 문의하세요.");
					// TODO: handle exception
				}
			}
			

			/**
			 * 개인정보 동의 만료기간 60일전에 재동의 페이지로.
			 */
//			try {
//				if(!StringUtils.equalsIgnoreCase(member2.getAgree_date_str(), "null")) {
//					Calendar cal = Calendar.getInstance();
//					DateFormat df = new SimpleDateFormat("yyyyMMdd");
//					Date date = df.parse(member2.getAgree_date_str().replaceAll("[^0-9]", ""));
//					cal.setTime(date);
//					cal.add(Calendar.DATE, -60);
//
//					Calendar nowCal = Calendar.getInstance();
//					nowCal.setTime(new Date());
//
//					int nowDay = Integer.parseInt(df.format(nowCal.getTime())); //오늘날짜
//					int agreeDay = Integer.parseInt(df.format(cal.getTime())); //개인정보동의 만료 60일전 날짜
//		 			System.out.println("@@@@@@@@@@ nowDay"+nowDay);
//		 			System.out.println("@@@@@@@@@@ agreeDay" + agreeDay);
//						if(nowDay >= agreeDay) {
//			 				int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/modifyForm.do");
//							service.alertMessageAndUrl("개인정보 보유기간이 도래하여 회원정보가 삭제될 예정입니다. 회원자격을 유지하려면 확인 버튼을 클릭하세요.", String.format("https://%s/%s/intro/join/reAgree.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepagePath, menuIdx), request, response);
//							return null;
//						}
//
//					if ((!StringUtils.equals(member.getUnAgreeFlag(), "0001") && !StringUtils.equals(member.getUnAgreeFlag(), "0002")) || StringUtils.isEmpty(member.getCi_value())) {
//						int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/modifyForm.do");
//						service.alertMessageAndUrl("통합회원 전환 페이지로 이동합니다.", String.format("https://%s/%s/intro/join/integration.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepagePath, menuIdx), request, response);
//						return null;
//					}
//				}
//			}catch (Exception e) {
//				e.printStackTrace();
//			}

			/**
			 * 비밀번호 만료일자가 지난 경우 패스워드 변경유도 페이지로 이동.
			 */
			try {
				if (!StringUtils.isEmpty(member.getPassword_update_date()) && !StringUtils.equalsIgnoreCase(member.getPassword_update_date(), "null")) {
					DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyyMMdd");

					DateTime updateDate = fmt.parseDateTime(member.getPassword_update_date());
					DateTime currentDate = DateTime.now();

					Days daysBetween = Days.daysBetween(updateDate, currentDate);

					int expiryDay = Integer.parseInt(member.getPassword_expiry_day());
					if (daysBetween.getDays() > expiryDay) {
						int menuIdx = homepageService.getMenuIdxByLinkUrl(homepage.getHomepage_id(), "/intro/join/changePwForm.do");
						returnUrl = String.format("https://%s/%s/intro/join/passwordExpiry.do?menu_idx=%s", homepage.getDomainWithoutProtocol(), homepagePath, menuIdx);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
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

				return String.format(basePath, homepage.getFolder()) + "ssoCheck";
			}
			
			{
				try {
					// <SSO.1> SSO 서비스 객체 획득
//					String federation = request.getParameter("federation");
					if(!StringUtils.equals(homepage.getContext_path(), "app")) {
						SSOService ssoService = SSOService.getInstance();
	
						// <SSO.2> 인증토큰 발급: 추가 속성정보 설정
						// - 응용시스템에서 SSO 처리 시 필요로 하는 추가 정보를 인증토큰을 통해
						// 안전하고 신뢰 할 수 있는 방식으로 전달하기 위해 사용
						// - eg. 이름/부서/직급/권한/역할 등
						String avps = "member_name="+member.getMember_name()+"$loca="+member.getLoca()+"$status_code="+member.getStatus_code()+"$login_type="+member.getLoginType();
	
						// <SSO.3>. 인증 토큰 생성 요청
						// returnUrl: 응용 커스터 마이징 필요
						String reqCtx = request.getContextPath();
	//					String ssoReturnUrl = "https://" + request.getServerName() + reqCtx + "/index.jsp";
						String agentIp = String.valueOf(request.getLocale());
	
						// case1. SSO API 내에서 SSO 서버로 리다이렉트 수행
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
					
					// 이중로그인시에 세션 종료
//					service.logout(request);

				} catch(Exception e) {
					e.printStackTrace();
				}
			}

			return "redirect:" + returnUrl.replaceAll("^http://(www\\.)?gbelib\\.kr", "https://www.gbelib.kr");
		} else {
			member.setHomepage_id(homepage.getHomepage_id());
			member.setLoginType("HOMEPAGE");
			accountLockService.loginFailed(new AccountLock(member, request.getRemoteAddr()));
			ApiResponse errorResult = (ApiResponse) result;

			if("Y".equals(accountLockService.isLocked(new AccountLock(member, request.getRemoteAddr())))) {
				codeService.alertMessage("로그인 5회 중 5회 이상 실패\\n입력하신 아이디에 대해서 10분간 접속을 차단합니다.", request, response);
				return null;
			} else if("아이디 또는 비밀번호를 다시 확인하세요".equals(errorResult.getMessage())) {
				AccountLock accountLock = accountLockService.getAccountLock(new AccountLock(member, request.getRemoteAddr()));
				codeService.alertMessage(String.format("로그인 5회 중 %d회 실패\\n아이디 또는 비밀번호를 다시 확인하세요", accountLock.getCount()), request, response);
				return null;
			} else {
				codeService.alertMessage(errorResult.getMessage(), request, response);
				return null;
			}
		}
	}

	/**
	 * 로그아웃 처리
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/logout.*")
	public String logout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
//		String redirectURL = request.getServerName() + ":" + request.getServerPort();
		String redirectURL = request.getServerName() + "/" + ((Homepage)request.getAttribute("homepage")).getContext_path();

		String relogin = request.getParameter("relogin");
		if (StringUtils.equals(relogin, "true")) {
			int menu_idx = 0;
			try {
				menu_idx = menuService.getMenuIdxByLinkUrl(new Menu(((Homepage)request.getAttribute("homepage")).getHomepage_id(), "/intro/login/index.do"));
			}
			catch ( Exception e ) {
			}
			if (menu_idx == 0) {
				service.logout(request);
				return "redirect:http://" + redirectURL + "/index.do";
			}
			redirectURL += "/intro/login/index.do?menu_idx=" + menu_idx;
			service.logout(request);
			return "redirect:http://" + redirectURL ;
		}
		service.logout(request);
		if(!StringUtils.equals(homepage.getContext_path(), "app")) {
		String SSO_SERVER = SSOService.getInstance().getServerScheme();
		return "redirect:"+SSO_SERVER + "/sso/pmi-logout-url.jsp?returl=http://" + redirectURL + "/index.do";
		} else {
		return "redirect:http://" + redirectURL + "/index.do";
		}
	}

	@RequestMapping(value="/ssoLogout.*")
	public String ssoLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		long totalStart = System.currentTimeMillis();

		System.out.println("========== SSOLOGOUT START ==========");
		System.out.println("[SSOLOGOUT] requestURI      = " + request.getRequestURI());
		System.out.println("[SSOLOGOUT] requestURL      = " + request.getRequestURL());
		System.out.println("[SSOLOGOUT] queryString     = " + request.getQueryString());
		System.out.println("[SSOLOGOUT] remoteAddr      = " + request.getRemoteAddr());
		System.out.println("[SSOLOGOUT] remoteHost      = " + request.getRemoteHost());
		System.out.println("[SSOLOGOUT] serverName      = " + request.getServerName());
		System.out.println("[SSOLOGOUT] scheme          = " + request.getScheme());
		System.out.println("[SSOLOGOUT] locale          = " + request.getLocale());
		System.out.println("[SSOLOGOUT] userAgent       = " + request.getHeader("User-Agent"));
		System.out.println("[SSOLOGOUT] referer         = " + request.getHeader("Referer"));
		System.out.println("[SSOLOGOUT] x-forwarded-for = " + request.getHeader("X-Forwarded-For"));

		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Member member = getSessionMemberInfo(request);

		System.out.println("[SSOLOGOUT] homepage        = " + homepage);
		System.out.println("[SSOLOGOUT] member null     = " + (member == null));

		String member_id = null;
		String server_id = null;
		String member_name = null;
		String status_code = null;
		String loginType = null;
		String loca = null;
		String returnUrl = "";

		if (homepage != null) {
			System.out.println("[SSOLOGOUT] homepage.domain       = " + homepage.getDomain());
			System.out.println("[SSOLOGOUT] homepage.context_path = " + homepage.getContext_path());
		}

		if (member != null) {
			System.out.println("[SSOLOGOUT] member.before_url = " + member.getBefore_url());
			System.out.println("[SSOLOGOUT] member_id         = " + member.getMember_id());
			System.out.println("[SSOLOGOUT] server_id         = " + member.getServerId());
			System.out.println("[SSOLOGOUT] member_name       = " + member.getMember_name());
			System.out.println("[SSOLOGOUT] status_code       = " + member.getStatus_code());
			System.out.println("[SSOLOGOUT] loginType         = " + member.getLoginType());
			System.out.println("[SSOLOGOUT] loca              = " + member.getLoca());

			if (member.getBefore_url() != null) {
				returnUrl = member.getBefore_url();
				member_id = member.getMember_id();
				server_id = member.getServerId();
				member_name = member.getMember_name();
				status_code = member.getStatus_code();
				loginType = member.getLoginType();
				loca = member.getLoca();
			}
		}

		System.out.println("[SSOLOGOUT] returnUrl before fallback = " + returnUrl);

		if (StringUtils.isEmpty(returnUrl) || returnUrl.indexOf("/login/") > -1) {
			returnUrl = String.format("%s/%s/index.do", homepage.getDomain(), homepage.getContext_path());

			if (request.getRequestURL().toString().contains("localhost")) {
				returnUrl = String.format("%s/%s/index.do", "http://localhost", homepage.getContext_path());
			}
		}

		System.out.println("[SSOLOGOUT] returnUrl after fallback = " + returnUrl);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("user_id", member_id);
		param.put("server_gid", server_id);

		System.out.println("[SSOLOGOUT] delete param user_id    = " + member_id);
		System.out.println("[SSOLOGOUT] delete param server_gid = " + server_id);

		long deleteStart = System.currentTimeMillis();
		boolean deleteSSOLogin = SSOAPI.sendSSO(param, "delete");
		long deleteEnd = System.currentTimeMillis();

		System.out.println("[SSOLOGOUT] deleteSSOLogin = " + deleteSSOLogin);
		System.out.println("[SSOLOGOUT] delete API time = " + (deleteEnd - deleteStart) + " ms");

		if (!deleteSSOLogin) {
			System.out.println("[SSOLOGOUT] delete failed. alert redirect.");
			String alertMsg = "사용자 인증토큰 삭제에 실패하였습니다.";
			String nextURI = "/" + homepage.getContext_path() + "/index.do";
			service.alertMessageAndUrl(alertMsg, nextURI, request, response);
			return null;
		}

		try {
			System.out.println("[SSOLOGOUT] issueToken block start");
			System.out.println("[SSOLOGOUT] context_path = " + homepage.getContext_path());

			if (!StringUtils.equals(homepage.getContext_path(), "app")) {
				long instanceStart = System.currentTimeMillis();
				SSOService ssoService = SSOService.getInstance();
				long instanceEnd = System.currentTimeMillis();

				System.out.println("[SSOLOGOUT] SSOService.getInstance time = " + (instanceEnd - instanceStart) + " ms");
				System.out.println("[SSOLOGOUT] ssoService = " + ssoService);

				String avps = "member_name=" + member_name
						+ "$loca=" + loca
						+ "$status_code=" + status_code
						+ "$login_type=" + loginType;

				String agentip = String.valueOf(request.getLocale());

				System.out.println("[SSOLOGOUT] avps    = " + avps);
				System.out.println("[SSOLOGOUT] agentip = " + agentip);
				System.out.println("[SSOLOGOUT] remoteAddr = " + request.getRemoteAddr());

				if (!returnUrl.startsWith("http")) {
					System.out.println("[SSOLOGOUT] returnUrl is relative. before = " + returnUrl);
					returnUrl = homepage.getDomain() + returnUrl;
					System.out.println("[SSOLOGOUT] returnUrl is relative. after  = " + returnUrl);
				}

				System.out.println("[SSOLOGOUT] issueToken returnUrl = " + returnUrl);

				long issueStart = System.currentTimeMillis();
				SSORspData rspData = ssoService.ssoReqIssueToken(request, response, "form-based", member_id, avps, returnUrl, agentip, request.getRemoteAddr());
				long issueEnd = System.currentTimeMillis();

				System.out.println("[SSOLOGOUT] issueToken time = " + (issueEnd - issueStart) + " ms");
				System.out.println("[SSOLOGOUT] rspData = " + rspData);

				if (rspData != null) {
					System.out.println("[SSOLOGOUT] rspData.resultCode = " + rspData.getResultCode());
				} else {
					System.out.println("[SSOLOGOUT] rspData is null");
				}

				if (rspData != null && rspData.getResultCode() == -1) {
					System.out.println("[SSOLOGOUT] issueToken failed. resultCode = -1");
					String alertMsg = "사용자 인증토큰 요청정보 생성에 실패하였습니다.";
					String nextURI = "/" + homepage.getContext_path() + "/index.do";
					service.alertMessageAndUrl(alertMsg, nextURI, request, response);
					return null;
				}
			} else {
				System.out.println("[SSOLOGOUT] context_path is app. issueToken skip.");
			}

		} catch (Exception e) {
			System.out.println("[SSOLOGOUT] issueToken exception occurred");
			e.printStackTrace();
		}

		String finalRedirectUrl = returnUrl.replaceAll("^http://(www\\.)?gbelib\\.kr", "https://www.gbelib.kr");

		long totalEnd = System.currentTimeMillis();

		System.out.println("[SSOLOGOUT] returnUrl         = " + returnUrl);
		System.out.println("[SSOLOGOUT] finalRedirectUrl = " + finalRedirectUrl);
		System.out.println("[SSOLOGOUT] total time       = " + (totalEnd - totalStart) + " ms");
		System.out.println("========== SSOLOGOUT END ==========");

		return "redirect:" + finalRedirectUrl;
	}
}
