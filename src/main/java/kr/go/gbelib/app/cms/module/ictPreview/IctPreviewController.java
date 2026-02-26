package kr.go.gbelib.app.cms.module.ictPreview;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = {"/cms/module/ictPreview"})
public class IctPreviewController extends BaseController {
    private final String basePath = "/cms/module/ictPreview/";

    /*@RequestMapping(value = { "/index.*" })
    public String index(Model model, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);

        Homepage homepage = getSessionHomepageInfo(request);

        model.addAttribute("homepage", homepage);

        return basePath + "index";
    }*/

    @RequestMapping(value = { "/{page}.*" })
    public String page(@PathVariable String page, Model model, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);

        Homepage homepage = getSessionHomepageInfo(request);

        model.addAttribute("homepage", homepage);

        return basePath + page;
    }
}
