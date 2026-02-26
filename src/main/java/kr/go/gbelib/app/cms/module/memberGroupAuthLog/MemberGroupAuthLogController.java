package kr.go.gbelib.app.cms.module.memberGroupAuthLog;

import kr.co.whalesoft.app.cms.memberGroup.MemberGroupService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.go.gbelib.app.cms.module.schoolSupport.SchoolSupportSearchView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping(value = {"/cms/groupAuthLog","/wbuilder/groupAuthLog"})
public class MemberGroupAuthLogController extends BaseController {

    private final String basePath = "/cms/groupAuthLog/";
    private final String wbuilderPath = "/wbuilder/groupAuthLog/";

    @Autowired
    private MemberGroupAuthLogService service;

    @Autowired
    private MemberGroupService memberGroupService;

    @RequestMapping(value = {"/index.*"})
    public String index(Model model, MemberGroupAuthLog memberGroupAuthLog, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);
        memberGroupAuthLog.setHomepage_id(getAsideHomepageId(request));

        int count = service.getMemberGroupAuthLogCount(memberGroupAuthLog);

        service.setPaging(model, count, memberGroupAuthLog);

        List<MemberGroupAuthLog> memberGroupAuthLogList = service.getMemberGroupAuthLogList(memberGroupAuthLog);

        for (MemberGroupAuthLog groupAuthLog : memberGroupAuthLogList) {
            groupAuthLog.getAuthGroupIdxList();

            Set<String> oldSet = new HashSet<String>();
            Set<String> newSet = new HashSet<String>();

            if (groupAuthLog.getAuthGroupIdxList() != null && groupAuthLog.getAuthGroupIdxList().length() > 0) {
                oldSet.addAll(Arrays.asList(groupAuthLog.getAuthGroupIdxList().split(",")));
            }

            if (groupAuthLog.getAuthGroupIdxModList() != null && groupAuthLog.getAuthGroupIdxModList().length() > 0) {
                newSet.addAll(Arrays.asList(groupAuthLog.getAuthGroupIdxModList().split(",")));
            }


            Set<String> added = new HashSet<String>();
            for (String value : newSet) {
                if (!oldSet.contains(value)) {
                    added.add(value);
                }
            }

            Set<String> removed = new HashSet<String>();
            for (String value : oldSet) {
                if (!newSet.contains(value)) {
                    removed.add(value);
                }
            }

            String add_auth = memberGroupService.getMemberGroupAuth(convertSetToString(added));
            String removed_auth = memberGroupService.getMemberGroupAuth(convertSetToString(removed));

            groupAuthLog.setAdded_auth(add_auth);
            groupAuthLog.setRemoved_auth(removed_auth);
        }

        model.addAttribute("memberGroupAuthLogList", memberGroupAuthLogList);
        model.addAttribute("memberGroupAuthLogCount", count);

        return returnUrl("index", request);
    }

    @RequestMapping(value = {"/excelDownload.*"}, method = RequestMethod.POST)
    public ExcelView excelDownload(Model model, MemberGroupAuthLog memberGroupAuthLog, HttpServletRequest request) throws AuthException {
        List<MemberGroupAuthLog> memberGroupAuthLogList = service.getMemberGroupAuthLogListExcel(memberGroupAuthLog);

        for (MemberGroupAuthLog groupAuthLog : memberGroupAuthLogList) {
            groupAuthLog.getAuthGroupIdxList();

            Set<String> oldSet = new HashSet<String>();
            Set<String> newSet = new HashSet<String>();

            if (groupAuthLog.getAuthGroupIdxList() != null && groupAuthLog.getAuthGroupIdxList().length() > 0) {
                oldSet.addAll(Arrays.asList(groupAuthLog.getAuthGroupIdxList().split(",")));
            }

            if (groupAuthLog.getAuthGroupIdxModList() != null && groupAuthLog.getAuthGroupIdxModList().length() > 0) {
                newSet.addAll(Arrays.asList(groupAuthLog.getAuthGroupIdxModList().split(",")));
            }

            Set<String> added = new HashSet<String>();
            for (String value : newSet) {
                if (!oldSet.contains(value)) {
                    added.add(value);
                }
            }

            Set<String> removed = new HashSet<String>();
            for (String value : oldSet) {
                if (!newSet.contains(value)) {
                    removed.add(value);
                }
            }

            String add_auth = memberGroupService.getMemberGroupAuth(convertSetToString(added));
            String removed_auth = memberGroupService.getMemberGroupAuth(convertSetToString(removed));

            groupAuthLog.setAdded_auth(add_auth);
            groupAuthLog.setRemoved_auth(removed_auth);
        }

        model.addAttribute("memberGroupAuthLogList", memberGroupAuthLogList);

        return new ExcelView();
    }

    private static String convertSetToString(Set<String> set) {
        StringBuilder sb = new StringBuilder();
        for (String value : set) {
            if (sb.length() > 0) {
                sb.append(", ");
            }
            sb.append(value);
        }
        return sb.toString();
    }

    private String returnUrl(String url, HttpServletRequest request) {
        if (request.getHeader("referer").toString().contains("wbuilder")) {
            return wbuilderPath + url;
        } else {
            return basePath + url;
        }
    }
}
