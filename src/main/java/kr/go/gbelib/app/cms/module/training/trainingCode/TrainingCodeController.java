package kr.go.gbelib.app.cms.module.training.trainingCode;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;

@Controller
@RequestMapping(value = {"/cms/module/training/trainingCode"})
public class TrainingCodeController extends BaseController {

	private final String basePath = "/cms/module/training/trainingCode/";
	
	@Autowired
	private TrainingCodeService service;
	
	@RequestMapping (value = { "/index.*" }, method = RequestMethod.GET)
	public String index(Model model, TrainingCode trainingCode, HttpServletRequest request) {
		model.addAttribute("trainingCode", trainingCode);
		model.addAttribute("largeCodeList", service.getLargeCodeList());
		return basePath + "index";
	}
	
	@RequestMapping (value = { "/getMidCodeList.*" }, method = RequestMethod.GET)
	public @ResponseBody List<TrainingCode> getMidCodeList(TrainingCode trainingCode, HttpServletRequest request) {
		return service.getMidCodeList(trainingCode);
	}
	
	@RequestMapping (value = { "/getSmallCodeList.*" }, method = RequestMethod.GET)
	public @ResponseBody List<TrainingCode> getSmallCodeList(TrainingCode trainingCode, HttpServletRequest request) {
		return service.getSmallCodeList(trainingCode);
	}
	
	@RequestMapping (value = { "/save.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(TrainingCode trainingCode, BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse(request);

		if ( !result.hasErrors() ) {
			trainingCode.setCud_id(getSessionMemberId(request));
			int dupCheck = service.getCodeInfo(trainingCode);
			if (trainingCode.getEditMode().equals("ADD")) {
				if (dupCheck > 0) {
					res.setMessage("이미 존재하는 분류코드입니다.");
					res.setValid(false);
				} else {
					service.addTrainingCode(trainingCode);
					res.setMessage("등록되었습니다.");
					res.setValid(true);
					res.setData(trainingCode);
				}
			} else if (trainingCode.getEditMode().equals("MODIFY")) {
				if (dupCheck > 0) {
					res.setMessage("이미 존재하는 분류코드입니다.");
					res.setValid(false);
				} else {
					service.modifyTrainingCode(trainingCode);
					res.setMessage("수정되었습니다.");
					res.setValid(true);
					res.setData(trainingCode);
				}
			} else if (trainingCode.getEditMode().equals("DELETE")) {
				service.deleteTrainingCode(trainingCode);
				res.setMessage("삭제되었습니다.");
				res.setValid(true);
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}
	
	@RequestMapping(value = {"/saveList.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse saveList(Model model, @RequestBody TrainingCode[] codeList, HttpServletRequest request) {
		
		JsonResponse res = new JsonResponse(request);
		
		if(codeList == null || codeList.length == 0) {
			res.setValid(false);
			res.setMessage("저장할 분류가 없습니다.");
		} else {
			service.saveCodeList(codeList, getSessionMemberId(request));
			res.setValid(true);
			res.setMessage("저장되었습니다.");
		}
		
		return res;
	}
}
