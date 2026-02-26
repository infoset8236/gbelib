package kr.go.gbelib.app.cms.module.trainingBook;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.cms.code.Code;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.StrUtil;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.TrainingService;
import kr.go.gbelib.app.cms.module.training.student2.Student2;
import kr.go.gbelib.app.cms.module.training.student2.Student2Service;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategory;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategoryService;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;

@Controller
@RequestMapping(value = {"/cms/module/trainingBook"})
public class TrainingBookController extends BaseController {

	private final String basePath = "/cms/module/trainingBook/";

	@Autowired
	private TrainingService trainingService;
	
	@Autowired
	private Student2Service studentService;
	
	@Autowired
	private TrainingBookService trainingBookService;
	
	@Autowired
	private CalendarManageService calendarManageService;
	
	@Autowired
	private TrainingCategoryService categoryService;
	
	@Autowired
	private TrainingCategoryGroupService categoryGroupService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private TrainingCode2Service trainingCode2Service;
	
	@RequestMapping(value = {"/index.*"}) 
	public String index(Model model, TrainingBook trainingBook, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
//		if ( !getSessionIsAdmin(request) ) {
			trainingBook.setHomepage_id(getAsideHomepageId(request));	
//		}

		model.addAttribute("trainingBook", trainingBook);
		Training training = new Training(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx());
		training.setLarge_category_idx(trainingBook.getLarge_category_idx());
		model.addAttribute("trainingList", trainingService.getTrainingListAll(training));
		model.addAttribute("categoryGroupList", categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(trainingBook.getHomepage_id(), trainingBook.getLarge_category_idx())));
		model.addAttribute("categoryList", categoryService.getCategoryListAll(new TrainingCategory(trainingBook.getHomepage_id(), trainingBook.getLarge_category_idx())));
		
		//강좌대분류
		TrainingCode2 trainingCode2 = new TrainingCode2(1);
		trainingCode2.setTraining_code(15);
		model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));
		
		return basePath + "index";
	}
	
	@RequestMapping(value = {"/trainingBook.*"}) 
	public String trainingBook(Model model, TrainingBook trainingBook, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		Training trainingOne = trainingService.getTrainingOne(new Training(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx()));
		if (trainingBook.getSel_date() == null || trainingBook.getSel_date().equals("")) {
			if (trainingOne == null) {
				trainingBook.setSel_date(StrUtil.Todate("now").substring(0, 7));
			} else {
				trainingBook.setSel_date(trainingOne.getStart_date().substring(0, 7));
			}
		}
		List<Student2> studentList = studentService.getStudent2ListAll(new Student2(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx(), "1"));
		List<TrainingBook> trainingBookList = trainingBookService.getTrainingBookList(trainingBook);
		model.addAttribute("studentList", studentList);
		model.addAttribute("codeList", codeService.getCode("CMS", "C0008"));
		model.addAttribute("training", trainingOne);
		model.addAttribute("calendar", calendarManageService.getCalendar(new CalendarManage(trainingBook.getSel_date())));
		model.addAttribute("trainingBook", trainingBook);
		model.addAttribute("trainingBookRepo", makeTrainingBook(studentList, trainingBookList));
		
		return basePath + "trainingBook_ajax";
	}
	
	@RequestMapping(value = { "/save.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(TrainingBook trainingBook, BindingResult result, HttpServletRequest request) throws ParseException {

		/* 유효성 검증 >>>>> */
		JsonResponse res = new JsonResponse(request);
		/* <<<<< 유효성 검증 */
		String[] patternDate = {"yyyy-MM-dd"};
		Date now = new Date();
		
		if (!result.hasErrors()) {
			trainingBook.setAdd_id(getSessionMemberId(request));
			trainingBook.setMod_id(getSessionMemberId(request));
			if ( trainingBook.getEditMode().equals("ONESAVE") ) {
				if ( now.before(DateUtils.parseDate(trainingBook.getTraining_date(), patternDate)) ) {
					res.setValid(false);
					res.setMessage(String.format("해당 일자는 %s일 이후 출석체크 불가능 합니다.", trainingBook.getTraining_date()));
					return res;
				}
				if ( trainingBookService.checkTrainingBookStudentByDate(trainingBook) > 0 ) {
					if ( trainingBook.getStatus().equals("0") ) {
						trainingBookService.deleteTrainingBook(trainingBook); 
					}
					else {
						trainingBookService.modifyTrainingBook(trainingBook);	
					}
				}
				else {
					if ( !trainingBook.getStatus().equals("0") ) {
						trainingBookService.addTrainingBook(trainingBook);	
					}
				}
			}
			else if ( trainingBook.getEditMode().equals("TOPSAVE") ) {
				if ( now.before(DateUtils.parseDate(trainingBook.getTraining_date(), patternDate)) ) {
					res.setValid(false);
					res.setMessage(String.format("해당 일자는 %s일 이후 출석체크 불가능 합니다.", trainingBook.getTraining_date()));
					return res;
				}
				
				List<Student2> studentList = studentService.getStudent2ListAll(new Student2(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx(), "1"));
				
				for ( Student2 oneStudent : studentList ) {
					trainingBook.setStudent_idx(oneStudent.getStudent_idx());
					trainingBook.setStatus("1");
					trainingBookService.mergeTrainingBook(trainingBook);
				}
			}
			else if (trainingBook.getEditMode().equals("LEFTSAVE") ) {
				String[] pattern = {"yyyy-MM"};
				Calendar cal = Calendar.getInstance();
				cal.setTime(DateUtils.parseDate(trainingBook.getSel_date(), pattern));
				int lastDay = cal.getActualMaximum(Calendar.DATE);
				
				for ( int i = 1; i <= lastDay; i ++ ) { 
					String trainingDate = i < 10 ? trainingBook.getSel_date() + "-0" + i : trainingBook.getSel_date() + "-" + i;
					if ( DateUtils.parseDate(trainingDate, patternDate).before(now) ) {
						trainingBook.setTraining_date(trainingDate);
						trainingBook.setStatus("1");
						trainingBookService.mergeTrainingBook(trainingBook);	
					}
				}
			}
			else if ( trainingBook.getEditMode().equals("PAYSAVE") ) {
				trainingBookService.modifyStudentPay(trainingBook);
			}
			
			res.setValid(true);
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}
	
	@RequestMapping(value = { "/view.*" }, method = RequestMethod.GET)
	public String view(Model model, TrainingBook trainingBook, HttpServletRequest request) {
		model.addAttribute("trainingBook", trainingBook);
		model.addAttribute("trainingBookInfo", trainingBookService.getTrainingBookViewInfo(trainingBook));
		
		return basePath + "view_ajax";
	}
	
	@RequestMapping(value = { "/excelDownload.*" }, method = RequestMethod.GET)
	public TrainingBookSearchView excel(Model model, TrainingBook trainingBook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Training trainingOne = trainingService.getTrainingOne(new Training(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx()));
		if (trainingBook.getSel_date() == null || trainingBook.getSel_date().equals("")) {
			if (trainingOne == null) {
				trainingBook.setSel_date(StrUtil.Todate("now").substring(0, 7));
			} else {
				trainingBook.setSel_date(trainingOne.getStart_date().substring(0, 7));
			}
		}
		List<Student2> studentList = studentService.getStudent2ListAll(new Student2(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx(), "1"));
		List<TrainingBook> trainingBookList = trainingBookService.getTrainingBookList(trainingBook);
		model.addAttribute("studentList", studentList);
		model.addAttribute("codeList", codeService.getCode("CMS", "C0008"));
		model.addAttribute("training", trainingOne);
		model.addAttribute("calendar", calendarManageService.getCalendar(new CalendarManage(trainingBook.getSel_date())));
		model.addAttribute("trainingBook", trainingBook);
		model.addAttribute("trainingBookRepo", makeTrainingBook(studentList, trainingBookList));
		return new TrainingBookSearchView();
	}
	
	@RequestMapping(value = {"/csvDownload.*"}, method = RequestMethod.GET)
	public void csv(Model model, TrainingBook trainingBook, HttpServletRequest request, HttpServletResponse response) {
		Training trainingOne = trainingService.getTrainingOne(new Training(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx()));
		if (trainingBook.getSel_date() == null || trainingBook.getSel_date().equals("")) {
			if (trainingOne == null) {
				trainingBook.setSel_date(StrUtil.Todate("now").substring(0, 7));
			} else {
				trainingBook.setSel_date(trainingOne.getStart_date().substring(0, 7));
			}
		}
		List<Student2> studentList = studentService.getStudent2ListAll(new Student2(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx(), "1"));
		List<TrainingBook> trainingBookList = trainingBookService.getTrainingBookList(trainingBook);
		List<Code> codeList = codeService.getCode("CMS", "C0008");
		List<CalendarManage> calendar = calendarManageService.getCalendar(new CalendarManage(trainingBook.getSel_date()));
		Map<Integer, Map<String, String>> trainingBookRepo = makeTrainingBook(studentList, trainingBookList);

		new TrainingBookXlsToCsv(studentList, codeList, trainingOne, calendar, trainingBook, trainingBookRepo, "TrainingBook.csv", request, response);
	}
	
	private Map<Integer, Map<String, String>> makeTrainingBook(List<Student2> studentList, List<TrainingBook> trainingBookList) {
		Map<Integer, Map<String, String>> trainingBookStatusRepo = new HashMap<Integer, Map<String, String>>();
		
		// 학생별 Map<String,String> 만든다.
		for ( TrainingBook oneTrainingBook : trainingBookList ) {
			int studentIdx = oneTrainingBook.getStudent_idx();
			String trainingDate = oneTrainingBook.getTraining_date();
			Map<String, String> trainingBookByStudent = null;
			
			if ( trainingBookStatusRepo.containsKey(studentIdx) ) {
				trainingBookByStudent = trainingBookStatusRepo.get(studentIdx);
			}
			else {
				trainingBookByStudent = new HashMap<String, String>();
			}
			
			trainingBookByStudent.put(trainingDate, oneTrainingBook.getStatus());
			trainingBookStatusRepo.put(studentIdx, trainingBookByStudent);
		}
		
		return trainingBookStatusRepo;
	}
}