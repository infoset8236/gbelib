package kr.go.gbelib.app.cms.module.trainingBelong;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.read.biff.BiffException;
import kr.go.gbelib.app.cms.module.dept.Dept;
import kr.go.gbelib.app.cms.module.dept.DeptExcelView;
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
import kr.go.gbelib.app.cms.module.trainingTeacher.TrainingTeacher;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;

@Controller
@RequestMapping(value = {"/cms/module/trainingBelong"})
public class TrainingBelongController extends BaseController {

	private final String basePath = "/cms/module/trainingBelong/";

	@Autowired
	private TrainingBelongService service;
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, TrainingBelong trainingBelong, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		trainingBelong.setHomepage_id(getAsideHomepageId(request));	
		int count = service.getTraingBelongListCount(trainingBelong);
		service.setPaging(model, count, trainingBelong);
		trainingBelong.setTotalDataCount(count);
		model.addAttribute("trainingBelong", trainingBelong);
		model.addAttribute("trainingBelongListCount", count);
		model.addAttribute("trainingBelongList", service.getTrainingBelongList(trainingBelong));
		
		return basePath + "index";
	}
	
	@RequestMapping(value = {"/edit.*"})
	public String edit(Model model, TrainingBelong trainingBelong, HttpServletRequest request) throws AuthException {
		if(trainingBelong.getEditMode().equals("MODIFY")) {
			checkAuth("U", model, request);
			model.addAttribute("trainingBelong", service.copyObjectPaging(trainingBelong, service.getTrainingBelongOne(trainingBelong)));
		} else {
			checkAuth("C", model, request);
			model.addAttribute("trainingBelong", trainingBelong);
		}
		return basePath + "edit_ajax";
	}
	
	@RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Model model, TrainingBelong trainingBelong, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		trainingBelong.setHomepage_id(getAsideHomepageId(request));
		trainingBelong.setAdd_id(getSessionMemberId(request));
		
		
		if ( trainingBelong.getEditMode().equals("ADD") || trainingBelong.getEditMode().equals("MODIFY") ) {
			ValidationUtils.rejectIfEmpty(result, "belong_name", "기관명을 입력하세요.");				
		}
		
		if(!result.hasErrors()) {
			if(trainingBelong.getEditMode().equals("ADD")) {
				if (service.checkSameTrainingBelong(trainingBelong) > 0) {
						res.setValid(false);
						res.setMessage("이미 등록된 기관입니다.");
					
				}else {
					service.addTrainingBelong(trainingBelong);
					res.setValid(true);
					res.setMessage("등록 되었습니다.");
				}
			} else if(trainingBelong.getEditMode().equals("MODIFY")) {
				trainingBelong.setMod_id(getSessionMemberId(request));
				service.modifyTrainingBelong(trainingBelong);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			} else if(trainingBelong.getEditMode().equals("DELETE")) {
				service.deleteTrainingBelong(trainingBelong);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	@RequestMapping (value = { "/excelUploadSave.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse excelUploadSave(TrainingBelong trainingBelong, MultipartHttpServletRequest request, HttpServletResponse response) throws BiffException, IOException {
		JsonResponse res = new JsonResponse(request);
		MultipartFile mfile = request.getFile("mfile");
		trainingBelong.setAdd_id(getSessionMemberId(request));

		if(mfile != null) {
			String fileType = mfile.getOriginalFilename().substring(mfile.getOriginalFilename().lastIndexOf(".")+1).toUpperCase();

			if(fileType.equals("XLS")) {
				int successCount = service.excelUploadSave(request.getFile("mfile"),trainingBelong);

				if(successCount > 0 && successCount != 2) {
					res.setValid(true);
					res.setMessage("저장되었습니다.");
				} else if(successCount == 2) {
					res.setValid(false);
					res.setMessage("중복되는 INDEX가 있습니다.\n중복되는 엑셀에서 중복되는 아이디를 삭제해주세요.");
				} else {
					res.setValid(false);
					res.setMessage("엑셀파일 저장 실패하였습니다.\n관리자에게 문의해 주세요.");
				}
			} else {
				res.setValid(false);
				res.setMessage(".xls 확장자를 가진 파일만 등록할 수 있습니다. \n(Excel 97 - 2003 통합 문서)");
			}
		} else {
			res.setValid(false);
			res.setMessage("파일을 선택해주세요.");
		}

		return res;
	}

	@RequestMapping (value = {"/excelDownload.*"}, method = RequestMethod.GET)
	public TrainingBelongExcelView excelUploadIndex(Model model, HttpServletRequest request) {
		return new TrainingBelongExcelView();
	}

	@RequestMapping (value = {"/deleteAll.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse deleteAll(TrainingBelong trainingBelong, BindingResult result, Model model, HttpServletRequest request) {
		trainingBelong.setHomepage_id(getAsideHomepageId(request));

		JsonResponse res = new JsonResponse(request);

		if (!result.hasErrors()) {
			service.deleteAlltrainingBelong(trainingBelong);
			res.setValid(true);
			res.setMessage("삭제되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;

	}

	@RequestMapping (value = {"/deleteEvery.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse deleteEvery(TrainingBelong trainingBelong, BindingResult result, Model model, HttpServletRequest request) {
		trainingBelong.setHomepage_id(getAsideHomepageId(request));

		JsonResponse res = new JsonResponse(request);

		if (!result.hasErrors()) {
			service.deleteEvery(trainingBelong);
			res.setValid(true);
			res.setMessage("삭제되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;

	}
}