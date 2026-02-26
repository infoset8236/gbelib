package kr.go.gbelib.app.cms.module.trainingCategoryTerms.trainingTerms;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.terms.Terms;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.cms.module.trainingCategoryTerms.TrainingCategoryTerms;
import kr.go.gbelib.app.cms.module.trainingCategoryTerms.TrainingCategoryTermsService;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
@Controller
@RequestMapping(value = { "/cms/module/trainingTerms" })
public class TrainingTermsController extends BaseController {
	
	private final String basePath = "/cms/module/trainingCategoryTerms/trainingTerms/";

	@Autowired
	private TrainingTermsService service;
	
	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, TrainingTerms trainingTerms, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		trainingTerms.setHomepage_id(getAsideHomepageId(request));
		int count = service.getTrainingTermsListCount(trainingTerms);
		
		service.setPaging(model, count, trainingTerms);
		model.addAttribute("trainingTerms", trainingTerms);
		model.addAttribute("trainingTermsListCount", count);
		model.addAttribute("trainingTermsList", service.getTrainingTermsList(trainingTerms));		
		
		return basePath + "index";
	}
	
	@RequestMapping(value = {"/edit.*"})
	public String edit(Model model, TrainingTerms trainingTerms, HttpServletRequest request) throws AuthException {
		trainingTerms.setHomepage_id(getAsideHomepageId(request));
		
		if(trainingTerms.getEditMode().equals("MODIFY")) {
			checkAuth("U", model, request);
			trainingTerms = (TrainingTerms)service.copyObjectPaging(trainingTerms, service.getTrainingTermsOne(trainingTerms));
		} else {
			checkAuth("C", model, request);
		}
		
		model.addAttribute("trainingTerms", trainingTerms);
		model.addAttribute("trainingtermsTypeList", codeService.getCode("CMS", "C0014"));
		
		return basePath + "edit_ajax";
	}
	
	@RequestMapping(value = {"/view.*"})
	public String view(Model model, TrainingTerms trainingTerms) {
		
		trainingTerms = (TrainingTerms)service.copyObjectPaging(trainingTerms, service.getTrainingTermsOne(trainingTerms));
		
		model.addAttribute("trainingTerms", trainingTerms);
		
		return basePath + "view_ajax";
	}
	
	@RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Model model, TrainingTerms trainingTerms, BindingResult result, HttpServletRequest request) {		
		JsonResponse res = new JsonResponse(request);		
		/*ValidationUtils.rejectIfEmpty(result, "contents", "상세내용을 입력해주세요.");*/
		ValidationUtils.rejectIfEmpty(result, "use_yn", "사용여부를 선택해주세요.");		
				
 		if(!result.hasErrors()) {
			if(trainingTerms.getEditMode().equals("ADD")) {				
				trainingTerms.setAdd_id(getSessionMemberId(request));
				service.addTrainingTerms(trainingTerms);
				res.setValid(true);
				res.setMessage("등록 되었습니다.");
			} else if(trainingTerms.getEditMode().equals("MODIFY")) {
				trainingTerms.setModify_id(getSessionMemberId(request));
				service.modifyTrainingTerms(trainingTerms);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			}	
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
	@RequestMapping(value = {"/delete.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse delete(Model model, TrainingTerms trainingTerms, BindingResult result, HttpServletRequest request) {
		
		JsonResponse res = new JsonResponse(request);
		
 		if(!result.hasErrors()) {
// 			if ( Integer.parseInt(getSessionMemberInfo(request).getAuth_id()) == 100 ) {
 				trainingTerms.setHomepage_id(getAsideHomepageId(request));
				service.deleteTrainingTerms(trainingTerms);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
// 			} else {
// 				res.setValid(false);
// 				res.setMessage("권한이 없습니다.");
// 			}
 		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
}
