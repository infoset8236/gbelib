package kr.go.gbelib.app.cms.module.elib.statistics;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.go.gbelib.app.cms.module.elib.category.ElibCategory;
import kr.go.gbelib.app.cms.module.elib.category.ElibCategoryService;
import kr.go.gbelib.app.cms.module.elib.code.ElibCode;
import kr.go.gbelib.app.cms.module.elib.code.ElibCodeService;

@Controller
@RequestMapping(value = {"/cms/module/elib/statistics"})
public class ElibStatisticsController extends BaseController {

	private final String basePath = "/cms/module/elib/statistics/";

	@Autowired
	private ElibStatisticsService service;
	
	@Autowired
	private ElibCategoryService elibCategoryService;
	
	@Autowired
	private ElibCodeService elibCodeService;
	
	@Autowired
	private HomepageService homepageService;
	
	private void updateDeviceCnt(ElibStatistics elibStatistics) {
		if(elibStatistics != null && elibStatistics.getDevice_cnt() != null) {
			String[] device_cnt_array = elibStatistics.getDevice_cnt().split(",");
			if(device_cnt_array != null) {
				for(String s: device_cnt_array) {
					String[] device_cnt = s.split(":");
					String device = device_cnt[0];
					int cnt = Integer.parseInt(device_cnt[1]);
					
					if("P".equals(device)) {
						elibStatistics.setP_cnt(cnt);
					} else if("S".equals(device)) {
						elibStatistics.setS_cnt(cnt);
					} else if("A".equals(device)) {
						elibStatistics.setA_cnt(cnt);
					} else if("I".equals(device)) {
						elibStatistics.setI_cnt(cnt);
					} else if("E".equals(device)) {
						elibStatistics.setE_cnt(cnt);
					}
				}
			}
		}
	}
	
	@RequestMapping(value = {"{menuParam}/index{url}.*"})
	public String book_index(Model model, @PathVariable String menuParam, @PathVariable("url") String url, ElibStatistics elibStatistics, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
//		if ( !getSessionIsAdmin(request) ) {
			elibStatistics.setHomepage_id(getAsideHomepageId(request));
//		}
		
		elibStatistics.setMenu(menuParam);
		
		String menu = elibStatistics.getMenu();
		String view = basePath + "index";
		List<ElibStatistics> elibStatisticsList = null;
		int count = 0;
		
		if("HOUR".equals(menu) || "DAY".equals(menu) || "MONTH".equals(menu) || "PERIOD".equals(menu)) {
			elibStatisticsList = service.getStatisticsByTime(elibStatistics);
			view = basePath + "time";
		} else if("CATEGORY".equals(menu)) {
			Map<String, Integer> elibStatisticsMap = new HashMap<String, Integer>();
			List<Map<String, Object>> elibStatisticsMapList = new ArrayList<Map<String, Object>>();
			
			ElibCategory cate = new ElibCategory();
			List<ElibCategory> categories = elibCategoryService.getStatCategoryList(cate);

			if(elibStatistics.getSearch_sdt() != null && elibStatistics.getSearch_edt() != null) { 
				elibStatisticsMapList = service.getStatisticsByCategory(elibStatistics);
				if(elibStatisticsMapList != null) {
					for(Map<String, Object> row: elibStatisticsMapList) {
						elibStatisticsMap.put(row.get("TYPE")+"."+row.get("PARENT_ID")+"."+row.get("DEVICE"), Integer.parseInt(String.valueOf(row.get("CNT"))));
					}
				}
			}

			model.addAttribute("categories", categories);
			model.addAttribute("elibStatisticsMap", elibStatisticsMap);
			model.addAttribute("elibStatisticsMapList", elibStatisticsMapList);
			
			if("_excel".equals(url)) {
				view = basePath + "category_excel_ajax";
			} else if("_csv".equals(url)) {
				view = basePath + "csv_ajax";
			} else {
				view = basePath + "category";
			}
		} else if("BOOK".equals(menu)) {
			count = service.getStatisticsByBookCnt(elibStatistics);
			service.setPaging(model, count, elibStatistics);
			elibStatisticsList = service.getStatisticsByBook(elibStatistics);
			
			for(ElibStatistics one: elibStatisticsList) {
				updateDeviceCnt(one);
			}
			
			ElibStatistics total = service.getStatisticsByBookTotal(elibStatistics);
			updateDeviceCnt(total);
			
			model.addAttribute("getStatisticsByBookTotal", total);
			model.addAttribute("elibStatisticsCnt", count);
			view = basePath + "book";
		} else if("MEMBER".equals(menu)) {
			count = service.getStatisticsByMemberCnt(elibStatistics);
			service.setPaging(model, count, elibStatistics);
			elibStatisticsList = service.getStatisticsByMember(elibStatistics);
			model.addAttribute("getStatisticsByMemberTotal", service.getStatisticsByMemberTotal(elibStatistics));
			view = basePath + "member";
			model.addAttribute("elibStatisticsCnt", count);
		} else if("AGE".equals(menu)) {
			elibStatisticsList = service.getStatisticsByAge(elibStatistics);
			view = basePath + "age";
		} else if("AGEANDCATEGORY".equals(menu)) {

			if (elibStatistics.getSearch_sdt() == null && elibStatistics.getSearch_edt() == null) {
				LocalDate now = LocalDate.now();
				LocalDate sdtDate = now.minusMonths(1);

				elibStatistics.setSearch_sdt(sdtDate.toString("YYYY-MM-dd"));
				elibStatistics.setSearch_edt(now.toString("YYYY-MM-dd"));
			}
			if (elibStatistics.getType() == null) {
				elibStatistics.setType("ALL");
			}
			if (elibStatistics.getType().equals("ADO")) {
				elibStatisticsList = service.getStatisticsByAgeAndCategoryAudio(elibStatistics);
			} else if (elibStatistics.getType().equals("EBK")) {
				elibStatisticsList = service.getStatisticsByAgeAndCategory(elibStatistics);
			} else if (elibStatistics.getType().equals("WEB")) {
				elibStatisticsList = service.getStatisticsByAgeAndCategoryElearn(elibStatistics);
			} else {
				// 전체인 경우

				List<ElibStatistics> list1 = service.getStatisticsByAgeAndCategoryAudio(elibStatistics);
				List<ElibStatistics> list2 = service.getStatisticsByAgeAndCategory(elibStatistics);
				List<ElibStatistics> list3 = service.getStatisticsByAgeAndCategoryElearn(elibStatistics);
				Map<String, ElibStatistics> sumMap = new HashMap<String, ElibStatistics>();
				// 1차 리스트 먼저 넣기
				for (ElibStatistics stat : list1) {
					sumMap.put(stat.getAge_group(), stat);
				}
				// 2차 리스트 합산
				for (ElibStatistics stat : list2) {
					String key = stat.getAge_group();

					if (sumMap.containsKey(key)) {
						ElibStatistics base = sumMap.get(key);

						base.setCate_0(base.getCate_0() + stat.getCate_0());
						base.setCate_1(base.getCate_1() + stat.getCate_1());
						base.setCate_2(base.getCate_2() + stat.getCate_2());
						base.setCate_3(base.getCate_3() + stat.getCate_3());
						base.setCate_4(base.getCate_4() + stat.getCate_4());
						base.setCate_5(base.getCate_5() + stat.getCate_5());
						base.setCate_6(base.getCate_6() + stat.getCate_6());
						base.setCate_7(base.getCate_7() + stat.getCate_7());
						base.setCate_8(base.getCate_8() + stat.getCate_8());
						base.setCate_9(base.getCate_9() + stat.getCate_9());
						base.setTotal_reserves_cnt(
								base.getTotal_reserves_cnt() + stat.getTotal_reserves_cnt()
						);

					} else {
						sumMap.put(key, stat);
					}
				}
				// 3차 리스트 합산
				for (ElibStatistics stat : list3) {
					String key = stat.getAge_group();

					if (sumMap.containsKey(key)) {
						ElibStatistics base = sumMap.get(key);

						base.setCate_0(base.getCate_0() + stat.getCate_0());
						base.setCate_1(base.getCate_1() + stat.getCate_1());
						base.setCate_2(base.getCate_2() + stat.getCate_2());
						base.setCate_3(base.getCate_3() + stat.getCate_3());
						base.setCate_4(base.getCate_4() + stat.getCate_4());
						base.setCate_5(base.getCate_5() + stat.getCate_5());
						base.setCate_6(base.getCate_6() + stat.getCate_6());
						base.setCate_7(base.getCate_7() + stat.getCate_7());
						base.setCate_8(base.getCate_8() + stat.getCate_8());
						base.setCate_9(base.getCate_9() + stat.getCate_9());
						base.setTotal_reserves_cnt(
								base.getTotal_reserves_cnt() + stat.getTotal_reserves_cnt()
						);

					} else {
						sumMap.put(key, stat);
					}
				}

				// 정렬된 결과 생성
				elibStatisticsList = new ArrayList<ElibStatistics>();

				String[] order = {"어린이", "청소년", "성인"};

				for (int i = 0; i < order.length; i++) {
					if (sumMap.containsKey(order[i])) {
						elibStatisticsList.add(sumMap.get(order[i]));
					} else {
						ElibStatistics empty = new ElibStatistics();
						empty.setAge_group(order[i]);
						elibStatisticsList.add(empty);
					}
				}
			}
			if("_excel".equals(url)) {
				view = basePath + "ageAndCategory_excel_ajax";
			} else {
				view = basePath + "ageAndCategory";
			}
		} else if("COMPANY".equals(menu)) {
			Map<String, Integer> elibStatisticsMap = new HashMap<String, Integer>();
			
			List<Map<String, Object>> elibStatisticsMapList = service.getStatisticsByCompany(elibStatistics);
			if(elibStatisticsMapList != null) {
				for(Map<String, Object> row: elibStatisticsMapList) {
					elibStatisticsMap.put(row.get("TYPE")+"."+row.get("COM_CODE")+"."+row.get("DEVICE"), Integer.parseInt(String.valueOf(row.get("CNT"))));
				}
			}
			
			if("_excel".equals(url)) {
				view = basePath + "company_excel_ajax";
			} else if("_csv".equals(url)) {
				view = basePath + "csv_ajax";
			} else {
				view = basePath + "company";
			}
			
			model.addAttribute("elibStatisticsMap", elibStatisticsMap);
		} else if("PERSONALCATEGORY".equals(menu)) {
			Map<String, Integer> elibStatisticsMap = new HashMap<String, Integer>();
			List<Map<String, Object>> elibStatisticsMapList = new ArrayList<Map<String, Object>>();
			
			ElibCategory cate = new ElibCategory();
			List<ElibCategory> categories = elibCategoryService.getStatCategoryList(cate);

			if(elibStatistics.getSearch_sdt() != null && elibStatistics.getSearch_edt() != null) { 
				elibStatisticsMapList = service.getStatisticsByCategoryPersonal(elibStatistics);
				if(elibStatisticsMapList != null) {
					for(Map<String, Object> row: elibStatisticsMapList) {
						elibStatisticsMap.put(row.get("TYPE")+"."+row.get("PARENT_ID")+"."+row.get("DEVICE"), Integer.parseInt(String.valueOf(row.get("CNT"))));
					}
				}
			}

			model.addAttribute("categories", categories);
			model.addAttribute("elibStatisticsMap", elibStatisticsMap);
			model.addAttribute("elibStatisticsMapList", elibStatisticsMapList);
			
			if("_excel".equals(url)) {
				view = basePath + "personalCategory_excel_ajax";
			} else if("_csv".equals(url)) {
				view = basePath + "csv_ajax";
			} else {
				view = basePath + "personalCategory";
			}
		} else if("PERSONALCOMPANY".equals(menu)) {
			Map<String, Integer> elibStatisticsMap = new HashMap<String, Integer>();
			Map<String, Integer> elibStatisticsMainMap = new HashMap<String, Integer>();
			
			List<Map<String, Object>> elibStatisticsMapList = service.getStatisticsByPersonalCompany(elibStatistics);
			List<Map<String, Object>> elibStatisticsMapMainList = service.getStatisticsByPersonalCompanyMain(elibStatistics);
			if(elibStatisticsMapList != null) {
				for(Map<String, Object> row: elibStatisticsMapList) {
					elibStatisticsMap.put(row.get("TYPE")+"."+row.get("COM_CODE")+"."+row.get("DEVICE"), Integer.parseInt(String.valueOf(row.get("CNT"))));
				}
			}
			if(elibStatisticsMapMainList != null) {
				for(Map<String, Object> row: elibStatisticsMapMainList) {
					elibStatisticsMainMap.put(row.get("TYPE")+"."+row.get("COM_CODE")+"."+row.get("DEVICE"), Integer.parseInt(String.valueOf(row.get("CNT"))));
				}
			}
			
			if("_excel".equals(url)) {
				view = basePath + "personalCompany_excel_ajax";
			} else if("_csv".equals(url)) {
				view = basePath + "csv_ajax";
			} else {
				view = basePath + "personalCompany";
			}
			
			model.addAttribute("elibStatisticsMainMap", elibStatisticsMainMap);
			model.addAttribute("elibStatisticsMap", elibStatisticsMap);
		}
		
		model.addAttribute("elibStatistics", elibStatistics);
		model.addAttribute("obj", elibStatistics);
		model.addAttribute("elibStatisticsList", elibStatisticsList);
		model.addAttribute("cateList", elibCategoryService.getCategoryList(new ElibCategory(elibStatistics.getType())));
		model.addAttribute("compList", elibCodeService.getCompList(new ElibCode(elibStatistics.getType())));
		model.addAttribute("library_code", getLibraryCode(request));
		
		return view;
	}
	
	@RequestMapping(value = {"/summary{url}.*"})
	public String summary(Model model, ElibStatistics elibStatistics, @PathVariable("url") String url, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		
		elibStatistics.setHomepage_id(getAsideHomepageId(request));
		
		Map<String, Integer> elibStatisticsSummary = new HashMap<String, Integer>();
		Map<String, Integer> elibStatisticsUniqueSummary = new HashMap<String, Integer>();
		
		if(StringUtils.isNotEmpty(elibStatistics.getSearch_sdt()) || StringUtils.isNotEmpty(elibStatistics.getSearch_edt())) {
			List<ElibStatistics> elibStatisticsSummaryList = service.getStatisticsSummaryList(elibStatistics);
			List<ElibStatistics> elibStatisticsUniqueSummaryList = service.getStatisticsUniqueSummaryList(elibStatistics);
			
			for(ElibStatistics elem: elibStatisticsSummaryList) {
				elibStatisticsSummary.put(elem.getType() + "." + elem.getAge_group() + "." + elem.getSex(), elem.getLend_cnt());
			}
			
			for(ElibStatistics elem: elibStatisticsUniqueSummaryList) {
				elibStatisticsUniqueSummary.put(elem.getType() + "." + elem.getAge_group() + "." + elem.getSex(), elem.getLend_cnt());
			}
			
		}
		
		model.addAttribute("elibStatistics", elibStatistics);
		model.addAttribute("obj", elibStatistics);
		model.addAttribute("elibStatisticsSummary", elibStatisticsSummary);
		model.addAttribute("elibStatisticsUniqueSummary", elibStatisticsUniqueSummary);
		model.addAttribute("cateList", elibCategoryService.getCategoryList(new ElibCategory(elibStatistics.getType())));
		model.addAttribute("compList", elibCodeService.getCompList(new ElibCode(elibStatistics.getType())));
		model.addAttribute("library_code", getLibraryCode(request));
		
		if("_excel".equals(url)) {
			return basePath + "summary_excel_ajax";
		} else if("_csv".equals(url)) {
			return basePath + "csv_ajax";
		} else {
			return basePath + "summary";
		}
	}

	@RequestMapping(value = {"/personalSummary{url}.*"})
	public String personalSummary(Model model, ElibStatistics elibStatistics, @PathVariable("url") String url, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		
		elibStatistics.setHomepage_id(getAsideHomepageId(request));
		
		Map<String, Integer> elibStatisticsSummary = new HashMap<String, Integer>();
		Map<String, Integer> elibStatisticsPersonalSummary = new HashMap<String, Integer>();
		
		if(StringUtils.isNotEmpty(elibStatistics.getSearch_sdt()) || StringUtils.isNotEmpty(elibStatistics.getSearch_edt())) {
			List<ElibStatistics> elibStatisticsSummaryList = service.getStatisticsPersonalSummaryList(elibStatistics);
			List<ElibStatistics> elibStatisticsPersonalSummaryList = service.getStatisticsUniquePersonalSummaryList(elibStatistics);
			
			for(ElibStatistics elem: elibStatisticsSummaryList) {
				elibStatisticsSummary.put(elem.getType() + "." + elem.getAge_group() + "." + elem.getSex(), elem.getLend_cnt());
			}
			
			for(ElibStatistics elem: elibStatisticsPersonalSummaryList) {
				elibStatisticsPersonalSummary.put(elem.getType() + "." + elem.getAge_group() + "." + elem.getSex(), elem.getLend_cnt());
			}
			
		}
		
		model.addAttribute("elibStatistics", elibStatistics);
		model.addAttribute("obj", elibStatistics);
		model.addAttribute("elibStatisticsSummary", elibStatisticsSummary);
		model.addAttribute("elibStatisticsPersonalSummary", elibStatisticsPersonalSummary);
		model.addAttribute("cateList", elibCategoryService.getCategoryList(new ElibCategory(elibStatistics.getType())));
		model.addAttribute("compList", elibCodeService.getCompList(new ElibCode(elibStatistics.getType())));
		model.addAttribute("library_code", getLibraryCode(request));
		
		if("_excel".equals(url)) {
			return basePath + "personalSummary_excel_ajax";
		} else if("_csv".equals(url)) {
			return basePath + "personalSummaryCsv_ajax";
		} else {
			return basePath + "personalSummary";
		}
	}
	
	@RequestMapping(value = {"{menuParam}/excelDownload.*"}, method = RequestMethod.POST)
	public AbstractJExcelView excel(Model model, ElibStatistics elibStatistics, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String menu = elibStatistics.getMenu();
		List<ElibStatistics> elibStatisticsList = null;
		AbstractJExcelView view = null;
		
		if("HOUR".equals(menu) || "DAY".equals(menu) || "MONTH".equals(menu) || "PERIOD".equals(menu)) {
			elibStatisticsList = service.getStatisticsByTime(elibStatistics);
			view = new ElibStatisticsTimeExcelView();
		} else if("CATEGORY".equals(menu)) {
//			elibStatisticsList = service.getStatisticsByCategory(elibStatistics);
			view = new ElibStatisticsCategoryExcelView();
		} else if("BOOK".equals(menu)) {
			elibStatisticsList = service.getStatisticsByBookAll(elibStatistics);
			
			for(ElibStatistics one: elibStatisticsList) {
				updateDeviceCnt(one);
			}
			
			view = new ElibStatisticsBookExcelView();
		} else if("MEMBER".equals(menu)) {
			elibStatisticsList = service.getStatisticsByMemberAll(elibStatistics);
			view = new ElibStatisticsMemberExcelView();
		} else if("AGE".equals(menu)) {
			elibStatisticsList = service.getStatisticsByAge(elibStatistics);
			view = new ElibStatisticsAgeExcelView();
		} else if("AGEANDCATEGORY".equals(menu)) {
			elibStatisticsList = service.getStatisticsByAgeAndCategory(elibStatistics);
			view = new ElibStatisticsAgeExcelView();
		}

		model.addAttribute("elibStatistics", elibStatistics);
		model.addAttribute("elibStatisticsList", elibStatisticsList);
		model.addAttribute("libraries", elibCodeService.getLibraryMap());
		model.addAttribute("providers", elibCodeService.getCompMap());
		model.addAttribute("library_code", getLibraryCode(request));
		
		return view;
	}
	
	@RequestMapping(value = {"{menuParam}/csvDownload.*"}, method = RequestMethod.POST)
	public void csv(Model model, ElibStatistics elibStatistics, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String menu = elibStatistics.getMenu();
		List<ElibStatistics> elibStatisticsList = null;
		
		if("HOUR".equals(menu) || "DAY".equals(menu) || "MONTH".equals(menu) || "PERIOD".equals(menu)) {
			elibStatisticsList = service.getStatisticsByTime(elibStatistics);
		} else if("CATEGORY".equals(menu)) {
//			elibStatisticsList = service.getStatisticsByCategory(elibStatistics);
		} else if("BOOK".equals(menu)) {
			elibStatisticsList = service.getStatisticsByBookAll(elibStatistics);
			
			for(ElibStatistics one: elibStatisticsList) {
				updateDeviceCnt(one);
			}
		} else if("MEMBER".equals(menu)) {
			elibStatisticsList = service.getStatisticsByMemberAll(elibStatistics);
		} else if("AGE".equals(menu)) {
			elibStatisticsList = service.getStatisticsByAge(elibStatistics);
		}
		
		Map<String, String> libraries = elibCodeService.getLibraryMap();
		Map<String, String> providers = elibCodeService.getCompMap();
		String library_code = getLibraryCode(request);
		
		new ElibStatisticsXlsToCsv(elibStatistics, elibStatisticsList, libraries, providers, library_code, request, response);
	}
	
	private String getLibraryCode(HttpServletRequest request) {
		String asideHomepageId = getAsideHomepageId(request);
		
		Homepage homepage = new Homepage(asideHomepageId);
		homepage = homepageService.getHomepageOne(homepage);
		
		if(homepage == null) {
			return null;
		} else {
			String homepage_code = StringUtils.defaultString(homepage.getHomepage_code());
			int i = homepage_code.indexOf(",");
			if(i < 0) {
				return homepage_code;
			} else {
				return homepage_code.substring(0, homepage_code.indexOf(","));
			}
		}
	}
	
}
