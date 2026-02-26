package kr.go.gbelib.app.cms.module.adminAuthLog;

import is.tagomor.woothee.Classifier;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import kr.co.whalesoft.app.cms.memberGroupAuth.MemberGroupAuth;
import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminAuthLogService extends BaseService {

    @Autowired
    private AdminAuthLogDao dao;

    public int addAdminAuthLog(AdminAuthLog adminAuthLog, MemberGroupAuth memberGroupAuth, HttpServletRequest request) {
        Map<String, String> r = Classifier.execParse(request.getHeader("User-Agent"));

        adminAuthLog.setAdd_id(memberGroupAuth.getAdd_id());
        adminAuthLog.setOs(r.get("os") + " " + r.get("os_version"));
        adminAuthLog.setBrowser(r.get("name") + " " + r.get("version"));
        adminAuthLog.setIp(request.getRemoteAddr());
        adminAuthLog.setMember_group_idx(memberGroupAuth.getMember_group_idx());
        adminAuthLog.setSite_id(memberGroupAuth.getSite_id());

        return dao.addAdminAuthLog(adminAuthLog);
    }

    public List<AdminAuthLog> getAdminAuthLogList(AdminAuthLog adminAuthLog) {
        return dao.getAdminAuthLogList(adminAuthLog);
    }

    public int getAdminAuthLogCount(AdminAuthLog adminAuthLog) {
        return dao.getAdminAuthLogCount(adminAuthLog);
    }

    public List<AdminAuthLog> getAdminAuthLogList_excel(AdminAuthLog adminAuthLog) {
        return dao.getAdminAuthLogList_excel(adminAuthLog);
    }

    /*
     * public int addAdminAuthLog(AdminAuthLog adminAuthLog, Student student,
     * HttpServletRequest request) {
     *
     * Map<String, String> r =
     * Classifier.execParse(request.getHeader("User-Agent"));
     *
     *
     * // 클라이언트 IP 확인 String ip = request.getRemoteAddr();
     *
     * adminAuthLog.setAdd_id(student.getMember_id());
     * adminAuthLog.setOs(r.get("os") + " " + r.get("os_version"));
     * adminAuthLog.setBrowser(r.get("name") + " " + r.get("version"));
     * adminAuthLog.setIp(ip); adminAuthLog.setTeach_idx(student.getTeach_idx());
     * adminAuthLog.setType("1"); return dao.addExcelDownLog(excelDownLog); }
     */
}
