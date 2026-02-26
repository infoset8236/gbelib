package kr.go.gbelib.app.module.pushNotification;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;

@Controller
@RequestMapping(value = {"/{homepagePath}/module/pushNotification"})
public class PushNotificationController extends BaseController {

	private String basePath = "/homepage/%s/module/pushNotification/";
	
	@Autowired
	private PushNotificationService service;
	
	@RequestMapping(value = {"/index.*"})
	public String index(Model model, PushNotification pushNotification, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		
		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			pushNotification.setBefore_url(String.format("http://www.gbelib.kr/%s/module/pushNotification/index.do?menu_idx=%s", homepage.getContext_path(), pushNotification.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), pushNotification.getMenu_idx(), pushNotification.getBefore_url()), request, response);
			return null;
		}
		
		return String.format(basePath, homepage.getFolder()) + "index";
	}
	
	@RequestMapping(value = {"/list.*"})
	public String list(Model model, PushNotification pushNotification, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		
		if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			pushNotification.setBefore_url(String.format("http://www.gbelib.kr/%s/module/pushNotification/index.do?menu_idx=%s", homepage.getContext_path(), pushNotification.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("http://www.gbelib.kr/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), pushNotification.getMenu_idx(), pushNotification.getBefore_url()), request, response);
			return null;
		}
		
		pushNotification.setMember_id(getSessionMemberId(request));
		
		model.addAttribute("member", getSessionMemberInfo(request));
		model.addAttribute("pushNotification", pushNotification);
		model.addAttribute("pushNotificationList", service.getPushNotificationList(pushNotification));
		
		return String.format(basePath, homepage.getFolder()) + "list_ajax";
	}
	
	@RequestMapping(value = {"/add.*"})
	public @ResponseBody JsonResponse add(Model model, PushNotification pushNotification, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JsonResponse res = new JsonResponse(request);
		
		pushNotification.setMember_id(getSessionMemberId(request));
		
		if(!result.hasErrors()) {
			service.addPushNotification(pushNotification);
			res.setValid(true);
			res.setMessage("추가되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
	@RequestMapping(value = {"/delete.*"})
	public @ResponseBody JsonResponse delete(Model model, PushNotification pushNotification, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JsonResponse res = new JsonResponse(request);
		
		if(pushNotification != null) {
			pushNotification.setMember_id(getSessionMemberId(request));
		}
		
		if(!result.hasErrors()) {
			service.deletePushNotification(pushNotification);
			res.setValid(true);
			res.setUrl("list.do");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		
		return res;
	}
	
}
