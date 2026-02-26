package kr.go.gbelib.app.cms.module.training;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.app.cms.module.survey.SurveyService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.cms.module.training.student2.Student2;
import kr.go.gbelib.app.cms.module.training.student2.Student2Service;
import kr.go.gbelib.app.cms.module.training.trainingCode.TrainingCode;
import kr.go.gbelib.app.cms.module.training.trainingCode.TrainingCodeService;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategory;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategoryService;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;
import kr.go.gbelib.app.cms.module.trainingSetting.TrainingSetting;
import kr.go.gbelib.app.cms.module.trainingSetting.TrainingSettingService;

@Controller
@RequestMapping(value = { "/cms/module/training" })
public class TrainingController extends BaseController {

	private final String basePath = "/cms/module/training/";

	@Autowired
	private TrainingService trainingService;

	@Autowired
	private TrainingSettingService trainingSettingService;
	
	@Autowired
	private TrainingCategoryGroupService categoryGroupService;
	
	@Autowired
	private TrainingCategoryService categoryService;

	@Autowired
	private Student2Service studentService;
	
	@Autowired
	private HomepageService homepageService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private TrainingCodeService trainingCodeService;
	
	@Autowired
	private TrainingCode2Service trainingCode2Service;
	
	@RequestMapping(value = {"/getTrainingList.*"})
	public @ResponseBody Map<String, Object> getTrainingList(Model model, Training training, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("trainingList", trainingService.getTrainingListAll(training));
		return result;
	}
	
	@RequestMapping(value = { "/index.*" })
	public String index(Model model, Training training, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
//		if ( !getSessionIsAdmin(request) ) {
		training.setHomepage_id(getAsideHomepageId(request));
//		}

		int count = trainingService.getTrainingListCount(training);
		trainingService.setPaging(model, count, training);
		training.setTotalDataCount(count);
		model.addAttribute("training", training);
		model.addAttribute("trainingListCount", count);
		model.addAttribute("trainingList", trainingService.getTrainingList(training));
		model.addAttribute("categoryGroupList", categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(training.getHomepage_id(), training.getLarge_category_idx())));
		model.addAttribute("categoryList", categoryService.getCategoryListAll(new TrainingCategory(training.getHomepage_id(), training.getGroup_idx(), training.getLarge_category_idx())));
		

		//프로그램 대분류
		model.addAttribute("trainingLargeCodeList", trainingCodeService.getLargeCodeList());
		//프로그램 중분류
		TrainingCode trainingCode = new TrainingCode();
		trainingCode.setLarge_code("A");
		trainingCode.setMid_code("01");
		trainingCode.setMid_code("01");
		model.addAttribute("trainingMidCodeList", trainingCodeService.getMidCodeList(trainingCode));
		//프로그램 소분류
		model.addAttribute("trainingSmallCodeList", trainingCodeService.getSmallCodeList(trainingCode));
		
		//프로그램 주제구분
		TrainingCode2 trainingCode2 = new TrainingCode2(1);
		model.addAttribute("trainingSubjectCodeList", trainingCode2Service.getSubcategories(trainingCode2));
		
		//프로그램 연령구분
		trainingCode2.setTraining_code(8);
		model.addAttribute("trainingAgeDivCodeList", trainingCode2Service.getSubcategories(trainingCode2));
		
		//강좌대분류
		trainingCode2.setTraining_code(15);
		model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));
		
		
		return basePath + "index";
	}

	@RequestMapping(value = { "/edit.*" })
	public String edit(Model model, Training training, HttpServletRequest request) throws AuthException {

		List<TrainingCategoryGroup> categoryGroupListAll = categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(training.getHomepage_id()));
		
		model.addAttribute("categoryGroupList", categoryGroupListAll);
//		model.addAttribute("categoryList", categoryService.getCategoryListAll(new Category(teach.getHomepage_id())));
		if (categoryGroupListAll != null && categoryGroupListAll.size() > 0) {
			model.addAttribute("categoryList", categoryService.getCategoryList(new TrainingCategory(training.getHomepage_id(), categoryGroupListAll.get(0).getGroup_idx())));
		}
		model.addAttribute("cellPhoneCode", codeService.getCode(training.getHomepage_id(), "C0002"));
		model.addAttribute("phoneCode", codeService.getCode(training.getHomepage_id(), "C0003"));
		model.addAttribute("surveyList", surveyService.getSurveyAll(training.getHomepage_id()));

		training.setQr_check("Y");

		Training trainingOne = null;
		if (training.getEditMode().equals("MODIFY") || training.getEditMode().equals("VIEW")) {
			trainingOne = new Training();
			trainingOne = (Training) trainingService.copyObjectPaging(training,trainingService.getTrainingOne(training));
			model.addAttribute("training", trainingOne);
		} else {
			training.setPrint_seq(trainingService.getPrintMaxValue(training));
			model.addAttribute("training", training);
		}
		
		
		//프로그램 대분류
		model.addAttribute("trainingLargeCodeList", trainingCodeService.getLargeCodeList());
		//프로그램 중분류
		TrainingCode trainingCode = new TrainingCode();
		if (trainingOne != null && StringUtils.isNotEmpty(trainingOne.getProgram_classification1())) {
			trainingCode.setLarge_code(trainingOne.getProgram_classification1());
			trainingCode.setMid_code(trainingOne.getProgram_classification2());
		} else {
			trainingCode.setLarge_code("A");
			trainingCode.setMid_code("01");
		}
		model.addAttribute("trainingMidCodeList", trainingCodeService.getMidCodeList(trainingCode));
		//프로그램 소분류
		model.addAttribute("trainingSmallCodeList", trainingCodeService.getSmallCodeList(trainingCode));
		
		//프로그램 주제구분
		TrainingCode2 trainingCode2 = new TrainingCode2(1);
		model.addAttribute("trainingSubjectCodeList", trainingCode2Service.getSubcategories(trainingCode2));
		
		//프로그램 연령구분
		trainingCode2.setTraining_code(8);
		model.addAttribute("trainingAgeDivCodeList", trainingCode2Service.getSubcategories(trainingCode2));
		
		//강좌대분류
		trainingCode2.setTraining_code(15);
		model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));
		
		
		if ( training.getEditMode().equals("MODIFY") ) {
			checkAuth("U", model, request);
			return basePath + "edit_ajax";
		} else if (training.getEditMode().equals("VIEW")) {
			checkAuth("R", model, request);
			return "/cms/module/calendarManage/trainingEdit_ajax";
		} else {
			checkAuth("C", model, request);
			return basePath + "edit_ajax";
		}
	}
	
	@RequestMapping(value = { "/setting.*" })
	public String setting(Model model, TrainingSetting trainingSetting, HttpServletRequest request) {
		TrainingSetting oneTrainingSetting = trainingSettingService.getTrainingSettingOne(trainingSetting);
		if ( oneTrainingSetting != null ) {
			trainingSetting = oneTrainingSetting;
		}
		model.addAttribute("trainingSetting", trainingSetting);
		return basePath + "setting_ajax";
	}
	
	@RequestMapping(value = {"/getSameTrainingList.*"})
	public @ResponseBody Map<String, Object> getCategoryList(Model model, Training training, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		training.setTraining_name(training.getTraining_name().trim());
		result.put("sameTrainingList", trainingService.getSameTrainingByName(training));
		return result;
	}
	

	@RequestMapping(value = { "/save.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Model model, Training training, BindingResult result, HttpServletRequest request) throws ParseException {
		JsonResponse res = new JsonResponse(request);
		String editMode = training.getEditMode();
		if ( !training.getEditMode().equals("DELETE") ) {
			ValidationUtils.rejectIfEmpty(result, "training_name", "연수명을 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "training_stage", "연수장소를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "use_yn", "사용여부를 선택하세요.");
			ValidationUtils.rejectIfEmpty(result, "certificate_yn","수료증 발급 여부를 선택하세요.");
			
			ValidationUtils.rejectIfStringLength(result, "training_name", 100, "연수명");
			ValidationUtils.rejectIfStringLength(result, "training_desc", 2000, "연수설명");
			ValidationUtils.rejectIfStringLength(result, "training_etc", 100, "준비물 및 재료비");
			ValidationUtils.rejectIfStringLength(result, "training_stage", 50, "연수장소");
			ValidationUtils.rejectIfStringLength(result, "training_target", 200, "연수대상");
			
			if ( editMode.equals("ADD") || editMode.equals("MODIFY") ) {
				ValidationUtils.rejectIfEmpty(result, "program_age_div_arr","연령구분을 선택해주세요");
				ValidationUtils.rejectIfZero(result, "group_idx", "중분류를 선택해 주세요.");
				ValidationUtils.rejectExceptNumber(result, "training_limit_count","모집인원은 숫자만 입력 가능 합니다.");
				ValidationUtils.rejectExceptNumber(result, "training_backup_count","모집후보인원은 숫자만 입력 가능 합니다.");
				ValidationUtils.rejectExceptNumber(result, "training_offline_count","모집오프라인인원은 숫자만 입력 가능 합니다.");
				ValidationUtils.rejectIfEmpty(result, "start_join_date","연수모집 시작 기간을 선택하세요.");
				ValidationUtils.rejectIfEmpty(result, "end_join_date","연수모집 종료 기간을 선택하세요.");
				ValidationUtils.rejectIfEmpty(result, "start_join_time","연수모집 시작 시간을 입력하세요.");
				ValidationUtils.rejectIfEmpty(result, "end_join_time","연수모집 종료 시간을 입력하세요.");
				ValidationUtils.rejectIfEmpty(result, "start_date","연수시작 기간을 선택하세요.");
				ValidationUtils.rejectIfEmpty(result, "start_time","연수시작 시간을 입력하세요.");
				ValidationUtils.rejectIfEmpty(result, "end_date", "연수종료 기간을 선택하세요.");
				ValidationUtils.rejectIfEmpty(result, "end_time", "연수종료 시간을 입력하세요.");
				ValidationUtils.rejectIfEmpty(result, "training_day","연수요일을 선택해 주세요.");
				
				if(training.getImage_plan_file() != null) {
					String org_file_name = training.getImage_plan_file().getOriginalFilename();
					try {
						int valueLength = org_file_name.replaceAll("\r\n", "\n").getBytes("UTF-8").length;
						if (50 < valueLength ) {
							result.reject(String.format("%s 파일명이 길이가 큽니다. 현재 : %s, 제한 : %s", org_file_name, valueLength, 50));
						}
					} catch ( UnsupportedEncodingException e ) {
						e.printStackTrace();
					}
				}
				
				if(training.getPlan_file() != null) {
					String org_file_name = training.getPlan_file().getOriginalFilename();
					try {
						int valueLength = org_file_name.replaceAll("\r\n", "\n").getBytes("UTF-8").length;
						if (50 < valueLength ) {
							result.reject(String.format("%s 파일명이 길이가 큽니다. 현재 : %s, 제한 : %s", org_file_name, valueLength, 50));
						}
					} catch ( UnsupportedEncodingException e ) {
						e.printStackTrace();
					}
				}

				if ( !result.hasErrors() ) {

					if ( training.getTraining_join_limit_unit().indexOf("SEX") != -1 || training.getTraining_join_limit_unit().indexOf("OLD") != -1) {
						if ( training.getTraining_join_limit_value() == null ) {
							result.reject("접수 제한 값을 설정해주세요.");
						}
						
						if ( StringUtils.isNotEmpty(training.getTraining_join_limit_unit()) && StringUtils.isNotEmpty(training.getTraining_join_limit_value())  ) {
							String[] limitUnit 	= training.getTraining_join_limit_unit().split(",");
							String[] limitValue = training.getTraining_join_limit_value().split(",");
							for ( int i = 0; i < limitUnit.length; i ++ ) {
								if ( limitUnit[i].equals("SEX") ) {
									if ( limitValue.length <= i ) {
										result.reject("제한 할 성별을 선택해주세요.");
									}
								}
								
								if ( limitUnit[i].equals("OLD") ) {
									try {
										int startOld 	= Integer.parseInt(limitValue[i]);
										int endOld		= Integer.parseInt(limitValue[i + 1]);
										if ( startOld > endOld ) {
											result.reject("나이 제한 설정이 올바르지 않습니다.");
										}
									}
									catch (NumberFormatException e1) {
										result.reject("나이 제한 설정 값은 숫자만 입력 가능합니다.");
									}
									catch (IndexOutOfBoundsException e2) {
										result.reject("나이 제한 설정 값을 모두 입력 해주세요.");
									}
								}
							}	
						}
					}
				}
			}
			
			if ( !result.hasErrors() ) {
				SimpleDateFormat sfDate = new SimpleDateFormat("yyyy-MM-dd");
				
				// 접수일보다 연수 시작일이 빠를수 없다.
				Date start_join_date 	= sfDate.parse(training.getStart_join_date());
				Date end_join_date 		= sfDate.parse(training.getEnd_join_date());
				Date start_date 		= sfDate.parse(training.getStart_date());
				Date end_date 			= sfDate.parse(training.getEnd_date());
				Date start_cancle_date 	= StringUtils.isNotEmpty(training.getStart_cancle_date()) ? sfDate.parse(training.getStart_cancle_date()) : null; 
				
				if ( start_join_date.after(start_date) ) {
					result.reject("접수 시작일은 강좌 시작일보다 빨라야 합니다.");
				}
				
				if ( end_date.before(end_join_date) ) {
					result.reject("접수 종료일은 강좌 종료일보다 빨라야 합니다.");
				}
				
				if ( start_cancle_date != null && start_cancle_date.after(start_date) ) {
					result.reject("접수취소 시작일은 강좌 시작일보다 빨라야 합니다.");
				}
				
				SimpleDateFormat sfTime = new SimpleDateFormat("HH:mm");
				sfTime.setLenient(false);
				try {
					sfTime.parse(training.getStart_join_time());
					sfTime.parse(training.getEnd_join_time());
					sfTime.parse(training.getStart_time());
					sfTime.parse(training.getEnd_time());
					if(StringUtils.isNotEmpty(training.getStart_cancle_time()) && StringUtils.isNotEmpty(training.getEnd_cancle_time())) {
						sfTime.parse(training.getStart_cancle_time());
						sfTime.parse(training.getEnd_cancle_time());
					}
				} catch (Exception e) {
					result.reject("시간입력은 00:00 ~ 23:59 범위 입니다.");
				}
			}
			
			if ( !result.hasErrors() ) {
				if(StringUtils.isNotEmpty(training.getCancle_guid())) {
					int valueLength = 0;
					try {
						valueLength = training.getCancle_guid().getBytes("EUC-KR").length;
					} catch ( UnsupportedEncodingException e ) {
						e.printStackTrace();
					}
					
					if(valueLength > 2000) {
						result.reject(String.format("취소 안내 내용에 입력하신 길이가 큽니다. 현재 : %s byte, 제한 : %s byte", valueLength, 2000));
					}
					
				}
			}
		}
		else {
			Training targetTraining = trainingService.getTrainingOne(training);
			// 강좌 삭제시 참여인원, 대기인원, 오프참여 인원이 1명이라도 있으면 삭제 불가.
			if ( targetTraining.getTraining_join_count() > 0 || targetTraining.getTraining_backup_join_count() > 0 || targetTraining.getTraining_off_join_count() > 0 ) {
				result.reject("해당 강좌는 참여/대기/오프 인원이 접수되어있으므로 삭제 불가능 합니다.");
			}
		}
		
		if ( !result.hasErrors() ) {
			if(StringUtils.isEmpty(training.getApply_limit())) {
				training.setApply_limit("N");
			}
			
			if ( editMode.equals("ADD") ) {
				if ( StringUtils.isNotEmpty(training.getTraining_name()) ) {
					training.setTraining_name(training.getTraining_name().trim());	
				}
				
				training.setAdd_id(getSessionMemberId(request));
				trainingService.addTraining(training);
				res.setValid(true);
				res.setMessage("등록 되었습니다.");
			} else if ( editMode.equals("MODIFY") ) {
				training.setMod_id(getSessionMemberId(request));
				trainingService.modifyTraining(training);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			} else if ( editMode.equals("DELETE") ) {
				trainingService.deleteTraining(training);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}
	
	@RequestMapping(value = { "/saveSetting.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse saveSetting(Model model, TrainingSetting trainingSetting, BindingResult result, HttpServletRequest request) throws ParseException {
		JsonResponse res = new JsonResponse(request);
		
		ValidationUtils.rejectExceptNumber(result, "term_count", "제한횟수는 숫자만 가능합니다.");
		
		if ( !result.hasErrors() ) {
			if (StringUtils.equals(trainingSetting.getUse_yn(), "Y")) {
				if (trainingSetting.getTerm_count() < 2) {
					res.setValid(false);
					res.setMessage("제한횟수는 1보다 큰 수만 가능 합니다.");
					return res;
				}
			}
			trainingSettingService.mergeTrainingSetting(trainingSetting);
			res.setMessage("저장 되었습니다.");
			res.setValid(true);
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = { "/excelDownload.*" }, method = RequestMethod.POST)
	public TrainingSearchView excel(Model model, Training training, HttpServletRequest request, HttpServletResponse response) throws Exception {
		model.addAttribute("homepage", homepageService.getHomepageOne(new Homepage(training.getHomepage_id())));
		model.addAttribute("training", training);
		model.addAttribute("trainingResult", trainingService.getTrainingListAll(training));
		return new TrainingSearchView();
	}
	
	@RequestMapping(value = {"/csvDownload.*"}, method = RequestMethod.POST)
	public void csv(Model model, Training training, HttpServletRequest request, HttpServletResponse response) {
		List<Training> trainingList = trainingService.getTrainingListAll(training);
		Homepage homepage = homepageService.getHomepageOne(new Homepage(training.getHomepage_id()));
		
		model.addAttribute("training", training);
		model.addAttribute("trainingResult", trainingService.getTrainingListAll(training));

		new TrainingXlsToCsv(trainingList, "training.csv", homepage, request, response);
	}
	
	@RequestMapping(value = "/download/{homepage_id}/{group_idx}/{category_idx}/{training_idx}.*", method = RequestMethod.GET)
	@ResponseBody
    public byte[] getFile(@PathVariable("homepage_id") String homepage_id, @PathVariable("group_idx") int group_idx, @PathVariable("category_idx") int category_idx, @PathVariable("training_idx") int training_idx, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Training training = trainingService.getTrainingOne(new Training(homepage_id, group_idx, category_idx, training_idx));
		String filePath = trainingService.getRootPath()+ "/" + homepage_id + "/" + training.getReal_file_name();
		File file = new File(filePath);
		
		byte[] bytes = null;
		
		if(file.length() > 0) {
			bytes = FileCopyUtils.copyToByteArray(file);
		} else {
			response.setHeader("Content-type", "text/html");
			trainingService.alertMessage("파일이 존재하지 않습니다.", request, response);
			return null;
		}
		
//		String fileName = "";
		String fileName = String.format("%s.%s", training.getPlan_file_name(),training.getFile_extension() );
		
		response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
		response.setHeader("Content-Length", Long.toString(file.length()));
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.setHeader("Content-Type", "application/octet-stream");
	    
	    return bytes;
    }
	// 연수당 수료자조회
	@RequestMapping(value = {"/getTrainingCertificateList.*"})
	public String getTrainingCertificateList(Model model, Training training, HttpServletRequest request) {
		model.addAttribute("trainingCertificateList", studentService.getTrainingCertificateList(new Student2(training.getHomepage_id(), training.getGroup_idx(), training.getCategory_idx(), training.getTraining_idx())));
		
		return basePath + "trainingCertificateList_ajax";
	}
	
	@RequestMapping(value = {"/getPrintCertOne.*"})
	public String getPrintCertOne(Model model, Training training, HttpServletRequest request) {
		model.addAttribute("getPrintCertOne", studentService.getStudent2One(new Student2(training.getHomepage_id(), training.getGroup_idx(), training.getCategory_idx(), training.getTraining_idx())));
		
		return basePath + "getPrintCertOne_ajax";
	}
	
	@RequestMapping(value = {"/getTrainingCertificateListByDate.*"})
	public String getTrainingCertificateListByDate(Model model, Student2 student, HttpServletRequest request) {
		
		model.addAttribute("student", student);
		if ( !student.getEditMode().equals("FIRST") ) {
			model.addAttribute("certStudentList", studentService.getCertificateListByDate(student));	
		}
		
		return basePath + "certStudentList_ajax";
	}
	
	@RequestMapping(value = { "/deleteFile.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse deleteFile(Model model, Training training, BindingResult result, HttpServletRequest request) throws ParseException {
		JsonResponse res = new JsonResponse(request);
		
		trainingService.deleteFile(training);
		res.setValid(true);
		res.setMessage("파일을 삭제 했습니다.");
		
		return res;
	}
	
	@RequestMapping(value = { "/deleteImage.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse deleteImage(Model model, Training training, BindingResult result, HttpServletRequest request) throws ParseException {
		JsonResponse res = new JsonResponse(request);
		
		trainingService.deleteImage(training);
		res.setValid(true);
		res.setMessage("이미지를 삭제 했습니다.");
		
		return res;
	}
	
	@RequestMapping (value = { "/getMidCodeList.*" }, method = RequestMethod.GET)
	public @ResponseBody List<TrainingCode> getMidCodeList(TrainingCode trainingCode, HttpServletRequest request) {
		return trainingCodeService.getMidCodeList(trainingCode);
	}
	
	@RequestMapping (value = { "/getSmallCodeList.*" }, method = RequestMethod.GET)
	public @ResponseBody List<TrainingCode> getSmallCodeList(TrainingCode trainingCode, HttpServletRequest request) {
		return trainingCodeService.getSmallCodeList(trainingCode);
	}
}