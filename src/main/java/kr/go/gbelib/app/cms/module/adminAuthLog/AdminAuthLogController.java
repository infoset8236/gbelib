package kr.go.gbelib.app.cms.module.adminAuthLog;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.framework.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"/cms/module/adminAuthLog", "/wbuilder/memberAuthLog"})
public class AdminAuthLogController extends BaseController {

    private final String basePath = "/cms/module/adminAuthLog/";
    private final String wbuilderPath = "/wbuilder/memberAuthLog/";

    @Autowired
    private AdminAuthLogService service;


    @RequestMapping(value = {"/index.*"})
    public String index(Model model, AdminAuthLog adminAuthLog, HttpServletRequest request) {

        service.setPaging(model, service.getAdminAuthLogCount(adminAuthLog), adminAuthLog);
        List<Homepage> homepageList = getSessionMemberInfo(request).getAuthorityHomepageList();
        model.addAttribute("homepageList", homepageList);
        model.addAttribute("adminAuthLog", adminAuthLog);
        model.addAttribute("getAdminAuthLogList", service.getAdminAuthLogList(adminAuthLog));
        return returnUrl("index", request);
    }


    @RequestMapping(value = {"/excelDownload.*"}, method = RequestMethod.POST)
    public AdminAuthLogSearchView excel(Model model, AdminAuthLog adminAuthLog, HttpServletRequest request, HttpServletResponse response) throws Exception {

        model.addAttribute("adminAuthLog", adminAuthLog);
        model.addAttribute("LogList", service.getAdminAuthLogList_excel(adminAuthLog));

        return new AdminAuthLogSearchView();
    }


    private String returnUrl(String url, HttpServletRequest request) {
        if (request.getHeader("referer").toString().contains("wbuilder")) {
            return wbuilderPath + url;
        } else {
            return basePath + url;
        }
    }
}


