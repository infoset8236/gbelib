package kr.go.gbelib.app.cms.module.training.student2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.gbelib.app.cms.module.blackList.BlackList;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.cms.code.Code;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.file.Download;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.TrainingService;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategory;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategoryService;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;
import kr.go.gbelib.app.common.api.MemberAPI;

@Controller
@RequestMapping(value = {"/cms/module/training/student2"}) 
public class Student2Controller extends BaseController {

	private final String basePath = "/cms/module/training/student2/";
	
	private final int cert_percent = 70;	// 수료 기준 출석률

	@Autowired
	private Student2Service student2Service;
	
	@Autowired
	private TrainingService trainingService;
	
	@Autowired
	private CodeService codeService;

	@Autowired
	private TrainingCategoryGroupService categoryGroupService;
	
	@Autowired
	private TrainingCategoryService categoryService;

	@Autowired
	private TrainingCode2Service trainingCode2Service;
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, Student2 student, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
//		if ( !getSessionIsAdmin(request) ) {
			student.setHomepage_id(getAsideHomepageId(request));	
//		}
		model.addAttribute("categoryGroupList", categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(student.getHomepage_id(), student.getLarge_category_idx())));
		model.addAttribute("categoryList", categoryService.getCategoryListAll(new TrainingCategory(student.getHomepage_id(), student.getGroup_idx(), student.getLarge_category_idx())));
		Training training = new Training(student.getHomepage_id(), student.getGroup_idx(),student.getCategory_idx());
		training.setLarge_category_idx(student.getLarge_category_idx());
		model.addAttribute("trainingList", trainingService.getTrainingListAll(training));
		model.addAttribute("student", student);
		
		TrainingCode2 trainingCode2 = new TrainingCode2(1);
		trainingCode2.setTraining_code(15);
		model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));
		
		return basePath + "index";
	}
	
	@RequestMapping(value = {"/student.*"})
	public String student(Model model, Student2 student, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		student.setCert_percent(cert_percent);
		int count = student2Service.getStudent2ListCount(student);
		student2Service.setPaging(model, count, student);
		
		model.addAttribute("student", student);
		Training training = new Training(student.getHomepage_id(), student.getGroup_idx(), student.getCategory_idx(), student.getTraining_idx());
		training.setLarge_category_idx(student.getLarge_category_idx());
				
		model.addAttribute("trainingInfo", trainingService.getTrainingOne(training));
		model.addAttribute("studentListCount", count);
		model.addAttribute("studentList", student2Service.getStudent2List(student));
		Map<String, Code> codeRepo = new HashMap<String, Code>();
		for ( Code one : codeService.getCode("CMS", "C0005") ) {
			codeRepo.put(one.getCode_id(), one);
		}
		model.addAttribute("statusCode", codeRepo);

		BlackList blackList = new BlackList();
		model.addAttribute("blackList", blackList);

		return basePath + "student_ajax";
	}
	
	@RequestMapping(value = {"/edit.*"})
	public String edit(Model model, Student2 student, HttpServletRequest request) throws AuthException {
		if(student.getEditMode().equals("MODIFY")) {
			checkAuth("U", model, request);
			model.addAttribute("student", student2Service.copyObjectPaging(student, student2Service.getStudent2One(student)));
		} else {
			checkAuth("C", model, request);
			model.addAttribute("student", student);
		}
		model.addAttribute("training", trainingService.getTrainingOne(new Training(student.getHomepage_id(), student.getGroup_idx(), student.getCategory_idx(), student.getTraining_idx())));
		model.addAttribute("statusCode", codeService.getCode("CMS", "C0005"));
		model.addAttribute("hakList", codeService.getCode("CMS", "C0020"));
		model.addAttribute("traingLocationList", codeService.getCode("CMS", "C0022"));
		
		return basePath + "edit_ajax";
	}
	
	@RequestMapping(value = {"/checkId.*"}, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkId(Model model, Student2 student, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Member studentMember = new Member();
		studentMember.setUser_id(student.getMember_id());
		Map<String, String> memberInfo = null;
		if ( student.getSearch_api_type().equals("WEBID") ) {
			studentMember.setCheck_certify_type("WEBID");
			studentMember.setCheck_certify_data(student.getMember_id());

			memberInfo = MemberAPI.getMemberCertify("WEB", studentMember);
			
			if ( memberInfo == null ) {
				result.put("resultMsg", "해당 ID는 유효한 회원이 아닙니다.");
				return result;
			} else {
				Member member = new Member();
				member.setUser_id(memberInfo.get("USER_ID"));
				memberInfo = MemberAPI.getMember("WEB", member);
			}
		}
		else {
//			memberInfo = MemberAPI.getDupUser("WEB", studentMember, "0002", student.getMember_id());
			Member member = new Member();
			member.setUser_id(student.getMember_id());
			memberInfo = MemberAPI.getMember("WEB", member);
			if ( memberInfo == null ) {
				result.put("resultMsg", "해당 ID는 유효한 회원이 아닙니다.");
				return result;
			}
		}
				
		result.put("memberInfo", memberInfo);
		return result; 
	}
	
	@RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Model model, Student2 student, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		
		if ( !student.getEditMode().equals("DELETE") && !student.getEditMode().equals("CANCEL") && !student.getEditMode().equals("SAVELIST")
				&& !student.getEditMode().equals("BATCH_DELETE") && !student.getEditMode().equals("BATCH_CANCEL") ) {
			if ( student.getEditMode().equals("ADD") ) {
				ValidationUtils.rejectIfEmpty(result, "member_id", "신청자ID를 입력하세요.");
				ValidationUtils.rejectIfEmpty(result, "member_key", "ID 확인을 해주세요.");
			}
			
			ValidationUtils.rejectIfEmpty(result, "applicant_name", "신청자명을 입력하세요.");
			ValidationUtils.rejectNumbers(result, "applicant_name", "신청자명에는 숫자를 입력할 수 없습니다.");
			ValidationUtils.rejectIfEmpty(result, "applicant_birth", "신청자 생년월일을 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "applicant_sex", "신청자 성별을 선택하세요.");
			ValidationUtils.rejectIfEmpty(result, "applicant_zipcode", "신청자 우편번호를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "applicant_address", "신청자 주소를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "applicant_cell_phone", "신청자 휴대전화번호를 입력하세요.");
			ValidationUtils.rejectPhone(result, "applicant_cell_phone", "폰번호 형식이 잘못되었습니다.");
			
			ValidationUtils.rejectIfEmpty(result, "student_name", "수강생명을 입력하세요.");
			ValidationUtils.rejectNumbers(result, "student_name", "수강생명에는 숫자를 입력할 수 없습니다.");
			ValidationUtils.rejectIfEmpty(result, "student_birth", "수강생 생년월일을 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "student_sex", "수강생 성별을 선택하세요.");
			ValidationUtils.rejectIfEmpty(result, "student_zipcode", "수강생 우편번호를 입력하세요.");
			ValidationUtils.rejectIfEmpty(result, "student_address", "수강생 주소를 입력하세요.");
			
			ValidationUtils.rejectIfStringLength(result, "student_name", 20, "수강생명");
			ValidationUtils.rejectIfStringLength(result, "student_address", 200, "수강생 주소");
			ValidationUtils.rejectIfStringLength(result, "student_name", 20, "수강생명");

			ValidationUtils.rejectIfStringLength(result, "applicant_name", 20, "신청자명");
			
			ValidationUtils.rejectIfStringLength(result, "applicant_address", 200, "신청자 주소");
			
			ValidationUtils.rejectIfStringLength(result, "applicant_cell_phone", 13, "신청자 휴대전화번호");
			
			
			if ( student.getEditMode().equals("ADD") && student.getSelf_info_yn().equals("N") ) {
				res.setValid(false);
				res.setMessage("개인정보 미동의 시 참여 하실수 없습니다.");
				return res;
			}
			
			if ( student.getEditMode().equals("ADD") ) {
				String resultMsg = student2Service.checkStudent2(student);
				if ( resultMsg != null ) {
					res.setValid(false);
					res.setMessage(resultMsg);
					return res;
				}
			}
		}
		
		if(!result.hasErrors()) {
			if(student.getEditMode().equals("ADD")) {
				student.setAdd_id(getSessionMemberId(request));
				Object[] addResult = student2Service.addStudent2(student, "CMS");
				res.setValid((Boolean) addResult[0]);
				res.setMessage((String) addResult[1]);
			}else if(student.getEditMode().equals("MODIFY")) {
				student.setMod_id(getSessionMemberId(request));
				student2Service.modifyStudent2(student);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			} else if(student.getEditMode().equals("DELETE")) {
				student2Service.deleteStudent2(student);
				//trainingBookService.deleteTrainingBookByStudent(student);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			} else if (student.getEditMode().equals("CANCEL")) {
				student.setCancel_id(getSessionMemberId(request));
				student2Service.cancelStudent2(student);
				res.setValid(true);
				res.setMessage("취소되었습니다.");
			} else if (student.getEditMode().equals("SAVELIST")) {
				List<Student2> studentList = student.getStudentList(); 
				for ( int i = 0; i < studentList.size(); i ++ ) {
					Student2 one = studentList.get(i);
					one.setHomepage_id(student.getHomepage_id());
					one.setGroup_idx(student.getGroup_idx());
					one.setCategory_idx(student.getCategory_idx());
					one.setTraining_idx(student.getTraining_idx());
					studentList.set(i, one);
					
					Member studentMember = new Member();
					studentMember.setUser_id(one.getMember_id());
					studentMember.setCheck_certify_type("WEBID");
					studentMember.setCheck_certify_data(one.getMember_id());
					Map<String, String> memberInfo = MemberAPI.getMemberCertify("WEB", studentMember);
					
					if ( memberInfo != null ) {
						String web_id 	= memberInfo.get("WEB_ID");
						String seq_no 	= memberInfo.get("SEQ_NO");
						
//						one.setMember_id(web_id);
						one.setMember_key(seq_no);
						one.setWeb_id(web_id);
						one.setMember_id(memberInfo.get("USER_ID"));
					}
					else {
							
//						memberInfo = MemberAPI.getDupUser("WEB", studentMember, "0002", one.getMember_id());
//						if ( memberInfo != null && !memberInfo.isEmpty()) {
//							String web_id 	= memberInfo.get("WEB_ID");
//							String seq_no 	= memberInfo.get("SEQ_NO");
//							
////							one.setMember_id(web_id);
//							one.setMember_key(seq_no);
//							one.setWeb_id(web_id);
//							one.setMember_id(memberInfo.get("USER_ID"));
//						}
//						else {
//							res.setMessage(String.format("(ERROR) %s번째 신청자 : 해당 ID는 유효한 회원이 아닙니다.", i+1));
//							res.setValid(false);
//							return res;	
//						}
						res.setMessage(String.format("(ERROR) %s번째 신청자 : 해당 ID는 유효한 회원이 아닙니다.", i+1));
						res.setValid(false);
						return res;
					}
					
					String resultMsg = student2Service.checkValidation(one) ;
					if ( resultMsg != null ) {
						res.setValid(false);
						res.setMessage(String.format("(ERROR) %s번째 신청자 : %s", i+1, resultMsg));
						return res;
					}
				}
				
				List<String> resultMsg = new ArrayList<String>();
				for ( int j = 0; j < studentList.size(); j ++ ) {
					Student2 one = studentList.get(j);
					
					Object[] addResult = student2Service.addStudent2(one, "CMS");
					resultMsg.add(String.format("%s번째 : %s", j+1, addResult[1]));
				}
				res.setValid(false);
				res.setMessage(StringUtils.join(resultMsg, "\n"));
			} else if (student.getEditMode().equals("BATCH_DELETE")) {
				student2Service.batchDeleteStudent2(student);
				//trainingBookService.deleteTrainingBookByStudent(student);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			} else if (student.getEditMode().equals("BATCH_CANCEL")) {
				student.setCancel_id(getSessionMemberId(request));
				student2Service.batchCancelStudent2(student);
				res.setValid(true);
				res.setMessage("취소되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
	@RequestMapping(value = {"/certificate.*"})
	public String certificate(Model model, Student2 student, HttpServletRequest request) {
		
		model.addAttribute("certificateInfo", student2Service.getCertificateInfo(student));
		
		return basePath + "certificate_ajax";
	}
	
	@RequestMapping(value = { "/excelDownload.*" }, method = RequestMethod.POST)
	public Student2SearchView excel(Model model, Student2 student, HttpServletRequest request, HttpServletResponse response) throws Exception {
		model.addAttribute("training", trainingService.getTrainingOne(new Training(student.getHomepage_id(), student.getGroup_idx(), student.getCategory_idx(), student.getTraining_idx())));
		model.addAttribute("student", student);
		model.addAttribute("studentResult", student2Service.getStudent2ListAll(student));
		return new Student2SearchView();
	}
	
	@RequestMapping(value = {"/csvDownload.*"}, method = RequestMethod.POST)
	public void csv(Model model, Student2 student, HttpServletRequest request, HttpServletResponse response) {
		List<Student2> trainingList = student2Service.getStudent2ListAll(student);
		Training training = trainingService.getTrainingOne(new Training(student.getHomepage_id(), student.getGroup_idx(), student.getCategory_idx(), student.getTraining_idx()));
		
		model.addAttribute("student", student);
		model.addAttribute("studentResult", student2Service.getStudent2ListAll(student));

		new Student2XlsToCsv(trainingList, "Student.csv", training, request, response);
	}
	
	@RequestMapping(value = {"/excelUpload.*"}, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> excelUpload(Model model, Student2 student, HttpServletRequest request, XlsUpload excel) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
			
		List<Student2> list = student2Service.excelUpload(student, excel);
		
		result.put("studentList", list);
//			List<String> resultMsg = new ArrayList<String>();
			
//			int count = 1;
			
			/*for ( Student one : list ) {
				one.setHomepage_id(student.getHomepage_id());
				one.setGroup_idx(student.getGroup_idx());
				one.setCategory_idx(student.getCategory_idx());
				one.setTraining_idx(student.getTraining_idx());
				
				resultMsg.add(String.format("%s번째 : %s", count, studentService.addStudent(one, "CMS")));
				count += 1;
			}*/
		
		return result;
	}
	
	@RequestMapping(value = {"/excelDownloadSample.*"}, method = RequestMethod.GET)
	public void excelDownloadSample(Model model, Student2 student, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Download down = new Download( request, response, "수강생등록Sample.xls" );
		student2Service.writeExcelDataSample( down.getOutputStream() );
		down.close();
	}
	
}