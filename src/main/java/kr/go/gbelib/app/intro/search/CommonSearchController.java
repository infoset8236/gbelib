package kr.go.gbelib.app.intro.search;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.app.cms.menu.menuHtml.MenuHtml;
import kr.co.whalesoft.app.cms.menu.menuHtml.MenuHtmlService;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.app.cms.site.Site;
import kr.co.whalesoft.app.cms.site.SiteService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.co.whalesoft.framework.utils.WebFilterCheckUtils;
import kr.go.gbelib.app.cms.module.hopebookConfig.HopebookConfig;
import kr.go.gbelib.app.cms.module.hopebookConfig.HopebookConfigService;
import kr.go.gbelib.app.cms.module.ilusReqConfig.ILUSReqConfig;
import kr.go.gbelib.app.cms.module.ilusReqConfig.ILUSReqConfigService;
import kr.go.gbelib.app.cms.module.smsReception.SmsReception;
import kr.go.gbelib.app.cms.module.smsReception.SmsReceptionService;
import kr.go.gbelib.app.cms.module.untactBook.untactBookBlackList.UntactBookBlackList;
import kr.go.gbelib.app.cms.module.untactBook.untactBookBlackList.UntactBookBlackListService;
import kr.go.gbelib.app.cms.module.untactBook.untactBookPenaltySetting.UntactBookPenaltySettingService;
import kr.go.gbelib.app.cms.module.untactBook.untactBookReservation.UntactBookReservation;
import kr.go.gbelib.app.cms.module.untactBook.untactBookReservation.UntactBookReservationService;
import kr.go.gbelib.app.cms.module.untactBook.untactLockerSetting.UntactLockerSettingService;
import kr.go.gbelib.app.common.api.ApiResponse;
import kr.go.gbelib.app.common.api.CommonAPI;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.common.api.MemberAPI;
import kr.go.gbelib.app.common.api.PushAPI;
import kr.go.gbelib.app.intro.bookImage.BookImageService;
import kr.go.gbelib.app.module.delivery.Delivery;
import kr.go.gbelib.app.module.delivery.DeliveryService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


//ILUS 연동

@Controller
@RequestMapping(value = {"/{homepagePath}/intro/search"})
public class CommonSearchController extends BaseController {

	private String basePath = "/homepage/%s/commonIntro/search/";

	@Autowired
	private LibrarySearchService service;

	@Autowired
	private SiteService siteService;

	@Autowired
	private HomepageService homepageService;

	@Autowired
	private MenuHtmlService menuHtmlService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private ILUSReqConfigService ilusReqConfigService;

	@Autowired
	private HopebookConfigService hopebookConfigService;

	@Autowired
	private CalendarManageService calendarManageService;

	@Autowired
	private SmsReceptionService smsReceptionService;
	
	@Autowired
	private UntactBookReservationService untactBookReservationService;
	
	@Autowired
	private UntactLockerSettingService untactLockerSettingService;
	
	@Autowired
	private UntactBookBlackListService untactBookBlackListService;
	
	@Autowired
	private UntactBookPenaltySettingService untactBookPenaltySettingService;
	
	@Autowired
	private BookImageService bookImageService;

	@Autowired
	private DeliveryService deliveryService;

	private PushAPI pushAPI = new PushAPI();

	@ModelAttribute("siteList")
	public List<Site> getAreaCdList(HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		return siteService.getSiteListAll(new Site(homepage.getHomepage_id()));
	}

	@ModelAttribute("searchCategory")
	private Map<String, Object> getSearchCategory() {
		return service.getSearchCategory();
	}

	@ModelAttribute("liboneApiUrl")
	private String getLiboneApiUrl() {
		return CommonAPI.LIBONE_API_URL;
	}

	@ModelAttribute("libraryList")
	private Map<String, Object> getLibraryList() {
		return service.getLibraryList();
	}

	@RequestMapping(value = {"/index.*"}, method = RequestMethod.GET)
	public String index(Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if (librarySearch.getSortField().equals("KWRD")) {
			librarySearch.setSearch_type("KWRD"); 
			librarySearch.setSortField("DISP01");
		}	
		if (StringUtils.isEmpty(librarySearch.getSearch_type())|| (StringUtils.isNotEmpty(librarySearch.getSortField()) && librarySearch.getSortField().equals("TITLE"))) {
			librarySearch.setSearch_type("L_TITLEAUTHOR"); 
			librarySearch.setSortField("DISP01"); 
		}
		

		Map<String, Object> result = null;
		
		// 도서관 목록 -> 정보센터 디폴트 [00147046]
		if ( librarySearch.getLibraryCodes() == null ) {
			List<String> libraryCodes = new ArrayList<String>();
			if ( StringUtils.isEmpty(homepage.getHomepage_code()) || homepage.getHomepage_code().equals("98889888") ) {
				libraryCodes.add("ALL");
			}
			else {
				
				if (StringUtils.isNotEmpty(homepage.getHomepage_code())) {
					String[] homepage_codes = homepage.getHomepage_code().split(",");
					
					for (String homepage_code : homepage_codes) {
						libraryCodes.add(homepage_code);
					}
				} 
			}
			librarySearch.setLibraryCodes(libraryCodes);
		}

		if ( !StringUtils.isEmpty(librarySearch.getSearch_text()) || "DETAIL".equals(librarySearch.getSearch_type2()) ) {
			librarySearch.setViewPage(1);

			Member member = getSessionMemberInfo(request);
			if (member.isLogin() && member.getLoginType().equals("HOMEPAGE")) {
				if (StringUtils.isNotEmpty(member.getBirth_day()) && member.getBirth_day().length() >= 4) {
					librarySearch.setBirth_year(member.getBirth_day().substring(0, 4));
				}
				if (StringUtils.isNotEmpty(member.getSex()) && member.getSex().length() == 4) {
					librarySearch.setSex(StringUtils.equals(member.getSex(), "0001") ? "m" : "f");
				}
			}

			if ( librarySearch.isSub_search() ) {
				result = LibSearchAPI.getSubSearch(librarySearch);
			} else {
				if ("DETAIL".equals(librarySearch.getSearch_type2())){
					librarySearch.setSearch_type("DETAIL");
				}
				
				result = LibSearchAPI.getSearchIlus(librarySearch, 1); // API로 Request 보냄
				
			}
			
			try {
				result = bookImageService.resultImageMap(result, librarySearch, "dsResult", "IMAGE_URL");
			} catch (Exception e) {
				e.printStackTrace();
			}
			

			if ( result != null ) {
				if (!StringUtils.equals(result.get("code").toString(), "0000")) {
					service.alertMessage(result.get("msg").toString(), request, response);
					return null;
				}
				
				int totalCount = 0;
				if ( result.get("totalCnt") != null ) {
					totalCount = Integer.parseInt(result.get("totalCnt").toString());
				}

				service.setPaging(model, totalCount, librarySearch); // 페이징 처리

				LibSearchAPI.addMarcUrls(result);

				model.addAttribute("result", result); // 검색한 결과
			}
		}
		model.addAttribute("librarySearch", librarySearch);
		model.addAttribute("libraryList", LibSearchAPI.getLibraryList());

		return String.format(basePath, homepage.getFolder()) + "index";
	}

	/**
	 * 추천도서, 테마도서 검색용
	 * @param model
	 * @param librarySearch
	 * @param request
	 * @param response
	 * @param homepagePath
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/indexForBoard.*"})
	public String indexForBoard(Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response, @PathVariable("homepagePath") String homepagePath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if (StringUtils.isEmpty(librarySearch.getSearch_type())) {
			librarySearch.setSearch_type("L_TITLE");
		}

		Map<String, Object> result	 				= null;
		List<String> libraryCodes = new ArrayList<String>();
		libraryCodes.add(homepage.getHomepage_code());
		if(librarySearch.getLibraryCodes() != null) {
			libraryCodes.addAll(librarySearch.getLibraryCodes());
		}
		librarySearch.setLibraryCodes(libraryCodes);

		if ( !StringUtils.isEmpty(librarySearch.getSearch_text()) ) {
			librarySearch.setViewPage(1);

			String searchType = librarySearch.getSearch_type2();
			if ( StringUtils.isEmpty(searchType) ) {
				searchType = "L_TITLE";
				librarySearch.setSortField("DISP01");
				librarySearch.setSortType("ASC");
			}
			
			if(librarySearch.getLibraryCodes() != null) {
				libraryCodes.addAll(librarySearch.getLibraryCodes());
			}
			
			if(librarySearch.getSortField().equals("TITLE")) {
				librarySearch.setSortField("DISP01");
			}
			result = LibSearchAPI.getSearchIlus(librarySearch, 1); // API로 Request 보냄

			if ( result != null ) {
				if (!StringUtils.equals(result.get("code").toString(), "0000")) {
					service.alertMessage(result.get("msg").toString(), request, response);
					return null;
				}

				int totalCount = 0;
				if ( result.get("totalCnt") != null ) {
					totalCount = Integer.parseInt(result.get("totalCnt").toString());
				}

				service.setPaging(model, totalCount, librarySearch); // 페이징 처리
				
				try {
					result = bookImageService.resultImageMap(result, librarySearch, "dsResult", "IMAGE_URL");
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				model.addAttribute("result", result); // 검색한 결과
			}
		}
		model.addAttribute("librarySearch", librarySearch);

		return String.format(basePath, homepage.getFolder()) + "indexForBoard_ajax";
	}


	@RequestMapping(value = {"/tableForBoard.*"})
	public String tableForBoard(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Map<String, Object> result = null;
		int viewPage = 1;
		String beforSearchType = librarySearch.getSearch_type2();

		if ( !StringUtils.isEmpty(librarySearch.getSearch_text()) ) {

			if ( StringUtils.isEmpty(librarySearch.getSearch_type2()) ) {
				librarySearch.setSearch_type("SEARCH");
			}

			if ( librarySearch.getViewPage() > 1) { // 화면에서 페이지 버튼 클릭
				viewPage = librarySearch.getViewPage();
			}

			if ( librarySearch.getLibraryCodes() == null ) {
				List<String> libraryCodes = new ArrayList<String>();
				libraryCodes.add(homepage.getHomepage_code());
				librarySearch.setLibraryCodes(libraryCodes);
			}

			if ( librarySearch.isSub_search() ) {
				result = LibSearchAPI.getSubSearch(librarySearch);
			}
			else {
				result = LibSearchAPI.getSearch(librarySearch, viewPage); // API로 Request 보냄
			}

			int totalCount = 0;
			if ( result != null && result.get("totalCnt") != null ) {
				String totalCnt = result.get("totalCnt").toString();
				if ( totalCnt != null && !totalCnt.equals("") ) {
					totalCount = Integer.parseInt(totalCnt);
				}
			}

			service.setPaging(model, totalCount, librarySearch); // 페이징 처리

			model.addAttribute("result", result); // 검색한 결과
		}
		librarySearch.setSearch_type(beforSearchType);// 페이징 할때 search_type 바뀌기 때문에 이전에 무슨 타입으로 검색 했는지 되돌리기 위해서 함.
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "tableForBoard_ajax";
	}

	@RequestMapping(value = {"/detailSearch.*"})
	public String detailSearch(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Map<String, Object> result	 				= null;
		Map<String, Object> resultCountByYear 		= null;
		Map<String, Object> resultCountByFormCode 	= null;
		Map<String, Object> resultCountByPublisher	= null;
		Map<String, Object> resultCountByWriter	 	= null;
		// 도서관 목록 -> 정보센터 디폴트 [00147046]
		if ( librarySearch.getLibraryCodes() == null ) {
			List<String> libraryCodes = new ArrayList<String>();
			if ( StringUtils.isEmpty(homepage.getHomepage_code()) ) {
				libraryCodes.add("ALL");
			}
			else {
				libraryCodes.add(homepage.getHomepage_code());
			}
			librarySearch.setLibraryCodes(libraryCodes);
		}

		if ( !StringUtils.isEmpty(librarySearch.getSearch_text()) ) {
			librarySearch.setViewPage(1);

			result = LibSearchAPI.getDetailSearch(librarySearch); // API로 Request 보냄

			if ( result != null ) {
				String allBookListStr = result.get("allBookListStr").toString();
				resultCountByFormCode 	= LibSearchAPI.getSearchCountByFormCode(allBookListStr, 1);//유형
				resultCountByWriter 	= LibSearchAPI.getSearchCountByWriter(allBookListStr, 1);//저자
				resultCountByPublisher 	= LibSearchAPI.getSearchCountByPublisher(allBookListStr, 1);//출판사
				resultCountByYear 		= LibSearchAPI.getSearchCountByYear(allBookListStr, 1);//연도

				int totalCount = 0;
				if ( result.get("totalCnt") != null ) {
					totalCount = Integer.parseInt(result.get("totalCnt").toString());
				}

				service.setPaging(model, totalCount, librarySearch); // 페이징 처리

				model.addAttribute("result", result); // 검색한 결과
				model.addAttribute("resultCountByFormCode", resultCountByFormCode); // 검색한 결과의 유형별 카운트
				model.addAttribute("resultCountByWriter", resultCountByWriter); // 검색한 결과의 저자별 카운트
				model.addAttribute("resultCountByPublisher", resultCountByPublisher); // 검색한 결과의 출판사별 카운트
				model.addAttribute("resultCountByYear", resultCountByYear); 		// 검색한 결과의 연도별 카운트
			}
		}
		model.addAttribute("librarySearch", librarySearch);

		return String.format(basePath, homepage.getFolder()) + "detailSearch";
	}

	@RequestMapping(value = {"/hotTrend.*"})
	public String hotTrend(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		model.addAttribute("hotTrendDailyList", LibSearchAPI.getHotTrendWordList(10, "1"));
		model.addAttribute("hotTrendWeeklyList", LibSearchAPI.getHotTrendWordList(10, "2"));

		return String.format(basePath, homepage.getFolder()) + "hotTrend_ajax";
	}

	@RequestMapping(value = {"/bestBook.*"})
	public String bestBook(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		librarySearch.setvLoca(homepage.getHomepage_code());
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -3);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date d = cal.getTime();
		String vStartDate = sdf.format(d);
		Map<String, Object> bestBookList = null;
		if (homepage.getHomepage_id().equals("h13")) {
			bestBookList = LibSearchAPI.getBestBookJCList(librarySearch, "10", vStartDate);
		} else {
			bestBookList = LibSearchAPI.getBestBookList(librarySearch, "10", vStartDate);
		}
		
		try {
			bestBookList = bookImageService.resultImageMap(bestBookList ,librarySearch, "dsLoanBestList", "COVER_SMALLURL");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("bestBookList", bestBookList);

		return String.format(basePath, homepage.getFolder()) + "bestBook_ajax";
	}

	@RequestMapping(value = {"/ageLoanBest.*"})
	public String ageLoanBest(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		List<String> locaList = new ArrayList<String>();
		locaList.add(homepage.getHomepage_code());

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -3);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		String startDate = sdf.format(cal.getTime());
		String endDate = sdf.format(new Date());
		model.addAttribute("ageLoanBestList", LibSearchAPI.getAgeLoanBestList(startDate, endDate, locaList));
		model.addAttribute("searchMenuIdx", homepageService.getMenuIdxByProgramIdx(homepage.getHomepage_id(), 2));
		return String.format(basePath, homepage.getFolder()) + "ageLoanBest_ajax";
	}

	@RequestMapping(value = {"/table.*"})
	public String table(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		
		if (librarySearch.getSortField().equals("KWRD")) {
			librarySearch.setSearch_type("KWRD"); 
			librarySearch.setSortField("DISP01");
		}	
		if (StringUtils.isEmpty(librarySearch.getSearch_type())|| (StringUtils.isNotEmpty(librarySearch.getSortField()) && librarySearch.getSortField().equals("TITLE"))) {
			librarySearch.setSearch_type("L_TITLEAUTHOR"); 
			librarySearch.setSortField("DISP01"); 
		}

		Map<String, Object> result = null;
		int viewPage = 1;
		String beforSearchType = librarySearch.getSearch_type2();

		if ( !StringUtils.isEmpty(librarySearch.getSearch_text()) ) {

			if ( StringUtils.isEmpty(librarySearch.getSearch_type2()) ) {
				librarySearch.setSearch_type("SEARCH");
			}

			if ( librarySearch.getViewPage() > 1) { // 화면에서 페이지 버튼 클릭
				//librarySearch.setSearch_type("GOPAGE"); // GOPAGE 사용시 검색 카테고리 바꾸면 페이징 안됨. (API가 안됨...)
				viewPage = librarySearch.getViewPage();
			}

			if ( librarySearch.getLibraryCodes() == null ) {
				List<String> libraryCodes = new ArrayList<String>();
				libraryCodes.add(homepage.getHomepage_code());
				librarySearch.setLibraryCodes(libraryCodes);
			}

			if ( librarySearch.isSub_search() ) {
				result = LibSearchAPI.getSubSearch(librarySearch);
			}
			else {
//				result = LibSearchAPI.getSearch(librarySearch, viewPage); // API로 Request 보냄
				result = LibSearchAPI.getSearchIlus(librarySearch, viewPage); // API로 Request 보냄
			}
			
			try {
				result = bookImageService.resultImageMap(result, librarySearch, "dsResult", "IMAGE_URL");
			} catch (Exception e) {
				e.printStackTrace();
			}

//			result = LibSearchAPI.getSearch(librarySearch, viewPage); // API로 Request 보냄
			int totalCount = 0;
			if ( result != null && result.get("totalCnt") != null ) {
				String totalCnt = result.get("totalCnt").toString();
				if ( totalCnt != null && !totalCnt.equals("") ) {
					totalCount = Integer.parseInt(totalCnt);
				}
			}

			service.setPaging(model, totalCount, librarySearch); // 페이징 처리

			LibSearchAPI.addMarcUrls(result);

			model.addAttribute("result", result); // 검색한 결과
		}
		librarySearch.setSearch_type(beforSearchType);// 페이징 할때 search_type 바뀌기 때문에 이전에 무슨 타입으로 검색 했는지 되돌리기 위해서 함.
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "table_ajax";
	}

	@RequestMapping(value = {"/table2.*"})
	public String table2(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Map<String, Object> resultCountByWriter	 	= null;
		resultCountByWriter 	= LibSearchAPI.getSearchCountByWriter(librarySearch.getAllBookListStr(), librarySearch.getViewPage());//저자
		model.addAttribute("resultCountByWriter", resultCountByWriter); // 검색한 결과의 저자별 카운트

		return String.format(basePath, homepage.getFolder()) + "table2_ajax";
	}

	@RequestMapping(value = {"/table3.*"})
	public String table3(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Map<String, Object> resultCountByPublisher	 	= null;
		resultCountByPublisher 	= LibSearchAPI.getSearchCountByPublisher(librarySearch.getAllBookListStr(), librarySearch.getViewPage());//저자
		model.addAttribute("resultCountByPublisher", resultCountByPublisher); // 검색한 결과의 저자별 카운트

		return String.format(basePath, homepage.getFolder()) + "table3_ajax";
	}

	@RequestMapping(value = {"/table4.*"})
	public String table4(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Map<String, Object> resultCountByYear	 	= null;
		resultCountByYear 	= LibSearchAPI.getSearchCountByYear(librarySearch.getAllBookListStr(), librarySearch.getViewPage());//저자
		model.addAttribute("resultCountByYear", resultCountByYear); // 검색한 결과의 연도별 카운트

		return String.format(basePath, homepage.getFolder()) + "table4_ajax";
	}

	@RequestMapping(value = {"/table5.*"})
	public String table5(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Map<String, Object> resultCountByFormcode	 	= null;
		resultCountByFormcode 	= LibSearchAPI.getSearchCountByFormCode(librarySearch.getAllBookListStr(), librarySearch.getViewPage());//유형
		model.addAttribute("resultCountByFormcode", resultCountByFormcode); // 검색한 결과의 유형별 카운트

		return String.format(basePath, homepage.getFolder()) + "table5_ajax";
	}

	@RequestMapping(value = {"/autoFill.do"})
	public @ResponseBody Map<String, Object> autoFill(@RequestParam("searchKeyword")String searchKeyword) {
		return LibSearchAPI.getAutoFill(searchKeyword);
	}

	@RequestMapping(value = {"/detail.*"}, method = RequestMethod.GET)
	public String detail(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);
	
		try {
			result = bookImageService.resultImageMap(result ,librarySearch, "dsItemDetail", "IMAGE_URL");
		}catch (Exception e) {
			e.printStackTrace();
		}

		if("00000001".equals(librarySearch.getvLoca())) {
			LibSearchAPI.addMarcUrls(result);
		}

		model.addAttribute("detail", result);
		model.addAttribute("librarySearch", librarySearch);
		String returnPage = "detail";
		if (StringUtils.isNotEmpty(librarySearch.getTid())) {
			model.addAttribute("descIndex", LibSearchAPI.getDescriptionIndex(librarySearch.getTid()));
		}
		model.addAttribute("ageChart", LibSearchAPI.getAgeChart(librarySearch));
		model.addAttribute("withBook", LibSearchAPI.getWithBook(librarySearch));
		model.addAttribute("tagCloud", LibSearchAPI.getTagCloud(librarySearch));
		try {
			List<String> locaList = new ArrayList<String>();
			for (Homepage home : homepageService.getHomepage()) {
				String homepageCode = home.getHomepage_code();
				if (StringUtils.isNotEmpty(homepageCode)) {
					if (homepageCode.length() >= 8) {
						locaList.add(homepageCode.substring(0, 8));
					}
				}
			}
			List<Map<String, Object>> dsPlaceBookList = null;
			Map<String, Object> sameBookList = LibSearchAPI.getSameBookList("WEB", librarySearch.getIsbn(), locaList);
			if (sameBookList != null) {
				@SuppressWarnings("unchecked")
				List<Map<String, Object>> tempSameBookList = (List<Map<String, Object>>) sameBookList.get("dsSameBookList");
				if (tempSameBookList != null) {
					dsPlaceBookList = new ArrayList<Map<String, Object>>();
					for (Map<String, Object> map : tempSameBookList) {
						Map<String, Object> searchItemD = LibSearchAPI.getBookDetail(new LibrarySearch(String.valueOf(map.get("LOCA")), String.valueOf(map.get("CTRLNO"))));
						if (searchItemD != null) {
							dsPlaceBookList.add(searchItemD);
						}
					}
				}
			}
			model.addAttribute("sameBook", dsPlaceBookList);
			if (StringUtils.isNotEmpty(librarySearch.getIsbn())) {
				model.addAttribute("naverDetail", LibSearchAPI.getNaverDetail(librarySearch.getIsbn()));
			}

		} catch (Exception e) {
		}

		model.addAttribute("callNoBrowsing", LibSearchAPI.getCallNoBrowsingList(librarySearch.getvCtrl(), "5"));
		model.addAttribute("sameAuthorBookList", LibSearchAPI.getSameAuthorBookList(result));
		model.addAttribute("isTodayClosed", calendarManageService.isTodayClosed(homepage.getHomepage_id()));
		returnPage = "detail";
		return String.format(basePath, homepage.getFolder()) + returnPage;
	}

	@RequestMapping(value = {"/index_detail.*"})
	public String indexDetail(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, Delivery delivery, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		//model.addAttribute("introMenu", "도서상세정보");//임시
		Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);
		model.addAttribute("detail", result);
		model.addAttribute("librarySearch", librarySearch);
		String returnPage = "detail";
		
		model.addAttribute("isTodayClosed", calendarManageService.isTodayClosed(homepage.getHomepage_id()));
		model.addAttribute("delivery", delivery);
		//결과리스트에서 이용가능여부 클릭 시
		returnPage = "index_detail_ajax";
		return String.format(basePath, homepage.getFolder()) + returnPage;
	}
	
	@RequestMapping(value = {"/index_detail_ilus.*"})
	public String index_detail_ilus(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		//model.addAttribute("introMenu", "도서상세정보");//임시
		Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);
		model.addAttribute("detail", result);
		model.addAttribute("librarySearch", librarySearch);
		String returnPage = "detail";
		//결과리스트에서 이용가능여부 클릭 시
		returnPage = "index_detail_ajax";
		return String.format(basePath, homepage.getFolder()) + returnPage;
	}


	@RequestMapping(value = {"/callNoBrowsing.*"})
	public String callNoBrowsing(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		model.addAttribute("callNoBrowsing", LibSearchAPI.getCallNoBrowsingList(librarySearch.getvCtrl(), "5"));

		return String.format(basePath, homepage.getFolder()) + "callNoBrowsing_ajax";
	}

	@RequestMapping(value = {"/detailPopup.*"})
	public String detailPopup(Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		//model.addAttribute("introMenu", "도서상세정보");//임시
		Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);
		model.addAttribute("detail", result);
		model.addAttribute("librarySearch", librarySearch);
		model.addAttribute("isTodayClosed", calendarManageService.isTodayClosed(homepage.getHomepage_id()));
		return String.format(basePath, homepage.getFolder()) + "detailPopup_ajax";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/newBook/index.*"})
	public String getNewBookList(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

			librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
			librarySearch.setSearch_end_date(sf.format(new Date()));
		}

		// 소장처 코드
		if (StringUtils.isEmpty(librarySearch.getvLoca())) {
			librarySearch.setvLoca(homepage.getHomepage_code());
		}

		Map<String, Object> result = LibSearchAPI.getNewBookList(librarySearch, null);
		List<Map<String, Object>> list = (List<Map<String, Object>>) result.get("dsNewBookListCnt");
		Map<String, Object> cnt = (Map<String, Object>) list.get(0);
		int count = Integer.parseInt(String.valueOf(cnt.get("CNT")));

		librarySearch.setTotalDataCount(count);
		result = bookImageService.resultImageMap(LibSearchAPI.getNewBookList(librarySearch, null),librarySearch, "dsNewBookList", "COVER_SMALLURL");
		service.setPaging(model, count, librarySearch);

		model.addAttribute("newBookList", result);
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "newBook/index";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/lnkBook/index.*"})
	public String getLnkBookList(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		// 소장처 코드
		librarySearch.setvLoca(homepage.getHomepage_code());

		Map<String, Object> result = LibSearchAPI.getLnkBookList(librarySearch, "N");
		List<Map<String, Object>> list = (List<Map<String, Object>>) result.get("dsLibraryListCnt");
		Map<String, Object> cnt = (Map<String, Object>) list.get(0);
		int count = Integer.parseInt(String.valueOf(cnt.get("CNT")));

		librarySearch.setTotalDataCount(count);

		service.setPaging(model, count, librarySearch);
		result = LibSearchAPI.getLnkBookList(librarySearch, "N");
		
		try {
			result = bookImageService.resultImageMap(result, librarySearch, "dsLibraryList", "COVER_SMALLURL");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("lnkBookList", result);
		model.addAttribute("librarySearch", librarySearch);

		return String.format(basePath, homepage.getFolder()) + "lnkBook/index";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/lnkBook/lnkBook.*"})
	public String getLnkBookList2(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		// 소장처 코드
		librarySearch.setvLoca(homepage.getHomepage_code());

		Map<String, Object> result = LibSearchAPI.getLnkBookList(librarySearch, "N");
		List<Map<String, Object>> list = (List<Map<String, Object>>) result.get("dsLibraryListCnt");
		Map<String, Object> cnt = (Map<String, Object>) list.get(0);
		int count = Integer.parseInt(String.valueOf(cnt.get("CNT")));

		librarySearch.setTotalDataCount(count);
		result = LibSearchAPI.getLnkBookList(librarySearch, null);
		service.setPaging(model, count, librarySearch);

		model.addAttribute("lnkBookList", result);
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "lnkBook/lnkBook_ajax";
	}

	@RequestMapping(value = {"/bestBook/index.*"})
	public String bestBookList(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		// 소장처 코드
		librarySearch.setvLoca(homepage.getHomepage_code());

		if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

			librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
			librarySearch.setSearch_end_date(sf.format(new Date()));
		}

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -3);
		Map<String, Object> result = LibSearchAPI.getBestBookList(librarySearch);
		
		try {
			result = bookImageService.resultImageMap(result ,librarySearch, "dsLoanBestList", "COVER_SMALLURL");
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("bestBookList", result);
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "bestBook/index";
	}

	@RequestMapping(value = {"/ageLoanBest/index.*"})
	public String ageLoanBestList(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		model.addAttribute("searchMenuIdx", homepageService.getMenuIdxByProgramIdx(homepage.getHomepage_id(), 2));
		return String.format(basePath, homepage.getFolder()) + "ageLoanBest/index";
	}

	@RequestMapping(value = {"/ageLoanBest/ageLoanBest.*"})
	public String ageLoanBest2(Model model, LibrarySearch librarySearch, HttpServletRequest request, @PathVariable("homepagePath") String homepagePath) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		List<String> locaList = new ArrayList<String>();
		locaList.add(homepage.getHomepage_code());

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -3);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		String startDate = sdf.format(cal.getTime());
		String endDate = sdf.format(new Date());

		Map<String, Object> ageLoanBestList = null;

		ageLoanBestList = LibSearchAPI.getAgeLoanBestList(startDate, endDate, locaList);

		try {
			ageLoanBestList = bookImageService.resultImageMap(ageLoanBestList ,librarySearch, "dsAgeBestList", "COVER_SMALLURL");
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("ageLoanBestList", ageLoanBestList);
		model.addAttribute("searchMenuIdx", homepageService.getMenuIdxByProgramIdx(homepage.getHomepage_id(), 2));
		return String.format(basePath, homepage.getFolder()) + "ageLoanBest_ajax";
	}

	@RequestMapping(value = {"/hope/index.*"})
	public String hopeIndex(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Menu menuOne = (Menu) request.getAttribute("menuOne");
		if ( menuOne != null ) {
			model.addAttribute("html", menuHtmlService.getLastMenuHtmlOne(new MenuHtml(homepage.getHomepage_id(), menuOne.getMenu_idx())));
		}

		model.addAttribute("hopeHistoryMenuIdx", menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 12)));
		model.addAttribute("hopeList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "HOPE", null));
		model.addAttribute("librarySearch", librarySearch);
		model.addAttribute("view_yn", false);
		return String.format(basePath, homepage.getFolder()) + "hope/index";
	}

	@RequestMapping(value = {"/hope/history.*"})
	public String hopeHistory(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			librarySearch.setBefore_url(String.format("/%s/intro/search/hope/history.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

//		model.addAttribute("hopeList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "HOPE", null));
		Map<String, String> paramMap = new HashMap<String, String>();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		if (StringUtils.isEmpty(librarySearch.getSearch_start_date())) {
			librarySearch.setSearch_start_date(sdf.format(cal.getTime()));
		}
		if (StringUtils.isEmpty(librarySearch.getSearch_end_date())) {
			librarySearch.setSearch_end_date(sdf.format(new Date()));
		}
		paramMap.put("vSrchDateS", librarySearch.getSearch_start_date().replaceAll("-", ""));
		paramMap.put("vSrchDateE", librarySearch.getSearch_end_date().replaceAll("-", ""));
		paramMap.put("vSrchDateKey", "INSERT_DATE");
		paramMap.put("vSortKey", "INSERT_DATE");
		paramMap.put("vSortDir", "DESC");


		model.addAttribute("hopeList", LibSearchAPI.getMyLibrarySearchList("WEB", getSessionUserId(request), "HOPE", null, paramMap));
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "hope/history";
	}

	@RequestMapping(value = {"/hope/req.*"})
	public String reqHope(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		if ( StringUtils.isEmpty(homepage.getHomepage_code()) ) {
			service.alertMessageAndUrl("홈페이지 코드가 없어 신청 할 수 없습니다.", String.format("http://www.gbelib.kr/%s/index.do", homepage.getContext_path()), request, response);
			return null;
		}

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			librarySearch.setBefore_url(String.format("/%s/intro/search/hope/req.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		Member member = getSessionMemberInfo(request);
		if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
			if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
				service.alertMessageAndUrl("희망도서 신청 가능한 회원이 아닙니다.", String.format("http://www.gbelib.kr/%s/index.do", homepage.getContext_path()), request, response);
				return null;
			}
		}

		if ( !homepage.getHomepage_code().contains(member.getLoca())) {
			service.alertMessage("희망도서 신청은 소속도서관에서만 가능합니다.", request, response);
			return null;
		}

		//model.addAttribute("introMenu", "희망도서신청");//임시
		model.addAttribute("member", member);
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "hope/req";
	}

	@RequestMapping(value = {"/hope/kakaoDto.*"})
	public String kakaoDto(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "hope/kakaoDto_ajax";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/hope/searchKakao.*"},method=RequestMethod.POST)
	public String hopeSearchKakao(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		int totalDataCount = librarySearch.getTotalDataCount();
		Map<String,Object> jsonData = new HashMap<String, Object>();
		List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();		
		List<Map<String, Object>> jArray = new ArrayList<Map<String, Object>>();
		Object kakaoList = null;
		String errorMessage = null;
		int errorCode = 0;
		if(librarySearch.getJsonData() != null && librarySearch.getJsonData().length > 0) {
			for (int i = 0; i < librarySearch.getJsonData().length; i++){       
				String str = ((librarySearch.getJsonData()[i]).replaceAll("&quot;", "\\\"")).replace("^^^^", ",");
				JSONObject jsonString = new JSONObject(str);
				Map<String,Object> sMap = new HashMap<String,Object>();
				try {
					sMap.put("authors", jsonString.get("authors"));
					sMap.put("contents", jsonString.get("contents"));
					sMap.put("datetime", jsonString.get("datetime"));
					sMap.put("isbn", jsonString.get("isbn"));
					sMap.put("price", jsonString.get("price"));
					sMap.put("publisher", jsonString.get("publisher"));
					sMap.put("sale_price", jsonString.get("sale_price"));
					sMap.put("status", jsonString.get("status"));
					sMap.put("thumbnail", jsonString.get("thumbnail"));
					sMap.put("title", jsonString.get("title"));
					sMap.put("translators", jsonString.get("translators"));
					sMap.put("url", jsonString.get("url"));

					String[] isbnArr = String.valueOf(jsonString.get("isbn")).split(" ");

					for (int j = 0; j < isbnArr.length; j++) {
						String isbn = String.valueOf(isbnArr[j]);
						Map<String, Object> sameBook = (Map<String, Object>) LibSearchAPI.getSameBookList("WEB", isbn, homepage.getHomepage_codeList()[0]);
						if (sameBook != null) {
							List<Map<String, Object>> sameBookList = (List<Map<String, Object>>)sameBook.get("dsSameBookList");
							if (sameBookList != null && !sameBookList.isEmpty()) {
								Map<String, Object> firstBook = sameBookList.get(0);

								String statusName = (String) firstBook.get("STATUS_NAME");
								String ctrlNo = (String) firstBook.get("CTRLNO");

								String[] homepageCodes = homepage.getHomepage_codeList();
								String homepageCode = (homepageCodes != null && homepageCodes.length > 0) ? homepageCodes[0] : null;

								boolean isSpecialHomepage = "00147016".equals(homepageCode);//외동도서관
								boolean isDiscarded = "폐기제적".equals(statusName);

								if (isSpecialHomepage && isDiscarded) {
								} else {
									sMap.put("already", true);
									sMap.put("ctrlno", ctrlNo);
									sMap.put("status_name", statusName);
								}
							}
						}
					}

					// 희망도서 신청 중 중복 체크
					String title = String.valueOf(sMap.get("title"));

					for (int j = 0; j < isbnArr.length; j++) {
						String isbn = String.valueOf(isbnArr[j]);

						if (StringUtils.isNotEmpty(title) && !StringUtils.equalsIgnoreCase(title, "null")) {
							title = title.replaceAll("<b>", "").replaceAll("</b>", "");
							Map<String, Object> hopeDupl = LibSearchAPI.getDuplHopeCheck(homepage.getHomepage_codeList()[0], title, isbn);
							if(hopeDupl != null) {
								List<Map<String, Object>> hopeDuplList = (List<Map<String, Object>>)hopeDupl.get("dsHopeDupList");
								if(hopeDuplList != null && hopeDuplList.size() > 0) {
									sMap.put("hopeDupl", true);
								}
							}
						}
					}

					jArray.add(sMap);
				}catch (Exception e) {
					errorMessage = "데이터 오류 또는 자료관리시스템 연동 실패.";
					errorCode = 1;
				}
			}
		}

		jsonData.put("documents", jArray);

		kakaoList = jsonData.get("documents");

		if (kakaoList instanceof List) {
			itemList = (List<Map<String, Object>>) kakaoList;
		} else if (kakaoList instanceof Map){
			itemList.add((Map<String, Object>) kakaoList);
		}

		if("AJAX".equals(librarySearch.getEditMode())) {
			String[] value = String.valueOf(librarySearch.getBookValue()).split("\\^\\^\\^");
			librarySearch.setTitle(value[0]);
			librarySearch.setAuthor(value[1]);
			librarySearch.setPubler(value[2]);
			librarySearch.setPubler_year(value[3]);
			librarySearch.setIsbn(value[4]);
			librarySearch.setPrice(value[5]);
		}
		System.out.println("@@@@@@@@@@@@@@@@@@@ jsonData : " + jsonData.get("documents"));
		service.setPaging(model,totalDataCount, librarySearch);

		model.addAttribute("errorMessage", errorMessage);
		model.addAttribute("errorCode", errorCode);
		model.addAttribute("kakaoResult", itemList);
		model.addAttribute("totalDataCount", totalDataCount);
		model.addAttribute("librarySearch", librarySearch);
		if("AJAX".equals(librarySearch.getEditMode())) {
			return String.format(basePath, homepage.getFolder()) + "hope/req";
		}else{
			return String.format(basePath, homepage.getFolder()) + "hope/search";
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/hope/search.*"})
	public String hopeSearch(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( StringUtils.isEmpty(homepage.getHomepage_code()) ) {
			service.alertMessageAndUrl("홈페이지 코드가 없어 신청 할 수 없습니다.", String.format("http://www.gbelib.kr/%s/search.do", homepage.getContext_path()), request, response);
			return null;
		}

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			librarySearch.setBefore_url(String.format("/%s/intro/search/hope/search.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()) + "%26editMode%3DNOAJAX");
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		Member member = getSessionMemberInfo(request);
		if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
			if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
				service.alertMessageAndUrl("희망도서 신청 가능한 회원이 아닙니다.", String.format("http://www.gbelib.kr/%s/index.do", homepage.getContext_path()), request, response);
				return null;
			}
		}

		if ( !homepage.getHomepage_code().contains(member.getLoca())) {
			service.alertMessage("희망도서 신청은 소속도서관에서만 가능합니다.", request, response);
			return null;
		}

		HopebookConfig hopebookConfig = hopebookConfigService.getHopebookConfigInfo(homepage.getHomepage_id());
		if(hopebookConfig != null) {
			service.alertMessage(hopebookConfig.getRes_msg().replaceAll("(\r\n|\r|\n|\n\r)", "\\\\n"), request, response);
			return null;
		}

		model.addAttribute("member", member);
		model.addAttribute("librarySearch", librarySearch);

		Map<String, Object> map = null;
		if (StringUtils.isNotEmpty(librarySearch.getSearch_text())) {
			map = LibSearchAPI.getKakaoList(librarySearch);
			System.out.println("@@@@@@@@@@@@@@@@@@ kakao API : " + map);
			String totalCount = String.valueOf((((Map<String, Object>)map.get("meta"))).get("pageable_count"));

			List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();
			Object o = map.get("documents");
			if (o instanceof List) {
				itemList = (List<Map<String, Object>>) o;
			} else if (o instanceof Map){
				itemList.add((Map<String, Object>) o);
			}
			if (itemList != null && itemList.size() > 0) {
				for (Map<String, Object> map2 : itemList) {
					String[] isbnArr = String.valueOf(map2.get("isbn")).split(" ");
					for (int i = 0; i < isbnArr.length; i++) {
						String isbn = String.valueOf(map2.get("isbn")).split(" ")[i];

						Map<String, Object> sameBook = (Map<String, Object>) LibSearchAPI.getSameBookList("WEB", isbn, homepage.getHomepage_codeList()[0]);
						if (sameBook != null) {
							List<Map<String, Object>> sameBookList = (List<Map<String, Object>>)sameBook.get("dsSameBookList");
							if (sameBookList != null && sameBookList.size() > 0) {
								map2.put("already", true);
								map2.put("ctrlno", sameBookList.get(0).get("CTRLNO"));
							}
						}
					}

					// 희망도서 신청 중 중복 체크
					String title = String.valueOf(map2.get("title"));
					for (int j = 0; j < isbnArr.length; j++) {
						String isbn = String.valueOf(isbnArr[j]);

						if (StringUtils.isNotEmpty(title) && !StringUtils.equalsIgnoreCase(title, "null")) {
							title = title.replaceAll("<b>", "").replaceAll("</b>", "");
							Map<String, Object> hopeDupl = LibSearchAPI.getDuplHopeCheck(homepage.getHomepage_codeList()[0], title, isbn);
							if(hopeDupl != null) {
								List<Map<String, Object>> hopeDuplList = (List<Map<String, Object>>)hopeDupl.get("dsHopeDupList");
								if(hopeDuplList != null && hopeDuplList.size() > 0) {
									map2.put("hopeDupl", true);
								}
							}
						}
					}
				}
				service.setPaging(model, Integer.parseInt(totalCount), librarySearch);
				model.addAttribute("kakaoResult", itemList);
			}
		}
		model.addAttribute("librarySearch", librarySearch);
		if ( "NOAJAX".equals(librarySearch.getEditMode()) ) {
			return String.format(basePath, homepage.getFolder()) + "hope/search";
		}else if ("REQ".equals(librarySearch.getEditMode())) {
			return String.format(basePath, homepage.getFolder()) + "hope/reqSearch_ajax";
		}else {
			return String.format(basePath, homepage.getFolder()) + "hope/search_ajax";
		}
	}

	@RequestMapping(value = {"/hope/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse saveHope(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		JsonResponse res = new JsonResponse(request);

		if(librarySearch.getEditMode().equals("ADD")) {
			ValidationUtils.rejectIfEmpty(result, "title", "제목을 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "author", "저자를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "publer", "출판사를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "publer_year", "연도를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "price", "가격을 입력하세요.");
		}

		Member member = getSessionMemberInfo(request);

		if (homepage.getContext_path().equals("jc")) {
			//점촌은 가은과 같이 있음. 선택을 할 수 있기 때문에 선택한 도서관으로 신청한다.
			member.setLoca(librarySearch.getvLoca());
		}

		if(!result.hasErrors()) {
			if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
				if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
					res.setValid(false);
					res.setMessage("희망도서 신청 가능한 회원이 아닙니다.");
					return res;
				}
			}

			HopebookConfig hopebookConfig = hopebookConfigService.getHopebookConfigInfo(homepage.getHomepage_id());
			if(hopebookConfig != null) {
				res.setValid(false);
				res.setMessage(hopebookConfig.getRes_msg());
				return res;
			}

			if ( librarySearch.getEditMode().equals("ADD") ) {
				if ( !homepage.getHomepage_code().contains(",") ) {
					librarySearch.setvLoca(homepage.getHomepage_code());
				}

				StringBuilder sb = new StringBuilder();
				sb.append(librarySearch.getEditMode() + "\n");
				sb.append(librarySearch.getvLoca() + "\n");
				sb.append(librarySearch.getTitle() + "\n");
				sb.append(librarySearch.getAuthor() + "\n");
				sb.append(librarySearch.getPubler() + "\n");
				sb.append(librarySearch.getPubler_year() + "\n");
				sb.append(librarySearch.getIsbn() + "\n");
				sb.append(librarySearch.getEditon() + "\n");
				sb.append(librarySearch.getUser_remark() + "\n");
				sb.append(librarySearch.getPrice() + "\n");
				String addResult = WebFilterCheckUtils.webFilterCheck("신청자", "신청", sb.toString());
				if (addResult != null) {
					res.setValid(false);
					res.setUrl(addResult);
					res.setTargetOpener(true);
					return res;
				}

				ApiResponse hopeUserCheck = LibSearchAPI.hopeUserCheck("WEB", librarySearch, member.getUser_id(), member.getLoca());

				if ( hopeUserCheck.getStatus() ) {
					ApiResponse apiResult = LibSearchAPI.reqHope("WEB", librarySearch, member.getUser_id(), member.getLoca());
					if ( apiResult.getStatus() ) {
						res.setValid(true);

						Calendar now = Calendar.getInstance();
						int year = now.get(Calendar.YEAR);
						int month = now.get(Calendar.MONTH) + 1;
						int day = now.get(Calendar.DAY_OF_MONTH);

						if (year == 2024 && month == 12 && day >= 1 && day <= 31 && "h18".equals(homepage.getHomepage_id())) {
							res.setMessage("해당 건은 2025년 1월 도서구입 시 반영됩니다.");
						} else {
							res.setMessage("등록 되었습니다.");
						}
					}
					else {
						res.setValid(false);
						res.setMessage(apiResult.getMessage());
					}
				}
				else {
					res.setValid(false);
					res.setMessage(hopeUserCheck.getMessage());
				}


			}
			else if ( librarySearch.getEditMode().equals("CANCEL") ) {
				ApiResponse apiResult = LibSearchAPI.modHope("WEB", librarySearch, getSessionUserId(request));
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("취소 되었습니다.");
				}
				else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/resve/index.*", "/resve/detail.*"})
	public String myResve(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/resve/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		if(request.getRequestURI().endsWith("/resve/detail.do")) {
			model.addAttribute("resveDetail", LibSearchAPI.getResveDetail("WEB", librarySearch.getvResveNo()));
		    return String.format(basePath, homepage.getFolder()) + "resve/detail";
		}
		else {
			model.addAttribute("resveList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "RESVE", null));
			return String.format(basePath, homepage.getFolder()) + "resve/index";
		}
	}

	@RequestMapping(value = {"/resve/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse saveResve(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (Exception e) {
                librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			result.reject("로그인 후 이용가능합니다.");
			res.setUrl(String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()));
		}

		// 0001:예약, 0002:연장, 0003:야간대출
		ILUSReqConfig ilusReqConfig = ilusReqConfigService.getILUSReqConfigInfo(librarySearch, "0001");
		if(ilusReqConfig != null) {
			res.setValid(false);
			res.setMessage(ilusReqConfig.getRes_msg());
			return res;
		}

		if(!result.hasErrors()) {
			Member member = getSessionMemberInfo(request);
			if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
				if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
					res.setValid(false);
					res.setMessage("예약 신청 가능한 회원이 아닙니다.");
					return res;
				}
			}

			if ( librarySearch.getEditMode().equals("ADD") ) {
				ApiResponse apiResult = LibSearchAPI.reqResve("WEB", librarySearch, getSessionUserId(request));
				if ( apiResult.getStatus() ) {
					String message = "등록되었습니다.";

					// 예약자순위 가져오기
					Map<String, Object> myLibraryList = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "RESVE", null);
					if (myLibraryList != null && myLibraryList.containsKey("dsMyLibraryList")) {
						@SuppressWarnings("unchecked")
						List<Map<String, String>> resveList = (List<Map<String, String>>) myLibraryList.get("dsMyLibraryList");
						if (resveList != null && resveList.size() > 0) {
							for ( Map<String, String> map : resveList ) {
								if(StringUtils.equals(map.get("CTRLNO"), librarySearch.getvCtrl()) && "0002".equals(map.get("RESVE_STATUS"))) {
									 message = map.get("RESVE_RANK") + "번째로 예약이 완료되었습니다.";
									 break;
								}
							}
						}
					}

					res.setValid(true);
					res.setMessage(message);
				}
				else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}
			else if ( librarySearch.getEditMode().equals("CANCEL") ) {
				ApiResponse apiResult = LibSearchAPI.modResve("WEB", librarySearch, getSessionUserId(request));
				//ApiResponse apiResult = LibSearchAPI.modResve("WEB", librarySearch, "future");
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("취소 되었습니다.");
				}
				else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/nightresve/index.*", "/nightresve/detail.*"})
	public String myNightResve(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/nightresve/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		if(request.getRequestURI().endsWith("/nightresve/detail.do")) {
			model.addAttribute("nightResveDetail", LibSearchAPI.getNightResveDetail("WEB", librarySearch.getvSeqNo()));
			return String.format(basePath, homepage.getFolder()) + "nightresve/detail";
		}
		else {
			model.addAttribute("nightResveList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "BEACH", null));
			return String.format(basePath, homepage.getFolder()) + "nightresve/index";
		}
	}

	@RequestMapping(value = {"/nightresve/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse saveNightResve(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JsonResponse res = new JsonResponse(request);

		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/close/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			result.reject("로그인 후 이용가능합니다.");
			res.setUrl(String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()));
		}

		if(!result.hasErrors()) {
			Member member = getSessionMemberInfo(request);
			if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
				if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
					res.setValid(false);
					res.setMessage("예약 신청 가능한 회원이 아닙니다.");
					return res;
				}
			}

			// 0001:예약, 0002:연장, 0003:야간대출
			ILUSReqConfig ilusReqConfig = ilusReqConfigService.getILUSReqConfigInfo(librarySearch, "0003");
			if(ilusReqConfig != null) {
				res.setValid(false);
				res.setMessage(ilusReqConfig.getRes_msg());
				return res;
			}

			if ( librarySearch.getEditMode().equals("ADD") ) {
//				ApiResponse apiResult = LibSearchAPI.reqPouch("WEB", librarySearch, getSessionUserId(request));
//				ApiResponse apiResult = LibSearchAPI.reqResve("WEB", librarySearch, "future");
//				if ( apiResult.getStatus() ) {
//					res.setValid(true);
//					res.setMessage("신청 되었습니다.");
//				} else if(StringUtils.isEmpty(apiResult.getMessage())){
//					res.setValid(false);
//					res.setMessage("야간대출 신청권수를 초과하였습니다.");
//				} else {
//					res.setValid(false);
//					res.setMessage(apiResult.getMessage());
//				}
			}
			else if ( librarySearch.getEditMode().equals("CANCEL") ) {
				ApiResponse apiResult = LibSearchAPI.modPouch("WEB", librarySearch, getSessionUserId(request));
				//ApiResponse apiResult = LibSearchAPI.modResve("WEB", librarySearch, "future");
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("취소 되었습니다.");
				}
				else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/delivery/edit.*"})
	public String edit(@PathVariable("homepagePath") String homepagePath, Model model, Delivery delivery, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		delivery.setHomepage_id(homepage.getHomepage_id());

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				delivery.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				delivery.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/delivery/index.do?menu_idx=%s", homepage.getContext_path(), delivery.getMenu_idx()));
			} catch (NullPointerException e) {
				delivery.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/delivery/index.do?menu_idx=%s", homepage.getContext_path(), delivery.getMenu_idx()));
			}
            service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), delivery.getMenu_idx(), delivery.getBefore_url()), request, response);
			return null;
		}

		model.addAttribute("member", getSessionMemberInfo(request));
		model.addAttribute("delivery", delivery);
		return String.format(basePath, homepage.getFolder()) + "delivery/edit";
	}

	@RequestMapping(value = {"/delivery/list.*"})
	public String deliveryList(@PathVariable("homepagePath") String homepagePath, Model model, Delivery delivery, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		delivery.setHomepage_id(homepage.getHomepage_id());
		delivery.setMember_id(getSessionMemberInfo(request).getUser_id());

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				delivery.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				delivery.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/delivery/list.do?menu_idx=%s", homepage.getContext_path(), delivery.getMenu_idx()));
			} catch (NullPointerException e) {
				delivery.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/delivery/list.do?menu_idx=%s", homepage.getContext_path(), delivery.getMenu_idx()));
			}
            service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), delivery.getMenu_idx(), delivery.getBefore_url()), request, response);
			return null;
		}

		deliveryService.setPaging(model, deliveryService.getDeliveryListCount(delivery), delivery);
		model.addAttribute("deliveryList", deliveryService.getDeliveryList(delivery));
		return String.format(basePath, homepage.getFolder()) + "delivery/list";
	}

	@RequestMapping(value = {"/delivery/returndelivery.*"})
	public String returnDelivery(@PathVariable("homepagePath") String homepagePath, Model model, Delivery delivery, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		delivery.setHomepage_id(homepage.getHomepage_id());
		delivery.setMember_id(getSessionMemberInfo(request).getUser_id());

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				delivery.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				delivery.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/delivery/returndelivery.do?menu_idx=%s", homepage.getContext_path(), delivery.getMenu_idx()));
			} catch (NullPointerException e) {
				delivery.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/delivery/returndelivery.do?menu_idx=%s", homepage.getContext_path(), delivery.getMenu_idx()));
			}
            service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), delivery.getMenu_idx(), delivery.getBefore_url()), request, response);
			return null;
		}

		deliveryService.setPaging(model, deliveryService.getReturnDeliveryListCount(delivery), delivery);
		model.addAttribute("deliveryList", deliveryService.getReturnDeliveryList(delivery));
		return String.format(basePath, homepage.getFolder()) + "delivery/returndelivery";
	}

	@RequestMapping(value = {"/delivery/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse saveDelivery(Model model, Delivery delivery, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		JsonResponse res = new JsonResponse(request);

		Homepage homepage = (Homepage) request.getAttribute("homepage");
		delivery.setHomepage_id(homepage.getHomepage_id());
		delivery.setMember_id(getSessionMemberInfo(request).getUser_id());

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				delivery.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				delivery.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/close/index.do?menu_idx=%s", homepage.getContext_path(), delivery.getMenu_idx()));
			}
			result.reject("로그인 후 이용가능합니다.");
			res.setUrl(String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), delivery.getMenu_idx(), delivery.getBefore_url()));
		}

		if (deliveryService.getDuplicateDelivery(delivery) > 0) {
			result.reject("이미 신청된 책입니다.");
		}

		if(!result.hasErrors()) {
			if (delivery.getEditMode().equals("ADD")) {
				ValidationUtils.rejectIfEmpty(result, "book_title", "책 제목을 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "book_loca_name", "소장처를 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "book_call_no", "책 청구기호를 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "book_acsson_no", "책 등록번호를 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "member_name", "성명을 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "member_cell_phone", "휴대폰 번호를 입력해주세요.");
				ValidationUtils.rejectIfEmpty(result, "member_address", "주소를 입력해주세요.");
				deliveryService.addDelivery(delivery);
				res.setValid(true);
				res.setMessage("택배 신청이 완료되었습니다.");
				res.setUrl(String.format("http://www.gbelib.kr/%s/intro/search/delivery/list.do?menu_idx=244", homepage.getContext_path()));
			}
			if (delivery.getEditMode().equals("CANCEL")) {
				deliveryService.deleteDelivery(delivery);
				res.setValid(true);
				res.setMessage("택배 신청이 취소되었습니다.");
				res.setUrl(String.format("http://www.gbelib.kr/%s/intro/search/delivery/list.do?menu_idx=244", homepage.getContext_path()));
			}
			if (delivery.getEditMode().equals("RETURN")) {
				deliveryService.updateReturnDelivery(delivery);
				res.setValid(true);
				res.setMessage("택배 반납 신청이 완료되었습니다.");
				res.setUrl(String.format("http://www.gbelib.kr/%s/intro/search/delivery/returndelivery.do?menu_idx=245", homepage.getContext_path()));
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/close/index.*"})
	public String myClose(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/close/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		Map<String, Object> closeList = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "CLOSE", null);

		model.addAttribute("closeList", closeList);
		return String.format(basePath, homepage.getFolder()) + "close/index";
	}

	@RequestMapping(value = {"/close/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse saveClose(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/close/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			result.reject("로그인 후 이용가능합니다.");
			res.setUrl(String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()));
		}

		if(!result.hasErrors()) {
			Member member = getSessionMemberInfo(request);
			if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
				if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
					res.setValid(false);
					res.setMessage("보존서고 신청 가능한 회원이 아닙니다.");
					return res;
				}
			}

			SmsReception smsReception = new SmsReception();
			smsReception.setHomepage_id(homepage.getHomepage_id());
			smsReception.setWork_code("0001");	// 보존서고:0001, 상호대차:0002
			List<SmsReception> receptionsList =  smsReceptionService.getSmsReceptionMembers(smsReception);

			Homepage smsHomepage = new Homepage();
			smsHomepage.setHomepage_code(librarySearch.getvLoca());
			smsHomepage = homepageService.getHomepageOneByCode(smsHomepage);

			if ( librarySearch.getEditMode().equals("ADD") ) {
				ApiResponse apiResult = LibSearchAPI.reqClose("WEB", librarySearch, getSessionUserId(request));
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("신청 되었습니다.");

					// 신청자에게 SMS 전송
					String message = "보존서고 신청이 완료 되었습니다.[" + librarySearch.getTitle() + "]";
					if (isSmsReceive("WEBID", getSessionMemberId(request))) {
						pushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, member.getMobile_no(), message, smsHomepage.getHomepage_send_tell(), true);
					}

					// 관리자에게 SMS 전송
					for(SmsReception one : receptionsList) {
						pushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, one.getReception_phone(), message, smsHomepage.getHomepage_send_tell(), false);
					}
				} else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			} else if ( librarySearch.getEditMode().equals("CANCEL") ) {
				ApiResponse apiResult = LibSearchAPI.modClose("WEB", librarySearch, getSessionUserId(request));
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("취소 되었습니다.");
					// 신청자에게 SMS 전송
					String message = "보존서고 신청이 취소 되었습니다.[" + librarySearch.getTitle() + "]";
					if (isSmsReceive("WEBID", getSessionMemberId(request))) {
						pushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, member.getMobile_no(), message, smsHomepage.getHomepage_send_tell(), true);
					}

					// 관리자에게 SMS 전송
					for(SmsReception one : receptionsList) {
						pushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, one.getReception_phone(), message, smsHomepage.getHomepage_send_tell(), false);
					}
				} else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	/**
	 *
	 * @param mode WEBID, USERID
	 * @param id webid, user_id
	 * @return
	 */
	public boolean isSmsReceive(String mode, String id) {
		Member member = new Member();
		Map<String, String> map = null;
		if ("WEBID".equals(mode)) {
			member.setCheck_certify_type("WEBID");
			member.setCheck_certify_data(id);
			map = MemberAPI.getMemberCertify("WEB", member);
			member.setUser_id(map.get("USER_ID"));
		} else {
			member.setUser_id(id);
		}
		map = MemberAPI.getMember("WEB", member);

		if(map != null) {
			return StringUtils.equals(map.get("SMS_CHECK"), "Y");
		} else {
			return false;
		}
	}


	@RequestMapping(value = {"/pouch/index.*", "/pouch/detail.*"})
	public String myPouch(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/pouch/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		Member member = getSessionMemberInfo(request);
		if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
			if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
				service.alertMessageAndUrl("예약 가능한 회원이 아닙니다.", String.format("/%s/index.do", homepage.getContext_path()), request, response);
				return null;
			}
		}

		if(request.getRequestURI().endsWith("/pouch/detail.do")) {
			model.addAttribute("pouchDetail", LibSearchAPI.getPouchDetail("WEB", librarySearch.getvSeqNo()));
		    return String.format(basePath, homepage.getFolder()) + "pouch/detail";
		}
		else {
			model.addAttribute("pouchList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "BEACH", null));
//			model.addAttribute("pouchList", LibSearchAPI.getPouchList("WEB", member.getUser_id(), "req", homepage.getHomepage_code(), ""));
			return String.format(basePath, homepage.getFolder()) + "pouch/index";
		}

//		model.addAttribute("pouchList", LibSearchAPI.getPouchList("WEB", member.getUser_id(), "req", homepage.getHomepage_code(), ""));
//		return String.format(basePath, homepage.getFolder()) + "pouch/index";
	}

	@RequestMapping(value = {"/pouch/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse savePouch(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JsonResponse res = new JsonResponse(request);

		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (Exception e) {
                librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			result.reject("로그인 후 이용가능합니다.");
			res.setUrl(String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()));
		}
		
		if(!result.hasErrors()) {
			Member member = getSessionMemberInfo(request);
			if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
				if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
					res.setValid(false);
					res.setMessage("예약 신청 가능한 회원이 아닙니다.");
					return res;
				}
			}

			// 0001:예약, 0002:연장, 0003:야간대출
			ILUSReqConfig ilusReqConfig = ilusReqConfigService.getILUSReqConfigInfo(librarySearch, "0003");
			if(ilusReqConfig != null) {
				res.setValid(false);
				res.setMessage(ilusReqConfig.getRes_msg());
				return res;
			}

			if ( librarySearch.getEditMode().equals("ADD") ) {
				ApiResponse apiResult = LibSearchAPI.reqPouch("WEB", librarySearch, getSessionUserId(request));
				//ApiResponse apiResult = LibSearchAPI.reqResve("WEB", librarySearch, "future");
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("야간대출예약이 완료되었습니다.");
				} else if(StringUtils.isEmpty(apiResult.getMessage())){
					res.setValid(false);
					res.setMessage("야간대출 신청권수를 초과하였습니다.");
				} else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}
			else if ( librarySearch.getEditMode().equals("CANCEL") ) {
				ApiResponse apiResult = LibSearchAPI.modPouch("WEB", librarySearch, getSessionUserId(request));
				//ApiResponse apiResult = LibSearchAPI.modResve("WEB", librarySearch, "future");
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("취소 되었습니다.");
				}
				else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

    @RequestMapping(value = {"/driveThru/index.*"})
    public String driveThru(@PathVariable("homepagePath") String homepagePath, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        model.addAttribute("driveThruList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "POUCH", null));
        return String.format(basePath, homepage.getFolder()) + "driveThru/index";
    }

    @RequestMapping(value = {"/driveThru/save.*"})
    public @ResponseBody JsonResponse saveDriveThru(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JsonResponse res = new JsonResponse(request);

        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
            try {
                librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
            } catch (Exception e) {
                librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
            }
            result.reject("로그인 후 이용가능합니다.");
            res.setUrl(String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()));
        }

        if(!result.hasErrors()) {
            Member member = getSessionMemberInfo(request);
            if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
                if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
                    res.setValid(false);
                    res.setMessage("예약 신청 가능한 회원이 아닙니다.");
                    return res;
                }
            }

            if ( librarySearch.getEditMode().equals("ADD") ) {
                ApiResponse apiResult = LibSearchAPI.reqDrive("WEB", librarySearch, getSessionUserId(request));
                try {
                    if ( apiResult.getStatus() ) {
                        res.setValid(true);
                        res.setMessage("신청 되었습니다.");
                    } else if(StringUtils.isEmpty(apiResult.getMessage())){
                        res.setValid(false);
                        res.setMessage("당일픽업예약 신청을 실패했습니다.");
                    } else {
                        res.setValid(false);
                        res.setMessage(apiResult.getMessage());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    res.setValid(false);
                    res.setMessage("통신장애가 발생하였습니다. 원인:" + e.getClass().getName());
                    return res;
                }
            }
            else if ( librarySearch.getEditMode().equals("CANCEL") ) {
                ApiResponse apiResult = LibSearchAPI.modPouch("WEB", librarySearch, getSessionUserId(request));
                try {
                    if ( apiResult.getStatus() ) {
                        res.setValid(true);
                        res.setMessage("취소 되었습니다.");
                    }
                    else {
                        res.setValid(false);
                        res.setMessage(apiResult.getMessage());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    res.setMessage("통신장애가 발생하였습니다. 원인:" + e.getClass().getName());
                    return res;
                }
            }
        } else {
            res.setValid(false);
            res.setResult(result.getAllErrors());
        }

        return res;
    }

	@RequestMapping(value = {"/loan/index.*", "/loan/detail.*", "/loan/history.*"})
	public String myLoan(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/loan/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		Member member = getSessionMemberInfo(request);
		if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
			if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
//				service.aler tMessageAndUrl("대출 가능한 회원이 아닙니다.", String.format("http://www.gbelib.kr/%s/index.do", homepage.getContext_path()), request, response);
//				return null;
			}
		}

		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Date currentDate = new Date();

		if(request.getRequestURI().endsWith("/loan/detail.do")) {
			model.addAttribute("loanDetail", LibSearchAPI.getLoanDetail("WEB", librarySearch.getvLoanNo()));
		    return String.format(basePath, homepage.getFolder()) + "loan/detail";
		} else if(request.getRequestURI().endsWith("/loan/history.do")) {
			model.addAttribute("loanList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "LOAN", null, member.getvFamYn()));
			return String.format(basePath, homepage.getFolder()) + "loan/history";
		} else {Map<String, Object> myLibraryList = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "LOAN", "0001", member.getvFamYn());
			if (myLibraryList!= null && !myLibraryList.isEmpty()) {
				List<Map<String, Object>> dsMyLibraryList = (List<Map<String, Object>>) myLibraryList.get("dsMyLibraryList");

				for (Map<String, Object> getLibraryList : dsMyLibraryList) {
					String returnPlanDateStr = (String) getLibraryList.get("RETURN_PLAN_DATE");
					Date returnPlanDate = formatter.parse(returnPlanDateStr);

					long diffInMillies = returnPlanDate.getTime() - currentDate.getTime();
					long daysBetween = diffInMillies / (1000 * 60 * 60 * 24);

					if (daysBetween <= 3 && daysBetween >= 0) {
						getLibraryList.put("RETURN_CHECK", true);
					} else {
						getLibraryList.put("RETURN_CHECK", false);
					}
				}
			}

			model.addAttribute("loanList", myLibraryList);
		    return String.format(basePath, homepage.getFolder()) + "loan/index";
		}
	}

	@RequestMapping(value = {"/loan/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse renewLoan(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);

		if(!result.hasErrors()) {
			Member member = getSessionMemberInfo(request);
			if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
				if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
					res.setValid(false);
					res.setMessage("대출 연장 신청 가능한 회원이 아닙니다.");
					return res;
				}
			}

			// 0001:예약, 0002:연장, 0003:야간대출
			ILUSReqConfig ilusReqConfig = ilusReqConfigService.getILUSReqConfigInfo(librarySearch, "0002");
			if(ilusReqConfig != null) {
				res.setValid(false);
				res.setMessage(ilusReqConfig.getRes_msg());
				return res;
			}

			if ( librarySearch.getEditMode().equals("ADD") ) {

			}
			else if ( librarySearch.getEditMode().equals("RENEW") ) {
				//ApiResponse apiResult = LibSearchAPI.renewLoan("WEB", librarySearch, "future");
				ApiResponse apiResult = LibSearchAPI.renewLoan("WEB", librarySearch, getSessionUserId(request));
				if ( apiResult.getStatus() ) {
					res.setValid(true);
					res.setMessage("대출 연장 되었습니다.");
				}
				else {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
				}
			}

		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/loan/bookBatchReturnDelay.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse bookBatchReturnDelay(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);

		if (!result.hasErrors()) {
			String[] returnDelayArray = librarySearch.getReturnDelayArray();
			if (returnDelayArray != null && returnDelayArray.length > 0) {
				boolean allSuccessful = true;
				StringBuilder message = new StringBuilder();

				for (String key : returnDelayArray) {
					librarySearch.setvLoanNo(key);
					ApiResponse apiResult = LibSearchAPI.renewLoan("WEB", librarySearch, getSessionUserId(request));
					if (!apiResult.getStatus()) {
						allSuccessful = false;
						message.append(apiResult.getMessage()).append("\n");
					}
				}

				if (allSuccessful) {
					res.setValid(true);
					res.setMessage("모든 반납연기가 성공적으로 처리되었습니다.");
				} else {
					res.setValid(false);
					res.setMessage(message.toString());
				}
			} else {
				res.setValid(false);
				res.setMessage("반납연기를 요청할 도서가 선택되지 않았습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/out/history.*"})
	public String myOut(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		// String vOption = '0001' 신청|배송중|대출대기만 리스트에 출력됨

		Map<String, String> paramMap = new HashMap<String, String>();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		if (StringUtils.isEmpty(librarySearch.getSearch_start_date())) {
			librarySearch.setSearch_start_date(sdf.format(cal.getTime()));
		}
		if (StringUtils.isEmpty(librarySearch.getSearch_end_date())) {
			librarySearch.setSearch_end_date(sdf.format(new Date()));
		}

		paramMap.put("vSrchDateS", librarySearch.getSearch_start_date().replaceAll("-", ""));
		paramMap.put("vSrchDateE", librarySearch.getSearch_end_date().replaceAll("-", ""));

		// paramMap.put("vSrchDateKey", "STATUS_CHANGE_DATE");

		paramMap.put("vSortKey", "STATUS_CHANGE_DATE");
		paramMap.put("vSortDir", "DESC");

		// 페이징을 위한 전체 카운터 조회
		Map<String, Object> result = LibSearchAPI.getMyLibrarySearchList("WEB", getSessionUserId(request), "OUT", null, paramMap);
		List<Map<String, Object>> list = (List<Map<String, Object>>) result.get("dsMyLibraryListCnt");
		Map<String, Object> cnt = (Map<String, Object>) list.get(0);

		int count = Integer.parseInt(String.valueOf(cnt.get("CNT")));

		librarySearch.setTotalDataCount(count);
		// 페이징 변수 시작, 끝값
		paramMap.put("vStartPos", Integer.toString(librarySearch.getStartRowNum()));
		paramMap.put("vEndPos",Integer.toString(librarySearch.getEndRowNum()));

		result = LibSearchAPI.getMyLibrarySearchList("WEB", getSessionUserId(request), "OUT", null, paramMap);

		service.setPaging(model, count, librarySearch);

		model.addAttribute("totalCount", count);
		model.addAttribute("outList", result);
		model.addAttribute("librarySearch", librarySearch);
		return String.format(basePath, homepage.getFolder()) + "out/history";
	}


	@RequestMapping(value = {"/out/edit.*"}, method = RequestMethod.POST)
	public String OutEdit(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Member member = getSessionMemberInfo(request);


		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/loan/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			service.alertMessageAndUrl("통합회원만 상호대차 신청이 가능합니다.\\n로그인 후 이용하시기 바랍니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		} else if ( isLogin(request) && !member.getUnAgreeFlag().equals("0001")) {
			service.alertMessage("통합회원만 이용 하실 수 있습니다.", request, response);
			return null;
		} else if (librarySearch.getvLoca().equals(member.getLoca())) {
			service.alertMessage("소속도서관은 상대호차를 이용 할 수 없습니다.", request, response);
			return null;
		}

		Map<String, Object> sameBookList = LibSearchAPI.getSameBookList(member.getUser_id(), librarySearch.getIsbn(), member.getLoca());
		if (!sameBookList.isEmpty()) {
			System.out.println("SANGHO : these book is in ur library.");
			System.out.println("SANGHO : ISBN : " + librarySearch.getIsbn());
			System.out.println("SANGHO : LOCA : " + member.getLoca());
			service.alertMessage("소속도서관("+member.getLoca_name()+")에 동일 자료가 존재합니다. 소속 도서관을 이용하시기 바랍니다.", request, response);
			return null;
		}

		model.addAttribute("librarySearch", librarySearch);
		model.addAttribute("member", member);

		return String.format(basePath, homepage.getFolder()) + "out/edit";
	}

	@RequestMapping(value = {"/out/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse out(Model model, LibrarySearch librarySearch, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Member member = getSessionMemberInfo(request);

		librarySearch.setvRecptLoca(member.getLoca());

		if(!result.hasErrors()) {

			Homepage homepage_code = new Homepage();

			homepage_code.setHomepage_code(librarySearch.getvItemLoca());

			Homepage homepage2 = homepageService.getHomepageOneByCode(homepage_code);

			SmsReception smsReception = new SmsReception();
			smsReception.setHomepage_id(homepage2.getHomepage_id());
			smsReception.setWork_code("0002");	// 보존서고:0001, 상호대차:0002
			List<SmsReception> receptionsList =  smsReceptionService.getSmsReceptionMembers(smsReception);

			if (librarySearch.getEditMode().equals("ADD")) {
				ApiResponse addOut = LibSearchAPI.reqOutReg("WEB", librarySearch, member.getUser_id());

				if (addOut.getStatus()) {
					res.setValid(true);
					res.setUrl("/"+homepage.getContext_path()+"/intro/search/detail.do?vLoca="+librarySearch.getvItemLoca()+"&vCtrl="+librarySearch.getvCtrl()+"&vImg="+librarySearch.getvImg()+"&isbn="+librarySearch.getIsbn()+"&tid="+librarySearch.getTid()+"&menu_idx="+librarySearch.getMenu_idx());
					res.setMessage("상호대차 신청이 완료되었습니다.\r신청 내역은 MyLibrary에서 확인 가능합니다.");

					// 신청자에게 SMS 전송
					//2019.02.26 이용자에게 신청 문자 삭제(일루스에서 전송)
//					String userMessage = "상호대차 신청이 완료되었습니다. ["+librarySearch.getTitle()+"]";
//					if (isSmsReceive("WEBID", getSessionMemberId(request))) {
//						pushAPI.sendMessage(homepage2, PushAPI.SMS_TYPE_SMS, member.getMobile_no(), userMessage, homepage2.getHomepage_send_tell(), true);
//					}
					// 관리자에게 SMS 전송
					String adminMessage = "상호대차 신청건이 발생하였습니다. 수령:"+member.getLoca_name()+" 도서명:"+librarySearch.getTitle();
					for(SmsReception one : receptionsList) {
						pushAPI.sendMessage(homepage2, PushAPI.SMS_TYPE_SMS, one.getReception_phone(), adminMessage, homepage2.getHomepage_send_tell(), true);
					}
				} else {
					res.setValid(false);
					res.setMessage(addOut.getMessage());
				}
			} else if (librarySearch.getEditMode().equals("CANCEL")) {
				ApiResponse cancelOut = LibSearchAPI.modOutReg("WEB", librarySearch, getSessionUserId(request));
				if (cancelOut.getStatus()) {
					res.setValid(true);
					res.setMessage("상호대차가 취소되었습니다.");

					//신청자에게 SMS 전송
					String userMessage = "상호대차 신청취소 완료되었습니다. ["+librarySearch.getTitle()+"]";
					if (isSmsReceive("WEBID", getSessionMemberId(request))) {
						pushAPI.sendMessage(homepage2, PushAPI.SMS_TYPE_SMS, member.getMobile_no(), userMessage, homepage2.getHomepage_send_tell(), true);
					}
					// 관리자에게 SMS 전송
					String adminMessage = "상호대차 취소건이 발생하였습니다. 수령:"+member.getLoca_name()+" 도서명:"+librarySearch.getTitle();
					for(SmsReception one : receptionsList) {
						pushAPI.sendMessage(homepage2, PushAPI.SMS_TYPE_SMS, one.getReception_phone(), adminMessage, homepage2.getHomepage_send_tell(), true);
					}
				} else {
					res.setValid(false);
					res.setMessage(cancelOut.getMessage());
				}
			}

		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/print.*"}, method=RequestMethod.POST)
	public String print(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( librarySearch.getPrint_param() != null ) {
			List<Object> resultList = new ArrayList<Object>();
			List<String> paramList 		= librarySearch.getPrint_param();
			if ( librarySearch.getPrint_cmd_page().equals("INDEX") ) {
				for ( String oneInfo : paramList ) {
					String[] keys = oneInfo.split("_"); /// 0 - vLoca, 1 - vCtrl
					if ( keys.length > 1 ) {
						Map<String, Object> result = LibSearchAPI.getBookDetail(new LibrarySearch(keys[0], keys[1]));
						resultList.add(result);
					}
				}

			}
			else if ( librarySearch.getPrint_cmd_page().equals("DETAIL") ) {
				for ( String oneInfo : paramList ) {
					String[] key = oneInfo.split("_"); //${i.TITLE}|${i.CALL_NO}|${i.ACSSON_NO}|${i.AUTHOR}|${i.SUB_LOCA_NAME}
					Map<String, Object> dsItemDetail = new HashMap<String, Object>();
					List<Object> dsItemList = new ArrayList<Object>();
					Map<String, Object> result = new HashMap<String, Object>();
					result.put("TITLE", key[0]);
					if ( key.length > 1 ) {
						result.put("CALL_NO", key[1]);
					}
					if ( key.length > 2 ) {
						result.put("ACSSON_NO", key[2]);
					}
					if ( key.length > 3 ) {
						result.put("AUTHOR", key[3]);
					}
					if ( key.length > 4 ) {
						result.put("SUB_LOCA_NAME", key[4]);
					}
					if ( key.length > 5 ) {
						result.put("PUBLISHER", key[5]);
					}
					/*if ( key.length > 6 ) {
						result.put("BOOK_STATUS_NAME", key[6]);
					}*/
					dsItemList.add(result);
					dsItemDetail.put("dsItemDetail", dsItemList);
					resultList.add(dsItemDetail);
				}

			}
			model.addAttribute("resultList", resultList);
		}


		return String.format(basePath, homepage.getFolder()) + "print_ajax";
	}

	@RequestMapping(value = { "/excelDownload.*" }, method = RequestMethod.GET)
	public LibrarySearchView excel(Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {


		if (StringUtils.equals(librarySearch.getExcel_type(), "POUCH")) {
			model.addAttribute("result", LibSearchAPI.getPouchList("WEB", getSessionUserId(request), "req", librarySearch.getvLoca(), ""));
			model.addAttribute("librarySearch", librarySearch);
		} else if (StringUtils.equals(librarySearch.getExcel_type(), "HOPE")) {

			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("vSrchDateS", librarySearch.getSearch_start_date().replaceAll("-", ""));
			paramMap.put("vSrchDateE", librarySearch.getSearch_end_date().replaceAll("-", ""));
			paramMap.put("vSrchDateKey", "INSERT_DATE");
			paramMap.put("vSortKey", "INSERT_DATE");
			paramMap.put("vSortDir", "DESC");


			model.addAttribute("result", LibSearchAPI.getMyLibrarySearchList("WEB", getSessionUserId(request), "HOPE", null, paramMap));
			model.addAttribute("librarySearch", librarySearch);
		} else if (StringUtils.equals(librarySearch.getExcel_type(), "NEWBOOK")) {

			// 소장처 코드
			Homepage homepage = (Homepage) request.getAttribute("homepage");
			if (StringUtils.isEmpty(librarySearch.getvLoca())) {
				librarySearch.setvLoca(homepage.getHomepage_code());
			}

			Map<String, Object> newBookResult = LibSearchAPI.getNewBookList(librarySearch, null);
			@SuppressWarnings ("unchecked")
			List<Map<String, String>> newBookCnt = (List<Map<String, String>>) newBookResult.get("dsNewBookListCnt");
			int totalCnt = Integer.parseInt(String.valueOf(newBookCnt.get(0).get("CNT")));
			librarySearch.setEndRowNum(totalCnt);
			newBookResult = LibSearchAPI.getNewBookList(librarySearch, null);
			@SuppressWarnings ("unchecked")
			List<Map<String, String>> newBookListTmp = (List<Map<String, String>>) newBookResult.get("dsNewBookList");
			List<Map<String, Object>> newBookList = new ArrayList<Map<String, Object>>();
			for ( Map<String, String> map : newBookListTmp ) {
				LibrarySearch tmp = new LibrarySearch();
				tmp.setvLoca(map.get("LOCA"));
				tmp.setvCtrl(map.get("CTRLNO"));
				Map<String, Object> detailResult = LibSearchAPI.getBookDetail(tmp);
				@SuppressWarnings ("unchecked")
				List<Map<String, Object>> detailList = (List<Map<String, Object>>) detailResult.get("dsItemDetail");
				for ( Map<String, Object> map2 : detailList ) {
					newBookList.add(map2);
				}
			}
			Map<String, Object> newBook = new HashMap<String, Object>();
			newBook.put("newBook", newBookList);

			model.addAttribute("result", newBook);
			model.addAttribute("librarySearch", librarySearch);

		} else if (StringUtils.equals(librarySearch.getExcel_type(), "OUT")) {
			Map<String, String> paramMap = new HashMap<String, String>();

			paramMap.put("vSrchDateS", librarySearch.getSearch_start_date().replaceAll("-", ""));
			paramMap.put("vSrchDateE", librarySearch.getSearch_end_date().replaceAll("-", ""));
		//	paramMap.put("vSrchDateKey", "STATUS_CHANGE_DATE");
			paramMap.put("vSortKey", "STATUS_CHANGE_DATE");
			paramMap.put("vSortDir", "DESC");

			model.addAttribute("result", LibSearchAPI.getMyLibrarySearchList("WEB", getSessionUserId(request), "OUT", null, paramMap));
			model.addAttribute("librarySearch", librarySearch);
		} else if (StringUtils.equals(librarySearch.getExcel_type(), "CLOSE")) {
			model.addAttribute("result", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "CLOSE", null));
			model.addAttribute("librarySearch", librarySearch);
		} else if (StringUtils.equals(librarySearch.getExcel_type(), "DRIVETHRU")) {
            model.addAttribute("result", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "POUCH", null));
            model.addAttribute("librarySearch", librarySearch);
        } else if (StringUtils.equals(librarySearch.getExcel_type(), "LOAN")) {
			model.addAttribute("result", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "LOAN", librarySearch.getExcel_type_detail(), getSessionMemberInfo(request).getvFamYn()));
			model.addAttribute("librarySearch", librarySearch);
		} else {
			model.addAttribute("result", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), librarySearch.getExcel_type(), librarySearch.getExcel_type_detail()));
			model.addAttribute("librarySearch", librarySearch);

		}

		return new LibrarySearchView();
	}

	@RequestMapping(value = { "/csvDownload.*" }, method = RequestMethod.GET)
	public void csv(Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = null;

		if (StringUtils.equals(librarySearch.getExcel_type(), "POUCH")) {
			result = LibSearchAPI.getPouchList("WEB", getSessionUserId(request), "req", librarySearch.getvLoca(), "");
		} else if (StringUtils.equals(librarySearch.getExcel_type(), "HOPE")) {

			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("vSrchDateS", librarySearch.getSearch_start_date().replaceAll("-", ""));
			paramMap.put("vSrchDateE", librarySearch.getSearch_end_date().replaceAll("-", ""));
			paramMap.put("vSrchDateKey", "INSERT_DATE");
			paramMap.put("vSortKey", "INSERT_DATE");
			paramMap.put("vSortDir", "DESC");

			result = LibSearchAPI.getMyLibrarySearchList("WEB", getSessionUserId(request), "HOPE", null, paramMap);
		} else if (StringUtils.equals(librarySearch.getExcel_type(), "NEWBOOK")) {

			// 소장처 코드
			Homepage homepage = (Homepage) request.getAttribute("homepage");
			if (StringUtils.isEmpty(librarySearch.getvLoca())) {
				librarySearch.setvLoca(homepage.getHomepage_code());
			}

			Map<String, Object> newBookResult = LibSearchAPI.getNewBookList(librarySearch, null);
			@SuppressWarnings ("unchecked")
			List<Map<String, String>> newBookCnt = (List<Map<String, String>>) newBookResult.get("dsNewBookListCnt");
			int totalCnt = Integer.parseInt(String.valueOf(newBookCnt.get(0).get("CNT")));
			librarySearch.setEndRowNum(totalCnt);
			newBookResult = LibSearchAPI.getNewBookList(librarySearch, null);
			@SuppressWarnings ("unchecked")
			List<Map<String, String>> newBookListTmp = (List<Map<String, String>>) newBookResult.get("dsNewBookList");
			List<Map<String, Object>> newBookList = new ArrayList<Map<String, Object>>();
			for ( Map<String, String> map : newBookListTmp ) {
				LibrarySearch tmp = new LibrarySearch();
				tmp.setvLoca(map.get("LOCA"));
				tmp.setvCtrl(map.get("CTRLNO"));
				Map<String, Object> detailResult = LibSearchAPI.getBookDetail(tmp);
				@SuppressWarnings ("unchecked")
				List<Map<String, Object>> detailList = (List<Map<String, Object>>) detailResult.get("dsItemDetail");
				for ( Map<String, Object> map2 : detailList ) {
					newBookList.add(map2);
				}
			}
			Map<String, Object> newBook = new HashMap<String, Object>();
			newBook.put("newBook", newBookList);

			result = newBook;

		} else if (StringUtils.equals(librarySearch.getExcel_type(), "CLOSE")) {

			result = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "CLOSE", null);
		} else if (StringUtils.equals(librarySearch.getExcel_type(), "DRIVETHRU")) {
            result = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "POUCH", null);
        } else {
			result = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), librarySearch.getExcel_type(), librarySearch.getExcel_type_detail());
		}

		new LibrarySearchXlsToCsv(librarySearch, result, request, response);
	}

	@RequestMapping(value = { "/excelDownload.*" }, method = RequestMethod.POST)
	public LibrarySearchView excelDownload(Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> result	 				= null;
		result = LibSearchAPI.getSearch(librarySearch, librarySearch.getViewPage()); // API로 Request 보냄
		model.addAttribute("result", result);
		model.addAttribute("librarySearch", librarySearch);

		return new LibrarySearchView();
	}

	@RequestMapping(value = { "/csvDownload.*" }, method = RequestMethod.POST)
	public void csvDownload(Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = null;
		result = LibSearchAPI.getSearch(librarySearch, librarySearch.getViewPage()); // API로 Request 보냄

		new LibrarySearchXlsToCsv(librarySearch, result, request, response);
	}
	
	@RequestMapping(value = {"/marcView.*"})
	public String marc_view(Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		Map<String, Object> marcView = LibSearchAPI.getMarcView("WEB", "MARC XML", librarySearch);
		@SuppressWarnings ("unchecked")
		List<Map<String, String>> marcList = (List<Map<String, String>>) marcView.get("dsMarcView");
		model.addAttribute("marcList", marcList);

		return String.format(basePath, homepage.getFolder()) + "marcView_ajax";
	}
	
	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/getBookDetail.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse getBookDetail(LibrarySearch librarySearch, BindingResult result, HttpServletRequest request) throws Exception {
		JsonResponse res = new JsonResponse(request);
		
		Map<String, Object> detailResult = LibSearchAPI.getBookDetail(librarySearch);
		List<Map<String, String>> detailResultList = (List<Map<String, String>>) detailResult.get("dsItemDetail");
		res.setData(detailResultList.get(0).get("SUB_LOCA_NAME"));
		res.setValid(true);
		return res;
	}
	
	

	//비대면
	@RequestMapping(value = {"/untactBook/save.*"}, method=RequestMethod.POST)
	public @ResponseBody JsonResponse saveUntactBook(Model model, LibrarySearch librarySearch,  UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		
		Member member = getSessionMemberInfo(request);

		untactBookReservation.setHomepage_id(homepage.getHomepage_id());
		untactBookReservation.setMember_id(member.getMember_id());
		
		untactBookBlackList.setHomepage_id(homepage.getHomepage_id());
		untactBookBlackList.setMember_id(member.getMember_id());
		
		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/resve/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			result.reject("로그인 후 이용가능합니다.");
			res.setUrl(String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()));
			res.setValid(false);
			res.setMessage("로그인 후 이용가능합니다.");
			return res;
		}
		
		//사물함 사용 여부 확인
		if(!(untactLockerSettingService.getLockerUseType(homepage.getHomepage_id()).equals("사물함없음"))) {
			if(untactLockerSettingService.getLockerUseYN(homepage.getHomepage_id()).equals("N")) {
				res.setValid(false);
				res.setMessage("금일 비대면 도서대출예약은 마감되었습니다.");
				return res;
			}
		}
		
		//비대면 도서대출 예약 가능한 사물함 count
		if (untactLockerSettingService.getUntactLockerSettingCount(homepage.getHomepage_id()) == 0) {
			res.setValid(false);
			res.setMessage("금일 비대면 도서대출예약은 마감되었습니다.");
			return res;
		}

		
		//비대면 도서대출 설정유무 확인
		if (untactLockerSettingService.getLockerMaxCount(homepage.getHomepage_id()) == 0) {
			res.setValid(false);
			res.setMessage("비대면 도서대출예약이 불가능한 도서관입니다.");
			return res;
		}
		
		//비대면 도서대출 예약 가능한 사물함 count
		if (untactLockerSettingService.getUntactLockerSettingCount(homepage.getHomepage_id()) == 0) {
			res.setValid(false);
			res.setMessage("금일 비대면 도서대출예약은 마감되었습니다.");
			return res;
		}
		
		String penaltyEndDate = untactBookPenaltySettingService.getEndDate(homepage.getHomepage_id());
		
		//페널티 초과 회원 예약 불가
		if(untactBookBlackListService.getPenaltyCount(untactBookBlackList) > 0 && untactBookPenaltySettingService.getPenaltyCount(homepage.getHomepage_id()) > 0) {
			if (untactBookBlackListService.getPenaltyCount(untactBookBlackList) >= untactBookPenaltySettingService.getPenaltyCount(homepage.getHomepage_id())) {
				res.setValid(false);
				res.setMessage("현재 이용자님 께서는 관리자에 의해\n\n" + penaltyEndDate + "일 까지 비대면 도서대출 이용이 제한되어 있습니다.");
				return res;
			}
		}
		
		String loanTime = untactLockerSettingService.getLoanTime(homepage.getHomepage_id());
		
		//비대면 도서대출 시간 확인
		if (untactLockerSettingService.reservationTimeCount(homepage.getHomepage_id()) > 0) {
			res.setValid(false); res.setMessage("현재 비대면 도서대출 가능시간이 아닙니다.\n\n" + loanTime + " 사이에만 비대면 도서대출이 가능합니다."); 
			return res;
		}
		
		//비대면 도서대출 예약가능 사물함갯수와 예약횟수 비교
		if (untactLockerSettingService.getUntactLockerSettingCount(homepage.getHomepage_id()) <= untactBookReservationService.getUntactBookReservationCount(homepage.getHomepage_id())) {
			res.setValid(false);
			res.setMessage("금일 비대면 도서대출예약은 마감되었습니다.");
			return res;
		}
		
		int reservationCount = untactBookReservationService.reservationCount(untactBookReservation);
		int reservarionMaxCount = untactLockerSettingService.reservationMaxCount(homepage.getHomepage_id());
		
		//비대면 도서대출 최대 권수 비교
		if (reservationCount >= reservarionMaxCount) {
			res.setValid(false);
			res.setMessage("비대면 도서 대출은 하루에 "+reservarionMaxCount+"권 까지만 가능합니다.\n\n비대면 도서대출 현황은 나의도서관 > 비대면 도서대출 현황에서 확인가능합니다.");
			return res;
		}
		
		if(!result.hasErrors()) {
			
			if ( !StringUtils.isEmpty(member.getStatus_code()) ) {
				if (!(member.getStatus_code().equals("0001") || member.getStatus_code().equals("0") )) {
					res.setValid(false);
					res.setMessage("대출 신청 가능한 회원이 아닙니다.");
					return res;
				}
			}

			librarySearch.setvAccNo(untactBookReservation.getvAccNo());
			librarySearch.setvLoca(untactBookReservation.getvLoca());
			ApiResponse apiResult = LibSearchAPI.reqResve2("WEB", librarySearch, getSessionUserId(request));
			
			if (apiResult.getStatus()) {
				String message = "예약되었습니다.";
				
				Map<String, String> reqList = apiResult.getList();
				
				try {
					if(!(reqList.get("SEQ_NO").isEmpty() || reqList.equals(null))) {
						untactBookReservation.setSeqNo(reqList.get("SEQ_NO"));
						
						untactBookReservation.setHomepage_id(homepage.getHomepage_id());
						untactBookReservation.setMember_id(member.getMember_id());
						untactBookReservation.setMember_name(member.getMember_name());
						untactBookReservation.setReg_no(librarySearch.getvResveNo());
						untactBookReservation.setvUserId(member.getUser_id());
						
						int locker_number = untactBookReservationService.getUntactBookReservationLockerNumber(homepage.getHomepage_id());
						untactBookReservation.setLocker_number(locker_number);
						
						int reserve = untactBookReservationService.addUntactBookReservation(untactBookReservation);
						
						if(!(reserve > 0)) {
							res.setValid(false);
							res.setResult(result.getAllErrors());
						} else {
							res.setValid(true);
							res.setMessage(message);
						}
					} else {
						res.setValid(false);
						res.setMessage(apiResult.getMessage());
					}
				} catch (Exception e) {
					res.setValid(false);
					res.setMessage(apiResult.getMessage());
					System.out.println("파우치대출 예약 에러" + e);
				}
			} else {
				res.setValid(false);
				res.setMessage(apiResult.getMessage());
			}
		} 
			return res;
		}
				
	@RequestMapping(value = {"/untactBook/index.*"})
	public String myUntactBook(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, UntactBookReservation untactBookReservation, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request)) ) {
			try {
				librarySearch.setBefore_url(URLEncoder.encode(request.getHeader("referer"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				librarySearch.setBefore_url(String.format("http://www.gbelib.kr/%s/intro/search/resve/index.do?menu_idx=%s", homepage.getContext_path(), librarySearch.getMenu_idx()));
			}
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), librarySearch.getMenu_idx(), librarySearch.getBefore_url()), request, response);
			return null;
		}

		Member member = getSessionMemberInfo(request);
		
		untactBookReservation.setHomepage_id(homepage.getHomepage_id());
		untactBookReservation.setMember_id(member.getMember_id());
		
		int count = untactBookReservationService.getUntactBookReservationInfoCount(untactBookReservation);
		untactBookReservationService.setPaging(model, count, untactBookReservation);
		untactBookReservation.setTotalDataCount(count);
		
		model.addAttribute("untactBookReservation", untactBookReservation);
		model.addAttribute("untactBookReservationListCount", count);
		model.addAttribute("untactBookReservationList", untactBookReservationService.getUntactBookReservationInfo(untactBookReservation));
		
		if(StringUtils.isNotEmpty(untactLockerSettingService.getLockerUseType(homepage.getHomepage_id()))) {
			if(untactLockerSettingService.getLockerUseType(homepage.getHomepage_id()).equals("QR코드")) {
				return String.format(basePath, homepage.getFolder()) + "untactBook/qrIndex";
			} else if (untactLockerSettingService.getLockerUseType(homepage.getHomepage_id()).equals("비밀번호")) {
				return String.format(basePath, homepage.getFolder()) + "untactBook/passwordIndex";
			}
		}
		
		return String.format(basePath, homepage.getFolder()) + "untactBook/index";
	}

	@RequestMapping(value = {"/dbpia/index.*"})
	public String dbpia(@PathVariable("homepagePath") String homepagePath, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		return String.format(basePath, homepage.getFolder()) + "dbpia/index";
	}
		
	/**
	 * 비대면 도서대출 비밀번호 QR코드
	 * @author whalesoft SUNGHWAN 2021. 10. 18.
	 * @param homepagePath
	 * @param model
	 * @param librarySearch
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/untactBook/untactBookQrCode.*" })
	public String qrCode(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, UntactBookReservation untactBookReservation, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		return String.format(basePath, homepage.getFolder()) + "untactBook/untactBookQrCode_ajax";
	}
	
	/**
	 * 비대면 도서대출 취소
	 * @author whalesoft SUNGHWAN 2021. 10. 13.
	 * @param homepagePath
	 * @param model
	 * @param librarySearch
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping (value = {"/untactBook/cancelReserve.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse cancelReserve(UntactBookReservation untactBookReservation,LibrarySearch librarySearch, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		
		untactBookReservation.setHomepage_id(homepage.getHomepage_id());
		
		JsonResponse res = new JsonResponse(request);
		
		untactBookReservation = untactBookReservationService.getUntactBookReservationOne(untactBookReservation);
		
		try {
			if(!(untactBookReservation.getSeqNo().isEmpty() || untactBookReservation.getSeqNo().equals(null))) {
				if (!result.hasErrors()) {
					librarySearch.setvSeqNo(untactBookReservation.getSeqNo());
					ApiResponse apiResult = LibSearchAPI.modResve2("WEB", librarySearch, getSessionUserId(request));
					if(apiResult.getStatus()) {
						untactBookReservation.setCancel_ip(request.getRemoteAddr());
						untactBookReservationService.cancelReserve(untactBookReservation);
						res.setValid(true);
						res.setMessage("취소되었습니다.");
					} else {
						res.setValid(false);
						res.setMessage(apiResult.getMessage());
					}
					
				} else {
					res.setValid(false);
					res.setResult(result.getAllErrors());
				}
			} else {
				res.setValid(false);
				res.setResult(result.getAllErrors());
			}
		} catch (Exception e) {
			res.setValid(false);
			res.setResult(result.getAllErrors());
			System.out.println("파우치대출 취소 에러" + e);
		}
		
		return res;

	}
	
	@RequestMapping(value = {"/nld/index.*"})
	public String nldIndex(@PathVariable("homepagePath") String homepagePath, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		Map<String, Object> result = null;
		
		if(StringUtils.isNotEmpty(librarySearch.getSearch()) || StringUtils.isNotEmpty(librarySearch.getSearch_title()) || StringUtils.isNotEmpty(librarySearch.getSearch_athor()) || StringUtils.isNotEmpty(librarySearch.getSearch_publisher())) {
			result = LibSearchAPI.getNldList(librarySearch);
			
			try {
				result = bookImageService.resultImageMapIsbn(result, librarySearch, "list", "IMAGE_URL");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if ( result.get("totalCount") != null ) {
				int totalCount = Integer.parseInt(result.get("totalCount").toString());
				
				librarySearch.setTotalDataCount(totalCount);
				service.setPaging(model, totalCount, librarySearch);
			} else {
				int totalCount = 0;
				
				librarySearch.setTotalDataCount(totalCount);
				service.setPaging(model, totalCount, librarySearch);
			}
		}
		
		model.addAttribute("bookList", result);
		model.addAttribute("librarySearch", librarySearch);
		
		return String.format(basePath, homepage.getFolder()) + "nld/index";
	}

	@RequestMapping(value = {"/publicPopularBook/index.*"})
	public String publicPopularBook(Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		librarySearch.setHomepage_id(homepage.getHomepage_id());

		if (librarySearch.getStartDt() == null || librarySearch.getEndDt() == null) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			int beforeDays = -7;
			librarySearch.setStartDt(sf.format(DateUtils.addDays(new Date(), beforeDays)));
			librarySearch.setEndDt(sf.format(new Date()));
		}
		if (librarySearch.getGender() == null) {
			librarySearch.setGender("");
		}
		if (librarySearch.getAge() == null) {
			String[] age= {""};
			librarySearch.setAge(age);
		}
		if (librarySearch.getKdc() == null) {
			String[] kdc = {""};
			librarySearch.setKdc(kdc);
		}
		if (librarySearch.getRegion() == null) {
			String[] region = {""};
			librarySearch.setRegion(region);
		}

		Map<String, Object> result = LibSearchAPI.getPopularBookList(librarySearch);
		Map<String, Object> resultMap = null;
		List<Map<String, Object>> list = null;

		if (result != null) {
			resultMap = (Map<String, Object>)result.get("response");
		}
		if (resultMap.get("docs") != null && !resultMap.get("docs").equals("")) {
			resultMap = (Map<String, Object>)resultMap.get("docs");
		}
		if (result != null && !result.isEmpty() && resultMap != null) {
			list = (ArrayList<Map<String, Object>>)resultMap.get("doc");
		}

		if (librarySearch.getLibCode() != null && !librarySearch.getLibCode().equals("")) {
			for(int i = 0; i < list.size(); i++) {
				String libCode = librarySearch.getLibCode();
				String isbn = (String) list.get(i).get("isbn13");
				Map<String, Object> hasBookMap = LibSearchAPI.getHasBookList(libCode, isbn);
				Map<String, Object> hasBookResponse = (Map<String, Object>) hasBookMap.get("response");
				Map<String, Object> hasBookResult = (Map<String, Object>) hasBookResponse.get("result");

				if(hasBookResult != null) {
					String hasBook = (String) hasBookResult.get("hasBook");
					String loanAvailable = (String) hasBookResult.get("loanAvailable");

					list.get(i).put("hasBook", hasBook);
					list.get(i).put("loanAvailable", loanAvailable);
				}
			}
		}

		List<Integer> countList = new ArrayList<Integer>();
		if (list != null) {
			for(int i = 0; i < list.size(); i++) {
				countList.add(i + 1);
			}

		}

		service.setPaging(model, 50, librarySearch);

		int searchMenuIdx = menuService.getMenuIdxByProgramIdx(homepage.getHomepage_id(), 2);
		int hopeReqIdx = menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 8));

		model.addAttribute("searchMenuIdx", searchMenuIdx);
		model.addAttribute("hopeReqIdx", hopeReqIdx);
		model.addAttribute("popularBookList", list);
		model.addAttribute("countList", countList);
		model.addAttribute("librarySearch", librarySearch);

		return String.format(basePath, homepage.getFolder()) + "publicPopularBook/index";
	}

	@RequestMapping(value = {"/publicPopularBook/detail.*"})
	public String detail(Model model, LibrarySearch librarySearch, HttpServletRequest request) {
		Homepage homepage = (Homepage)request.getAttribute("homepage");

		Map<String, Object> result = LibSearchAPI.getPopularBook(librarySearch);
		Map<String, Object> resultMap = null;
		Map<String, Object> detailMap = null;
		Map<String, Object> loanInfoMap = null;
		Map<String, Object> totalMap = null;
		Map<String, Object> regionResultMap = null;
		Map<String, Object> ageResultMap = null;
		Map<String, Object> genderResultMap = null;
		List<Map<String, Object>> ageListMap = null;
		List<Map<String, Object>> regionListMap = null;
		List<Map<String, Object>> genderListMap = null;
		if(result != null) {
			resultMap = (Map<String, Object>)result.get("response");
		}
		if(resultMap != null) {
			loanInfoMap = (Map<String, Object>)resultMap.get("loanInfo");

			if(loanInfoMap != null) {
				if (loanInfoMap.get("Total") instanceof Map<?, ?>) {
					totalMap = (Map<String, Object>)loanInfoMap.get("Total");
				}

				if (loanInfoMap.get("ageResult") instanceof Map<?, ?>) {
					ageResultMap = (Map<String, Object>) loanInfoMap.get("ageResult");
					if(ageResultMap.get("age") instanceof List<?>) {
						ageListMap = (List<Map<String, Object>>) ageResultMap.get("age");
					}
				}

				if (loanInfoMap.get("regionResult") instanceof Map<?, ?>) {
					regionResultMap = (Map<String, Object>) loanInfoMap.get("regionResult");
					if(regionResultMap.get("region") instanceof List<?>) {
						regionListMap = (List<Map<String, Object>>) regionResultMap.get("region");
					}
				}

				if (loanInfoMap.get("genderResult") instanceof Map<?, ?>) {
					genderResultMap = (Map<String, Object>) loanInfoMap.get("genderResult");
					if(genderResultMap.get("gender") instanceof List<?>) {
						genderListMap = (List<Map<String, Object>>) genderResultMap.get("gender");
					}
				}

			}
			detailMap = (Map<String, Object>)resultMap.get("detail");
			if(detailMap != null) {
				detailMap = (Map<String, Object>)detailMap.get("book");
			}
		}
		int searchMenuIdx = menuService.getMenuIdxByProgramIdx(homepage.getHomepage_id(), 2);

		model.addAttribute("searchMenuIdx", searchMenuIdx);
		model.addAttribute("totalMap", totalMap);
		model.addAttribute("ageListMap", ageListMap);
		model.addAttribute("regionListMap", regionListMap);
		model.addAttribute("genderListMap", genderListMap);
		model.addAttribute("detailBook", detailMap);
		model.addAttribute("librarySearch", librarySearch);

		return String.format(basePath, homepage.getFolder()) + "publicPopularBook/detail";
	}
}