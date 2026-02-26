package kr.go.gbelib.app.cms.module.dept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.read.biff.BiffException;
import org.apache.commons.lang.StringUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;

@Controller
@RequestMapping(value={"/cms/module/dept"})
public class DeptController extends BaseController{
	
	private final String basePath = "/cms/module/dept/";
	
	@Autowired
	private DeptService service;
	
	@RequestMapping (value = { "/index.*" }, method = RequestMethod.GET)
	public String index(Model model, Dept dept, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		service.setPaging(model, service.getDeptCount(dept), dept);
		model.addAttribute("deptList", service.getDept(dept));
		model.addAttribute("dept", dept);
		return basePath + "index";
	}
	
	@RequestMapping (value = { "/edit.*" }, method = RequestMethod.GET)
	public String edit(Model model, Dept dept, HttpServletRequest request) throws AuthException {
		if(dept.getEditMode().equals("MODIFY")) {
			checkAuth("U", model, request);
			
			Dept deptOne = (Dept) service.copyObjectPaging(dept, service.getDeptOne(dept));
			deptOne.setEditMode(dept.getEditMode());
			
			model.addAttribute("dept", deptOne);
		} else {
			checkAuth("C", model, request);
			model.addAttribute("dept", dept);
		}
		return basePath + "edit_ajax";
	}
	
	@RequestMapping(value = {"/codeCheck.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse codeCheck(Dept dept, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		
		if ("Y".equals(service.validCodeId(dept))) {
			res.setValid(true);
		} else {
			res.setValid(false);
		}
		
		return res;
	}
	
	
	@RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Dept dept, BindingResult result, HttpServletRequest request) {
		
		JsonResponse res = new JsonResponse(request);
		
		if ("ADD".equals(dept.getEditMode()) && "N".equals(dept.getCode_check())) {
			result.rejectValue("code_id", "조직코드 중복확인을 진행해주세요.");
		}
		
		ValidationUtils.rejectIfEmpty(result, "code_name", "조직명을 입력하세요.");
		ValidationUtils.rejectIfEmpty(result, "group_name", "관할조직명을 입력하세요.");
		ValidationUtils.rejectIfEmpty(result, "zipcode", "우편번호를 입력하세요.");
		// 제가 이거 넣고 싶었는데.... DB에 zipcode 뒤에 공백을 넣어두어서... 바꿀용기가 없어서... 일단 주석했습니다.
//		ValidationUtils.rejectExceptNumber(result, "zipcode", "우편번호는 숫자만 입력하세요.");
		ValidationUtils.rejectIfEmpty(result, "address", "상세주소를 입력하세요.");
		if (StringUtils.isNotEmpty(dept.getManager_phone())) {
			ValidationUtils.rejectPhone(result, "manager_phone", "담당자 휴대폰번호의 형식을 확인해주세요. ex) 01x-xxxx-xxxx");
		}
		ValidationUtils.rejectIfEmpty(result, "use_yn", "사용여부을 선택하세요.");
			
		
		if(!result.hasErrors()) {
			if (dept.getEditMode().equals("ADD")) {
				service.addDept(dept);
				res.setValid(true);
				res.setMessage("등록 되었습니다.");
			} else if (dept.getEditMode().equals("MODIFY")) {
				service.updateDept(dept);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}			
		return res;
	}

	@RequestMapping (value = { "/excelUploadSave.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse excelUploadSave(Dept dept, MultipartHttpServletRequest request, HttpServletResponse response) throws BiffException, IOException {
		JsonResponse res = new JsonResponse(request);
		MultipartFile mfile = request.getFile("mfile");

		if(mfile != null) {
			String fileType = mfile.getOriginalFilename().substring(mfile.getOriginalFilename().lastIndexOf(".")+1).toUpperCase();

			if(fileType.equals("XLS")) {
				int successCount = service.excelUploadSave(request.getFile("mfile"));

				if(successCount > 0 && successCount != 2) {
					res.setValid(true);
					res.setMessage("저장되었습니다.");
				} else if(successCount == 2) {
					res.setValid(false);
					res.setMessage("중복되는 코드아이디가 있습니다.\n중복되는 엑셀에서 중복되는 아이디를 삭제해주세요.");
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
	public DeptExcelView excelUploadIndex(Model model, HttpServletRequest request) {

		return new DeptExcelView();
	}
}
