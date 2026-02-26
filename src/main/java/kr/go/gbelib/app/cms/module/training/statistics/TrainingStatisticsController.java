package kr.go.gbelib.app.cms.module.training.statistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;

@Controller
@RequestMapping(value = { "/cms/module/training/statistics" })
public class TrainingStatisticsController extends BaseController {

	private final String basePath = "/cms/module/training/statistics/";
	
	@Autowired
	private TrainingCategoryGroupService categoryGroupService;
	
	@Autowired
	private TrainingStatisticsService service;
	
	@Autowired
	private TrainingCode2Service trainingCode2Service;
	
	@RequestMapping(value = { "/index.*" })
	public String index(Model model, TrainingStatistics trainingStatistics, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		if ( !getSessionIsAdmin(request) ) {
			trainingStatistics.setHomepage_id(getAsideHomepageId(request));
		}
		

		
		TrainingCode2 trainingCode2 = new TrainingCode2(1);
		trainingCode2.setTraining_code(15);
		model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));
		
		model.addAttribute("groupList", categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(trainingStatistics.getHomepage_id())));
		model.addAttribute("trainingStatistics", trainingStatistics);
		return basePath + "index";
	}
	
	@RequestMapping(value = { "/statistics.*" })
	public String statistics(Model model, TrainingStatistics trainingStatistics, HttpServletRequest request) {
		
		model.addAttribute("statisticsList", service.getTrainingStatistics(trainingStatistics));
		
		return basePath + "statistics_ajax";
	}
	
	@RequestMapping(value = {"/excelDownload.*"}, method = RequestMethod.POST)
	public TrainingStatisticsSearchView excel(Model model, TrainingStatistics trainingStatistics, HttpServletRequest request, HttpServletResponse response) throws Exception {
		model.addAttribute("trainingStatistics", trainingStatistics); 
		model.addAttribute("statisticsList", service.getTrainingStatistics(trainingStatistics));
		return new TrainingStatisticsSearchView();
	}
	
	@RequestMapping(value = {"/csvDownload.*"}, method = RequestMethod.POST)
	public void csv(TrainingStatistics trainingStatistics, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<TrainingStatistics> statisticsList = service.getTrainingStatistics(trainingStatistics);
		
		new TrainingStatisticsXlsToCsv(trainingStatistics, statisticsList, request, response);
	}
}