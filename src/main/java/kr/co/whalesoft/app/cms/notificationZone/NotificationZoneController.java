package kr.co.whalesoft.app.cms.notificationZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.cms.code.Code;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;

@Controller
@RequestMapping(value = {"/cms/notificationZone"}) 
public class NotificationZoneController  extends BaseController {
	
	private final String basePath = "/cms/notificationZone/";
	
	@Autowired
	private NotificationZoneService service;
	
	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, NotificationZone notificationZone, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		notificationZone.setHomepage_id(getAsideHomepageId(request));
		
		int count = service.getNotificationZoneCount(notificationZone);
		service.setPaging(model, count, notificationZone);
		model.addAttribute("notificationZone", notificationZone);
		model.addAttribute("notificationZoneList", service.getNotificationZoneList(notificationZone));
		return basePath + "index";
	}
	
	
	@RequestMapping(value = {"/edit.*"})
	public String edit(Model model, NotificationZone notificationZone, HttpServletRequest request) throws AuthException{
		if(notificationZone.getEditMode().equals("MODIFY")) {
			checkAuth("U", model, request);
			notificationZone = (NotificationZone)service.copyObjectPaging(notificationZone, service.getNotificationZoneOne(notificationZone));
		} else {
			checkAuth("C", model, request);
		}
		
		Code code = new Code();
		
		code.setGroup_id("A0001");
		code.setHomepage_id(getAsideHomepageId(request));
		
		model.addAttribute("codeList", codeService.getCodeList(code));
		model.addAttribute("notificationZone", notificationZone);
		
		return basePath + "edit_ajax";
	}
	
	@RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(Model model, NotificationZone notificationZone, BindingResult result, HttpServletRequest request) {
		notificationZone.setHomepage_id(getAsideHomepageId(request));	
		
		JsonResponse res = new JsonResponse(request);
		ValidationUtils.rejectIfEmpty(result, "notification_zone_code", "알림존종류를 선택해주세요.");
		ValidationUtils.rejectIfEmpty(result, "title", "대제목을 입력해주세요.");
		ValidationUtils.rejectIfEmpty(result, "sub_title", "중제목을 입력해주세요.");
		ValidationUtils.rejectIfEmpty(result, "start_date", "게시 시작일을 지정해주세요.");
		ValidationUtils.rejectIfEmpty(result, "end_date", "게시 종료일을 지정해주세요");
		ValidationUtils.rejectIfEmpty(result, "link_type", "링크종류을 선택해주세요");
		ValidationUtils.rejectIfEmpty(result, "link_target", "링크타겟을 선택해주세요");
		ValidationUtils.rejectIfEmpty(result, "link_url", "링크URL을 입력해주세요");
		ValidationUtils.rejectIfEmpty(result, "use_yn", "사용유무를 선택해주세요");
		
		notificationZone.setAuth_id(getSessionMemberInfo(request).getAuth_id());
		
		if(!result.hasErrors()) {
			if(notificationZone.getEditMode().equals("ADD")) {
				service.addNotificationZone(notificationZone);
				res.setValid(true);
				res.setMessage("등록 되었습니다.");
			} else if(notificationZone.getEditMode().equals("MODIFY")) {
				service.modifyNotificationZone(notificationZone);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			} else if(notificationZone.getEditMode().equals("DELETE")) {
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			}	
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
	@RequestMapping(value = {"/delete.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse delete(Model model, NotificationZone notificationZone, BindingResult result, HttpServletRequest request) {
		JsonResponse res = new JsonResponse(request);
		
		if(!result.hasErrors()) {
			service.deleteNotificationZone(notificationZone);
			res.setValid(true);
			res.setMessage("삭제 되었습니다.");	
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
}
