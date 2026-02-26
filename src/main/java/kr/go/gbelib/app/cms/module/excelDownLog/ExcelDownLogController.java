package kr.go.gbelib.app.cms.module.excelDownLog;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.whalesoft.app.cms.cmsAccessLog.CmsAccess;
import kr.co.whalesoft.app.cms.cmsAccessLog.CmsAccessLogService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.cms.module.teacher.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = {"/cms/module/excelDownLog", "/wbuilder/memberDownLog", "/wbuilder/excelDownLog"})
public class ExcelDownLogController extends BaseController {

    private final String basePath = "/cms/module/excelDownLog/";
    private final String wbuilderPath = "/wbuilder/memberDownLog/";

    @Autowired
    private ExcelDownLogService service;

    @RequestMapping(value = {"/index.*"})
    public String index(Model model, ExcelDownLog excelDownLog, HttpServletRequest request) {

        service.setPaging(model, service.getAllExcelDownLogCount(excelDownLog), excelDownLog);
        List<Homepage> homepageList = getSessionMemberInfo(request).getAuthorityHomepageList();
        model.addAttribute("homepageList", homepageList);
        model.addAttribute("excelDownLog", excelDownLog);
        model.addAttribute("getAllExcelDownLog", service.getAllExcelDownLog(excelDownLog));
        return returnUrl("index", request);
    }

    @RequestMapping(value = {"/excelDownLogIndex.*"})
    public String excelDownLogIndex(Model model, ExcelDownLog excelDownLog, HttpServletRequest request) {

        service.setPaging(model, service.getExcelDownLogReasonCount(excelDownLog), excelDownLog);
        List<Homepage> homepageList = getSessionMemberInfo(request).getAuthorityHomepageList();
        model.addAttribute("homepageList", homepageList);
        model.addAttribute("excelDownLog", excelDownLog);
        model.addAttribute("excelDownLogReasonList", service.getExcelDownLogReasonList(excelDownLog));

        return "/wbuilder/excelDownLog/excelDownLogIndex";
    }

    @RequestMapping(value = {"/excelDownload.*"}, method = RequestMethod.POST)
    public ExcelDownLogSearchView excel(Model model, ExcelDownLog excelDownLog, HttpServletRequest request, HttpServletResponse response) throws Exception {

        model.addAttribute("excelDownLog", excelDownLog);
        model.addAttribute("LogList", service.getAllExcelDownLog_excel(excelDownLog));

        return new ExcelDownLogSearchView();
    }

    private String returnUrl(String url, HttpServletRequest request) {
        if (request.getHeader("referer").toString().contains("wbuilder")) {
            return wbuilderPath + url;
        } else {
            return basePath + url;
        }
    }

    @RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
    public @ResponseBody JsonResponse save(ExcelDownLog excelDownLog, BindingResult result, HttpServletRequest request) {
        JsonResponse res = new JsonResponse(request);
        Member member = (Member) getSessionMemberInfo(request);

        if(!result.hasErrors()) {
            excelDownLog.setAdd_id(member.getMember_id());
            excelDownLog.setIp(request.getRemoteAddr());
            excelDownLog.setHomepage_id(getAsideHomepageId(request));
            excelDownLog.setType(excelDownLog.getExcel_down_type());

            service.addExcelDownLogReason(excelDownLog);

            res.setValid(true);
        } else {
            res.setValid(false);
        }

        return res;
    }

    @RequestMapping(value = {"/excelDownLogReason.*"})
    public String excelDownLogReason(Model model, ExcelDownLog excelDownLog, HttpServletRequest request) {
        model.addAttribute("excelDownLog", service.getExcelDownLogReason(excelDownLog));

        return "/wbuilder/excelDownLog/excelDownLogReason_ajax";
    }

    @RequestMapping(value = {"/excelDownloadReasonDown.*"}, method = RequestMethod.POST)
    public ExcelDownLogReasonView excelDownloadReasonDown(Model model, ExcelDownLog excelDownLog, HttpServletRequest request, HttpServletResponse response) throws Exception {

        model.addAttribute("excelDownLog", excelDownLog);
        model.addAttribute("excelDownLogReasonList", service.getExcelDownLogReasonList(excelDownLog));
        model.addAttribute("excelAllDownLogReasonList", service.getAllExcelDownLogReasonList(excelDownLog));

        return new ExcelDownLogReasonView();
    }
}
