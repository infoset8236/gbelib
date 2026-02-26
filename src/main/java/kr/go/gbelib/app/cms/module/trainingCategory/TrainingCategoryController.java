package kr.go.gbelib.app.cms.module.trainingCategory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;

@Controller
@RequestMapping(value = {"/cms/module/trainingCategory"})
public class TrainingCategoryController extends BaseController {

	private final String basePath = "/cms/module/trainingCategory/";
	
	@Autowired
	private TrainingCategoryService categoryService;
	
	@Autowired
	private TrainingCategoryGroupService categoryGroupService;
	
	@Autowired
	private TrainingCode2Service trainingCode2Service;
	
	@RequestMapping(value = {"/getCategoryList.*"})
	public @ResponseBody Map<String, Object> getCategoryList(Model model, TrainingCategory category, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("categoryList", categoryService.getCategoryListAll(category));
		return result;
	}
	
	@RequestMapping(value = {"/getCategoryGroupList.*"})
	public @ResponseBody List<TrainingCategoryGroup> getCategoryGroupList(Model model, TrainingCategoryGroup categoryGroup, HttpServletRequest request) {
		return categoryGroupService.getCategoryGroupListAll(categoryGroup);
	}
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, TrainingCategoryGroup categoryGroup, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
//		if ( !getSessionIsAdmin(request) ) {
			categoryGroup.setHomepage_id(getAsideHomepageId(request));	
//		}
		int count = categoryGroupService.getCategoryGroupListCount(categoryGroup);
		categoryGroup.setTotalDataCount(count);
		model.addAttribute("categoryGroup", categoryGroup);
		model.addAttribute("categoryGroupListCount", count);
		model.addAttribute("categoryGroupList", categoryGroupService.getCategoryGroupList(categoryGroup));
		
		TrainingCode2 trainingCode2 = new TrainingCode2();
		trainingCode2.setTraining_code(15);
		model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));
		
		return basePath + "index";
	}
	
	@RequestMapping(value = {"/category.*"})
	public String category(Model model, TrainingCategory category, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		int count = categoryService.getCategoryListCount(category);
		categoryService.setPaging(model, count, category);
		category.setTotalDataCount(count);
		model.addAttribute("category", category);
		model.addAttribute("categoryListCount", count);
		model.addAttribute("categoryList", categoryService.getCategoryList(category));
		
		TrainingCategoryGroup cg = new TrainingCategoryGroup();
		cg.setHomepage_id(category.getHomepage_id());
		cg.setLarge_category_idx(category.getLarge_category_idx());
		cg.setGroup_idx(category.getGroup_idx());
		model.addAttribute("categoryGroupOne", categoryGroupService.getCategoryGroupOne(cg));
		
		return basePath + "category_ajax";
	}
	
	@RequestMapping(value = {"/edit.*"})
	public String edit(Model model, TrainingCategory category) {
		if(category.getEditMode().equals("MODIFY")) {
			model.addAttribute("category", categoryService.copyObjectPaging(category, categoryService.getCategoryOne(category)));
			
//			CategoryGroup categoryGroup = new CategoryGroup(category.getHomepage_id()); 
//			categoryGroup.setGroup_idx(category.getGroup_idx());
//			categoryGroup = categoryGroupService.getCategoryGroupOne(categoryGroup);
//			Category categoryLimitTotal = categoryService.getReqLimitTotal(category);
//			if (StringUtils.equals(categoryGroup.getReq_limit_yn(), "Y")) {
//				if (categoryLimitTotal.getCnt() > 0) {
//					model.addAttribute("possibleCount", categoryGroup.getReq_limit_count() - categoryLimitTotal.getReq_limit_count());
//				} else {
//					model.addAttribute("possibleCount", categoryGroup.getReq_limit_count());
//				}
//			} else {
//				TeachSetting trainingSetting = new TeachSetting();
//				trainingSetting.setHomepage_id(categoryGroup.getHomepage_id());
//				trainingSetting = trainingSettingService.getTeachSettingOne(trainingSetting);
//				
//				if (StringUtils.equals(trainingSetting.getUse_yn(), "Y")) {
//					if (categoryLimitTotal.getCnt() > 0) {
//						model.addAttribute("possibleCount", trainingSetting.getTerm_count() - categoryLimitTotal.getReq_limit_count());
//					} else {
//						model.addAttribute("possibleCount", trainingSetting.getTerm_count());
//					}
//				}
//			}
		} else {
			category.setPrint_seq(categoryService.getPrintMaxValue(category));
			model.addAttribute("category", category);
		}
		return basePath + "edit_ajax";
	}
	
	@RequestMapping(value = {"/editGroup.*"})
	public String editGroup(Model model, TrainingCategoryGroup categoryGroup) {
		
		if(categoryGroup.getEditMode().equals("MODIFY")) {
			model.addAttribute("categoryGroup", categoryGroupService.copyObjectPaging(categoryGroup, categoryGroupService.getCategoryGroupOne(categoryGroup)));
//			TeachSetting ts = new TeachSetting();
//			ts.setHomepage_id(categoryGroup.getHomepage_id());
//			ts = trainingSettingService.getTeachSettingOne(ts);
//			if (StringUtils.equals(ts.getUse_yn(), "Y")) {
//				CategoryGroup categoryGroupLimitTotal = categoryGroupService.getReqLimitTotal(categoryGroup);
//				if (categoryGroupLimitTotal.getCnt() > 0) {
//					model.addAttribute("possibleCount", ts.getTerm_count() - categoryGroupLimitTotal.getReq_limit_count());
//				} else {
//					model.addAttribute("possibleCount", ts.getTerm_count());
//				}
//			}
		} else {
			model.addAttribute("categoryGroup", categoryGroup);
		}
		
		return basePath + "editGroup_ajax";
	}
	
	@RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(TrainingCategory category, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		String editMode = category.getEditMode();
		if(!category.getEditMode().equals("DELETE")) {
			ValidationUtils.rejectIfEmpty(result, "category_name", "카테고리명을 입력하세요.");
			ValidationUtils.rejectIfStringLength(result, "category_name", 50, "카테고리명");
			
//			if (StringUtils.equals(category.getReq_limit_yn(), "Y")) {
//				CategoryGroup categoryGroup = new CategoryGroup(category.getHomepage_id()); 
//				categoryGroup.setGroup_idx(category.getGroup_idx());
//				categoryGroup = categoryGroupService.getCategoryGroupOne(categoryGroup);
//				Category categoryLimitTotal = categoryService.getReqLimitTotal(category);
//				if (StringUtils.equals(categoryGroup.getReq_limit_yn(), "Y")) {
//					if (categoryLimitTotal.getCnt() > 0) {
//						int diff = categoryGroup.getReq_limit_count() - (categoryLimitTotal.getReq_limit_count() + category.getReq_limit_count());
//						if (diff < 0) {
//							result.reject("제한횟수는 "+(categoryGroup.getReq_limit_count()-categoryLimitTotal.getReq_limit_count()+1)+"이상 입력할 수 없습니다.");
//						}
//					} else {
//						int diff = categoryGroup.getReq_limit_count() - category.getReq_limit_count();
//						if (diff < 0) {
//							result.reject("제한횟수는 "+(categoryGroup.getReq_limit_count()+1)+"이상 입력할 수 없습니다.");
//						}
//					}
//				} else {
//					TeachSetting trainingSetting = new TeachSetting();
//					trainingSetting.setHomepage_id(categoryGroup.getHomepage_id());
//					trainingSetting = trainingSettingService.getTeachSettingOne(trainingSetting);
//					
//					if (StringUtils.equals(trainingSetting.getUse_yn(), "Y")) {
//						if (categoryLimitTotal.getCnt() > 0) {
//							int diff = trainingSetting.getTerm_count() - (categoryLimitTotal.getReq_limit_count() + category.getReq_limit_count());
//							if (diff < 0) {
//								result.reject("제한횟수는 "+(trainingSetting.getTerm_count()-categoryLimitTotal.getReq_limit_count()+1)+"이상 입력할 수 없습니다.");
//							}
//						} else {
//							int diff = trainingSetting.getTerm_count() - (category.getReq_limit_count());
//							if (diff < 0) {
//								result.reject("제한횟수는 "+(trainingSetting.getTerm_count()+1)+"이상 입력할 수 없습니다.");
//							}
//						}
//					}
//				}
//			}
		} else {
			if ( categoryService.checkTrainingInCategory(category) > 0) {
				result.reject("해당 카테고리에 생성된 강좌가 있으므로 삭제가 불가능 합니다.");
			}
		}
		
		
		
		if(!result.hasErrors()) {
			if(editMode.equals("ADD")) {
				category.setAdd_id(getSessionMemberId(request));
				categoryService.addCategory(category);
				res.setValid(true);
				res.setMessage("등록 되었습니다.");
			} else if(editMode.equals("MODIFY")) {
				category.setMod_id(getSessionMemberId(request));
				categoryService.modifyCategory(category);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			} else if(editMode.equals("DELETE")) {
				categoryService.deleteCategory(category);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
	@RequestMapping(value = {"/saveGroup.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse saveGroup(TrainingCategoryGroup categoryGroup, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		String editMode = categoryGroup.getEditMode();
		if(!categoryGroup.getEditMode().equals("DELETE")) {
			ValidationUtils.rejectIfEmpty(result, "group_name", "그룹명을 입력하세요.");
			ValidationUtils.rejectIfStringLength(result, "group_name", 50, "그룹명");
			
//			if (StringUtils.equals(categoryGroup.getReq_limit_yn(), "Y")) {
//				TeachSetting trainingSetting = new TeachSetting();
//				trainingSetting.setHomepage_id(categoryGroup.getHomepage_id());
//				trainingSetting = trainingSettingService.getTeachSettingOne(trainingSetting);
//				if (StringUtils.equals(trainingSetting.getUse_yn(), "Y")) {
//					CategoryGroup categoryGroupLimitTotal = categoryGroupService.getReqLimitTotal(categoryGroup);
//					if (categoryGroupLimitTotal.getCnt() > 0) {
//						int diff = trainingSetting.getTerm_count() - (categoryGroupLimitTotal.getReq_limit_count() + categoryGroup.getReq_limit_count());
//						if (diff < 0) {
//							result.reject("제한횟수는 "+(trainingSetting.getTerm_count()-categoryGroupLimitTotal.getReq_limit_count()+1)+"이상 입력할 수 없습니다.");
//						}
//					} else {
//						int diff = trainingSetting.getTerm_count() - (categoryGroup.getReq_limit_count());
//						if (diff < 0) {
//							result.reject("제한횟수는 "+(trainingSetting.getTerm_count()+1)+"이상 입력할 수 없습니다.");
//						}
//					}
//				}
//			}
		} else {
			if ( categoryGroupService.checkCategoryInGroup(categoryGroup) > 0 ) {
				result.reject("해당 그룹에 생성된 카테고리가 있으므로 삭제가 불가능 합니다.");
			}
		}
		
		if(!result.hasErrors()) {
			if(editMode.equals("ADD")) {
				categoryGroup.setAdd_id(getSessionMemberId(request));
				categoryGroupService.addCategoryGroup(categoryGroup);
				res.setValid(true);
				res.setMessage("등록 되었습니다.");
			} else if(editMode.equals("MODIFY")) {
				categoryGroup.setMod_id(getSessionMemberId(request));
				categoryGroupService.modifyCategoryGroup(categoryGroup);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			} else if(editMode.equals("DELETE")) {
				categoryGroupService.deleteCategoryGroup(categoryGroup);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
}