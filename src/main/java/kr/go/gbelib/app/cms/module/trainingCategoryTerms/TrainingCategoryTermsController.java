package kr.go.gbelib.app.cms.module.trainingCategoryTerms;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.trainingCategoryTerms.trainingTerms.TrainingTerms;
import kr.go.gbelib.app.cms.module.trainingCategoryTerms.trainingTerms.TrainingTermsService;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
@Controller
@RequestMapping(value = { "/cms/module/trainingCategoryTerms" })
public class TrainingCategoryTermsController extends BaseController {

	private final String basePath = "/cms/module/trainingCategoryTerms/";
	
	@Autowired
	private TrainingCategoryTermsService service;
	
	@Autowired
	private TrainingTermsService trainingTermsService;
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, TrainingCategoryTerms trainingCategoryTerms, HttpServletRequest request) {			
		TrainingCode2 cate = new TrainingCode2();				
		cate.setTraining_code(15);	//대분류 구분 코드
		cate.setHomepage_id(getAsideHomepageId(request));
		trainingCategoryTerms.setHomepage_id(getAsideHomepageId(request));
		List<String> codeList = new ArrayList<String>();
		codeList = service.getCategoryList(cate); //대분류 가져오기
		
		model.addAttribute("codeListCount", codeList.size());
		model.addAttribute("codeList", codeList);
		return basePath + "index";
	}
	
	@RequestMapping(value = {"/edit.*"})
	public String edit(Model model, TrainingCategoryTerms trainingCategoryTerms, HttpServletRequest request) {
		
		model.addAttribute("trainingCategoryTerms", trainingCategoryTerms);
		return basePath + "edit_ajax";
	}
	
	@RequestMapping(value = {"/edit_table.*"})
	public String edit_table(Model model, TrainingCategoryTerms trainingCategoryTerms, HttpServletRequest request) {					
		trainingCategoryTerms.setHomepage_id(getAsideHomepageId(request));		
		List<TrainingCategoryTerms> trainingCategoryTermsList = new ArrayList<TrainingCategoryTerms>();
		TrainingCategoryTerms trainingCategoryTerms2 = new TrainingCategoryTerms();
		trainingCategoryTerms2.setHomepage_id(getAsideHomepageId(request));
		int count = 0;
		
		
		if(trainingCategoryTerms.getIdx_param() != null && !"".equals(trainingCategoryTerms.getIdx_param())) {
			String[] param = trainingCategoryTerms.getIdx_param().split("_");
			
			
			
			
			if(param.length > 0) {
				if(param[0] != null && !"".equals(param[0])) {
					trainingCategoryTerms.setLarge_category_idx(Integer.parseInt(param[0]));
					trainingCategoryTerms2.setLarge_category_idx(Integer.parseInt(param[0]));
				}
			}
			if(param.length > 1) {
				if(param[1] != null && !"".equals(param[1])) {
					trainingCategoryTerms.setGroup_idx(Integer.parseInt(param[1]));
					trainingCategoryTerms2.setGroup_idx(Integer.parseInt(param[1]));
				}
			}
			if(param.length > 2) {
				if(param[1] != null && !"".equals(param[2])) {
					trainingCategoryTerms.setCategory_idx(Integer.parseInt(param[2]));
					trainingCategoryTerms2.setCategory_idx(Integer.parseInt(param[2]));
				}
			}
			
				
		}
		
		//등록된 약관 불러오기
		count = service.getTrainingCategoryTermsCount(trainingCategoryTerms2);
		trainingCategoryTermsList = service.getTrainingCategoryTermsList(trainingCategoryTerms2);
		
		//약관 모두 불러오기
		TrainingTerms trainingTerms = new TrainingTerms();
		List<TrainingTerms> trainingTermsList = new ArrayList<TrainingTerms>();
		trainingTerms.setHomepage_id(getAsideHomepageId(request));
		trainingTermsList = trainingTermsService.getTrainingTermsList(trainingTerms);	
		
		model.addAttribute("trainingCategoryTermsListCount", count);
		model.addAttribute("trainingCategoryTermsList", trainingCategoryTermsList);
		model.addAttribute("trainingTermsList", trainingTermsList);
		model.addAttribute("trainingCategoryTerms", trainingCategoryTerms);
		return basePath + "edit_table_ajax";
	}
	
	@RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Model model, TrainingCategoryTerms trainingCategoryTerms, BindingResult result, HttpServletRequest request) {		
		JsonResponse res = new JsonResponse(request);		
		/*ValidationUtils.rejectIfEmpty(result, "contents", "상세내용을 입력해주세요.");*/
		ValidationUtils.rejectIfEmpty(result, "homepage_id", "홈페이지ID를 불러오는데 실패하였습니다.");	
		ValidationUtils.rejectIfEmpty(result, "large_category_idx", "대분류 코드를 불러오는데 실패하였습니다.");
		ValidationUtils.rejectIfEmpty(result, "group_idx", "중분류 코드를 불러오는데 실패하였습니다.");
				
		if(service.getTrainingCategoryTermsCount(trainingCategoryTerms) > 0) {		
			result.reject("이미 등록된 약관입니다.");
		}
		
 		if(!result.hasErrors()) {
 			trainingCategoryTerms.setAdd_id(getSessionMemberId(request));
			service.addTrainingCategoryTerms(trainingCategoryTerms);
			res.setValid(true);
			res.setMessage("등록 되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
	@RequestMapping(value = {"/delete.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse delete(Model model, TrainingCategoryTerms trainingCategoryTerms, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);		
		/*ValidationUtils.rejectIfEmpty(result, "contents", "상세내용을 입력해주세요.");*/
		ValidationUtils.rejectIfEmpty(result, "homepage_id", "홈페이지ID를 불러오는데 실패하였습니다.");	
		ValidationUtils.rejectIfEmpty(result, "large_category_idx", "대분류 코드를 불러오는데 실패하였습니다.");
		ValidationUtils.rejectIfEmpty(result, "group_idx", "중분류 코드를 불러오는데 실패하였습니다.");
		ValidationUtils.rejectIfEmpty(result, "category_idx", "소분류 코드를 불러오는데 실패하였습니다.");
		ValidationUtils.rejectIfEmpty(result, "terms_idx", "약관IDX를 가져오는데 실패하였습니다.");
		
		if(service.deleteTrainingCategoryTerms(trainingCategoryTerms) > 0 ) {
			res.setValid(true);
			res.setMessage("삭제 되었습니다.");		
		}else {			
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;
	}
}
