package kr.go.gbelib.app.module.training;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.app.cms.site.Site;
import kr.co.whalesoft.app.cms.site.SiteService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.cms.module.category.Category;
import kr.go.gbelib.app.cms.module.category.group.CategoryGroup;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.TrainingService;
import kr.go.gbelib.app.cms.module.training.student2.Student2Service;
import kr.go.gbelib.app.cms.module.training.trainingCode.TrainingCodeService;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategory;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategoryService;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;

@Controller(value="userTraining")
@RequestMapping(value = {"/{homepagePath}/module/training"})
public class TrainingController extends BaseController{

	private String basePath = "/homepage/%s/module/training/";
	
	@Autowired
	private TrainingService trainingService;

	@Autowired
	private TrainingCategoryService categoryService;

	@Autowired
	private TrainingCategoryGroupService categoryGroupService;
	
	@Autowired
	private SiteService siteService;
	
	@Autowired
	private Student2Service studentService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private TrainingCodeService trainingCodeService;
	
	@Autowired
	private TrainingCode2Service trainingCode2Service;
	
	@ModelAttribute("siteList")
	public List<Site> getAreaCdList(HttpServletRequest request) {
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		return siteService.getSiteListAll(new Site(homepage.getHomepage_id()));
	}
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, Training training, HttpServletRequest request, HttpServletResponse response) throws AuthException {
		checkAuth("R", model, request, "소속도서관에서 신청하시기 바랍니다.");
		
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		if ( isLogin(request) && getSessionMemberLoginType(request).equals("HOMEPAGE") ) {
			training.setMember_key(getSessionUserSeqNo(request));
		}
		
		if ( homepage.getHomepage_id().equals("h1") ) {
			if (StringUtils.isEmpty(training.getHomepage_id())) {
				training.setHomepage_id(homepage.getHomepage_id());
			}
			if (training.getProgram_age_div_arr() != null && training.getProgram_age_div_arr().size() > 0) {
				training.setProgram_age_div(StringUtils.join(training.getProgram_age_div_arr(), "|"));
			}
			trainingService.setPaging(model, trainingService.getTrainingListForAllHomepageCount(training), training);
			model.addAttribute("trainingList", trainingService.getTrainingListForAllHomepage(training));
			model.addAttribute("training", training);
			if (!training.getHomepage_id().equals("h1")) {
				model.addAttribute("groupList", categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(training.getHomepage_id())));
				model.addAttribute("categoryList", categoryService.getCategoryListAll(new TrainingCategory(training.getHomepage_id(), training.getGroup_idx())));
			}
			
			//프로그램 주제구분
			TrainingCode2 trainingCode2 = new TrainingCode2(1);
			model.addAttribute("trainingSubjectCodeList", trainingCode2Service.getSubcategories(trainingCode2));
			
			//프로그램 연령구분
			trainingCode2.setTraining_code(8);
			model.addAttribute("trainingAgeDivCodeList", trainingCode2Service.getSubcategories(trainingCode2));

			//연수대분류
			trainingCode2.setTraining_code(15);
			model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));
			return String.format(basePath, homepage.getFolder()) + "index_all";
		}
		else {
			training.setHomepage_id(homepage.getHomepage_id());
			model.addAttribute("training", training);
			model.addAttribute("trainingList", trainingService.getTrainingListForUser(training));
			model.addAttribute("myTrainingListMenuIdx", menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 184)));
			model.addAttribute("categoryList", categoryService.getCategoryListAll(new TrainingCategory(homepage.getHomepage_id())));
			return String.format(basePath, homepage.getFolder()) + "index";
		}
	}
	
	@RequestMapping(value = {"/edit.*"})
	public String edit(Model model, Training training, HttpServletRequest request) throws AuthException {
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		
		String calendarPath = "/homepage/" + homepage.getFolder() + "/module/calendarManage/"; 
		
		training.setHomepage_id(homepage.getHomepage_id());
		if ( training.getEditMode().equals("MODIFY") ) {
			checkAuth("U", model, request, "소속도서관에서 신청하시기 바랍니다.");
			int menu_idx = training.getMenu_idx();
			training = trainingService.getTrainingOne(training);
			training.setMenu_idx(menu_idx);
			model.addAttribute("training", training);
		} else {
			checkAuth("C", model, request, "소속도서관에서 신청하시기 바랍니다.");
			model.addAttribute("training", training);
		}	
				
		return calendarPath + "trainingEdit";
	}
	
	@RequestMapping(value = {"/detail.*"})
	public String detail(Model model, Training training, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		if ( isLogin(request) && getSessionMemberLoginType(request).equals("HOMEPAGE") ) {
			training.setMember_key(getSessionUserSeqNo(request));
		}
		
		if ( !"h1".equals(homepage.getHomepage_id()) ) {
			training.setHomepage_id(homepage.getHomepage_id());
		}
		
		int menu_idx = training.getMenu_idx();
		int large_category_idx = training.getLarge_category_idx();
		
		training = trainingService.getTrainingDetailForUser(training);
		if ( training == null ) {
			trainingService.alertMessage("해당 연수 정보가 없습니다.", request, response);
			return null;
		}
		training.setMenu_idx(menu_idx);
		training.setLarge_category_idx(large_category_idx);
		
		model.addAttribute("training", training);
		model.addAttribute("myTrainingListMenuIdx", menuService.getMenuIdxByProgramIdx(new Menu(homepage.getHomepage_id(), 184)));
		
		return String.format(basePath, homepage.getFolder()) + "detail";
	}
	
	@RequestMapping(value = {"/applyList.*"})
	public String applyList(Model model, Training training, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		
		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			training.setBefore_url(String.format("http://www.gbelib.kr/%s/module/training/applyList.do?menu_idx=%s", homepage.getContext_path(), training.getMenu_idx()));
			trainingService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), training.getMenu_idx(), training.getBefore_url()), request, response);
			return null;
		}
		
		training.setHomepage_id(homepage.getHomepage_id());
		if (isLogin(request)) {
			training.setMember_key(getSessionUserSeqNo(request));
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (StringUtils.isEmpty(training.getSearchDateFrom())) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -1);
			training.setSearchDateFrom(sdf.format(cal.getTime()));
		}
		if (StringUtils.isEmpty(training.getSearchDateTo())) {
			training.setSearchDateTo(sdf.format(new Date()));
		}
		
		model.addAttribute("statusCode", codeService.getCode("CMS", "C0005"));
		
		if (training.getSearchStatus().equals("Y")) {
			model.addAttribute("trainingList", trainingService.getApplyList(training));
		} else {
			model.addAttribute("trainingList", studentService.getCertificateListByDate(training));
		}

		return String.format(basePath, homepage.getFolder()) + "applyList";
	}
	
	@RequestMapping(value = "/download/{homepage_id}/{group_idx}/{category_idx}/{training_idx}.*", method = RequestMethod.GET)
	@ResponseBody
    public ResponseEntity<byte[]> getFile(@PathVariable("homepage_id") String homepage_id, @PathVariable("group_idx") int group_idx, @PathVariable("category_idx") int category_idx, @PathVariable("training_idx") int training_idx, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Training training = trainingService.getTrainingOne(new Training(homepage_id, group_idx, category_idx, training_idx));
		HttpHeaders responseHeaders = new HttpHeaders();
		byte[] bytes = null;

		if(training == null) {
			responseHeaders.setContentType(MediaType.valueOf("text/html"));
			trainingService.alertMessage("파일이 존재하지 않습니다.", request, response);
			return null;
		}
		
		String filePath = trainingService.getRootPath()+ "/" + homepage_id + "/" + training.getReal_file_name();
		File file = new File(filePath);
		
//		if(file.length() > 0) {
//			bytes = FileCopyUtils.copyToByteArray(file);
//		} else {
//			responseHeaders.setHeader("Content-type", "text/html");
//			trainingService.alertMessage("파일이 존재하지 않습니다.", request, responseHeaders);
//			return null;
//		}
		
		if(file.length() > 0) {
			bytes = FileCopyUtils.copyToByteArray(file);
		} else {
			responseHeaders.setContentType(MediaType.valueOf("text/html"));
			trainingService.alertMessage("파일이 존재하지 않습니다.", request, response);
			return null;
		}
		
//		String fileName = "";
		String fileName = String.format("%s.%s", training.getPlan_file_name(),training.getFile_extension() );
//		String fileName = boardFile.getFile_name().substring(0,boardFile.getFile_name().lastIndexOf("."));
		String fileType = training.getFile_extension().toUpperCase();
//		String fullFilename = fileName+"."+fileType;
		
//		response.setHeader("Content-Length", Long.toString(file.length()));
//	    response.setHeader("Content-Transfer-Encoding", "binary");
//	    response.setHeader("Content-Type", "application/octet-stream");
//	    response.setHeader("Content-Disposition", "attachment;fileName=\"" + fileName + "\";");
	    
		responseHeaders.set("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
		responseHeaders.setPragma("no-cache;");
		responseHeaders.setExpires(-1);
//		responseHeaders.setContentLength(file.length());
		responseHeaders.setContentType(MediaType.valueOf(AttachmentUtils.getContentType(fileType)));
		responseHeaders.setContentLength(bytes.length);
		
	    return new ResponseEntity<byte[]>(bytes, responseHeaders, HttpStatus.OK);
    }
	
	@RequestMapping(value = {"/excelDownload.*"})
	public TrainingApplySearchView excelDownload(Model model, Training training, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		
		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			training.setBefore_url(String.format("http://www.gbelib.kr/%s/module/training/applyList.do?menu_idx=%s", homepage.getContext_path(), training.getMenu_idx()));
			trainingService.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), training.getMenu_idx(), training.getBefore_url()), request, response);
			return null;
		}
		
		training.setHomepage_id(homepage.getHomepage_id());
		training.setMember_key(getSessionUserSeqNo(request));
		
		model.addAttribute("trainingList", trainingService.getApplyList(training));

		return new TrainingApplySearchView();
	}
	
	@RequestMapping (value = { "/getGroupList.*" })
	public @ResponseBody JsonResponse getGroupList(Training training, BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse(request);

		if ( !result.hasErrors() ) {
			res.setData(categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(training.getHomepage_id())));
		}
		else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}
	
	@RequestMapping (value = { "/getCategoryList.*" })
	public @ResponseBody JsonResponse getCategoryList(Training training, BindingResult result, HttpServletRequest request) {
		
		JsonResponse res = new JsonResponse(request);
		
		if ( !result.hasErrors() ) {
			res.setData(categoryService.getCategoryListAll(new TrainingCategory(training.getHomepage_id(), training.getGroup_idx())));
		}
		else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
}
