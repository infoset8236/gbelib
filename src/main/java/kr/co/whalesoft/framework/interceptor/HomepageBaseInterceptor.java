package kr.co.whalesoft.framework.interceptor;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.app.cms.homepageAccess.HomepageAccess;
import kr.co.whalesoft.app.cms.homepageAccess.HomepageAccessService;
import kr.co.whalesoft.app.cms.login.LoginService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.app.cms.menu.menuAccess.MenuAccess;
import kr.co.whalesoft.app.cms.menu.menuAccess.MenuAccessService;
import kr.co.whalesoft.framework.utils.RequestUtils;
import kr.go.gbelib.app.cms.module.elib.book.Book;
import kr.go.gbelib.app.cms.module.elib.book.BookService;
import kr.go.gbelib.app.cms.module.elib.category.ElibCategory;
import kr.go.gbelib.app.cms.module.elib.category.ElibCategoryService;
import kr.go.gbelib.app.cms.module.elib.code.ElibCode;
import kr.go.gbelib.app.cms.module.elib.code.ElibCodeService;


public class HomepageBaseInterceptor extends HandlerInterceptorAdapter {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private HomepageService homepageService;

	@Autowired
	private LoginService loginService;

	@Autowired
	private HomepageAccessService homepageAccessService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private MenuAccessService menuAccessService;

	@Autowired
	private ElibCategoryService elibCategoryService;

	@Autowired
	private ElibCodeService elibCodeService;

	@Autowired
	private BookService bookService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String uri = null;
		String contextPath = null;
		Homepage homepage = null;

		List<Menu> menuTreeList = null;
		Menu menuOne = null;
		List<Menu> menuLeftList = null;
		uri = request.getRequestURI().substring(request.getContextPath().length());
		
		if(homepageUrl(uri)) { // 홈페이지 관련 URL 일때
			
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			response.setDateHeader("Expires", 0); // Proxies.
			
			if ( uri.startsWith("/index.do") ) {
				contextPath = "root";
			} else {
				try {
					contextPath = uri.substring(1, uri.indexOf("/", 1));
				} catch (Exception e) {
					//contextPath를 올바르게 가져오지 못하는 경우 404 에러 처리.
					return super.preHandle(request, response, handler);
				}
			}

			Homepage reqHomepage = new Homepage();
			reqHomepage.setContext_path(contextPath);
			log.debug("contextPath : "+contextPath);
			homepage = homepageService.getHomepageOneInPath(reqHomepage);

			if(homepage != null) {

				if (homepage.getContext_path().equals("pms")) {
					String asideHomepageId = String.valueOf(request.getSession().getAttribute("asideHomepageId"));
					if (StringUtils.isEmpty(asideHomepageId) || StringUtils.equalsIgnoreCase(asideHomepageId, "null")) {
					}
				}

				if (StringUtils.equals(homepage.getHomepage_id(), "h27")) {
					//경북교육센터 도서관서비스로 이동시 무조건 geic로 넘긴다.
					String redirectUrl = String.format("http://%s:80/geic/index.do", homepage.getDomainWithoutProtocol());
					response.sendRedirect(redirectUrl);
					return false;
				}
				request.setAttribute("homepage", homepage);


				Member member = loginService.getSessionMember(request);

				HttpSession session = request.getSession();
				HomepageAccess homepageAccess = new HomepageAccess(request, homepage.getHomepage_id(), member);

				if((homepageAccess.getBrowser_type() != null && !homepageAccess.getBrowser_type().equals("")) && (homepageAccess.getBrowser_version() != null && !homepageAccess.getBrowser_version().equals(""))) {
					if(homepageAccess.getBrowser_type().indexOf("bingbog") == -1 && homepageAccess.getBrowser_type().indexOf("Apache") == -1) {
						//기존 접속자 통계는 그대로 기록하고.
						homepageAccessService.addHomepageAccess(homepageAccess);
					}
				}



				if ( member == null ) {
				}
				else {
					if ( !uri.contains("editAgree.do") && !uri.contains("logout.do") ) {
						if ( member.isHomepageLogin() ) {
							if ( StringUtils.isEmpty(member.getMember_id()) ) { // 로그인 회원중 WEB_ID 가 없으면 회원 가입 페이지로 Redirect.
//								response.sendRedirect(String.format("/intro/%s/join/index.do", homepage.getContext_path()));
							}
						}
					}
				}


				//Menu 구하기
				menuTreeList = menuService.getMenuTreeListCache(homepage.getHomepage_id());
				if(request.getParameter("menu_idx") != null && !request.getParameter("menu_idx").equals("")) {
					menuOne = menuService.getMenuOne(new Menu(homepage.getHomepage_id(), Integer.parseInt(request.getParameter("menu_idx"))));
				}

				int modifyFormMenuIdx = menuService.getMenuIdxByLinkUrl(new Menu(homepage.getHomepage_id(), "/intro/join/modifyForm.do"));

				if(menuOne != null) {
					menuLeftList = menuService.getMenuLeftTreeListCache(menuOne.getHomepage_id(), menuOne.getGroup_idx());
				}

				request.setAttribute("modifyFormMenuIdx", modifyFormMenuIdx);
				request.setAttribute("menuTreeList", menuTreeList);
				request.setAttribute("menuOne", menuOne);
				request.setAttribute("menuLeftList", menuLeftList);

				// 전자도서관 좌측 메뉴
				if("elib".equals(contextPath) || "elibtest".equals(contextPath)) {
					String type = StringUtils.trimToEmpty(request.getParameter("type"));
					ElibCategory elibCategory = new ElibCategory(type, 1);
					ElibCode elibCode = new ElibCode(type);
//					Book book = new Book();
//					book.setType(type);
//					HttpSession session = request.getSession();
					String debug = (String) session.getAttribute("_elib_debug");

					if(StringUtils.equals(debug, "true")) {
//						book.setApproved_yn("N");
						elibCategory.setApproved_yn("N");
						elibCode.setApproved_yn("N");
					} else {
//						book.setApproved_yn("Y");
						elibCategory.setApproved_yn("Y");
						elibCode.setApproved_yn("Y");
					}

					List<ElibCategory> categoryList = elibCategoryService.getCategoryWithCntList(elibCategory);
					request.setAttribute("categoryMenuList", categoryList);

					List<ElibCode> compList = elibCodeService.getCompWithCntList(elibCode);
					request.setAttribute("compMenuList", compList);

//					List<Book> deviceList = bookService.getBookCountByDevice(book);
//					request.setAttribute("deviceMenuList", deviceList);
				}
			} else {
//				return false;
				//그냥 false로 리턴을 하면 빈 페이지가 생성됨.
				//homepage 객체가 없는 경우 404페이지를 띄우기 위해 super 처리
				return super.preHandle(request, response, handler);
			}
		} else { //홈페이지 관련 URL 아닐때
			if ( uri.startsWith("/intro/") ) {

				// SSL 적용을 위한 로직
				if ( !uri.contains("join") && !uri.contains("login") ) {
					String requestURL = request.getRequestURL().toString();

//					if ( requestURL.startsWith("https://") ) {
//						// Request Parameter 리다이렉트로 전달.
//						List<String> parameters = new ArrayList<String>();
//						@SuppressWarnings ("unchecked")
//						Enumeration<String> result = request.getParameterNames();
//						while ( result.hasMoreElements() ) {
//							String attributeName = (String) result.nextElement();
//							parameters.add(String.format("%s=%s", attributeName, request.getParameter(attributeName)));
//						}
//
//						String redirectUrl = String.format("http://%s:80%s?%s", request.getServerName(), uri, StringUtils.join(parameters, "&"));
//						response.sendRedirect(redirectUrl);
//						return false;
//					}
				}

				//Intro 에서 사용하는 Homepage 정보 가져오기
				Homepage reqHomepage = new Homepage();
				uri = uri.replace("/intro/", "");
				uri = uri.substring(0,uri.indexOf("/"));
				reqHomepage.setContext_path(uri);
				homepage = homepageService.getHomepageOneInPath(reqHomepage);
				if ( homepage != null ) {
					request.setAttribute("homepage", homepage);
				}
			} else if (uri.contains("/ict/")) {
				Homepage reqHomepage = new Homepage();
				uri = uri.split("/")[1];
				reqHomepage.setContext_path(uri);
				homepage = homepageService.getHomepageOneInPath(reqHomepage);
				if (homepage != null) {
					request.setAttribute("homepage", homepage);
				}
			}
		}

		return super.preHandle(request, response, handler);
	}


	//@Async
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		if(homepageUrl(uri)) {
			if(homepage != null && request.getParameter("menu_idx") != null) {
				int menu_idx = Integer.parseInt(request.getParameter("menu_idx"));
				Menu menuOne = menuService.getMenuOne(new Menu(homepage.getHomepage_id(), menu_idx));

				if(menuOne != null) {
					MenuAccess menuAccess = new MenuAccess(homepage.getHomepage_id(), menu_idx);
					menuAccessService.updateMenuAccess(menuAccess);
				}
			}
		}
	}

	public boolean homepageUrl(String uri) {
		return (!uri.equals("") && !uri.startsWith("/cms/") && !uri.startsWith("/board/") && !uri.startsWith("/boardDelete/") && !uri.startsWith("/intro/") && !uri.startsWith("/api/") && !uri.startsWith("/sns/") && !uri.contains("/ict/"));
	}

}
