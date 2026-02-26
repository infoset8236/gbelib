package kr.go.gbelib.app.module.mcard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.base.BaseController;

@Controller
@RequestMapping(value = {"/{homepagePath}/module/mcard"})
public class McardController extends BaseController {

	private String basePath = "/homepage/%s/module/mcard/";
	
	@RequestMapping (value = { "/pwCheck.*" }, method = RequestMethod.GET)
	public String index(Model model, Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		checkAuth("R", model, request);
		Homepage homepage = (Homepage) request.getAttribute("homepage");
		

		return String.format(basePath, homepage.getFolder()) + "pwCheck";
	}
}
