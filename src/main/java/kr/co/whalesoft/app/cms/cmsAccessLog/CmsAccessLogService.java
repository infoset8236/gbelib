package kr.co.whalesoft.app.cms.cmsAccessLog;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.base.BaseService;

import org.apache.commons.lang3.StringUtils;
import java.util.Base64;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CmsAccessLogService extends BaseService {

    @Autowired
    private CmsAccessLogDao dao;

    public int addAccessLog(Member worker, Member member, String menu_id, String access_type, HttpServletRequest request) {
        CmsAccess cmsAccess = new CmsAccess(worker, menu_id, access_type);

        if (!StringUtils.equals(access_type, "L")) {
            String encoded = Base64.getEncoder().encodeToString(member.toString().getBytes(StandardCharsets.UTF_8));
            cmsAccess.setAccess_log(encoded);
        }

        cmsAccess.setAccess_ip(request.getRemoteAddr());
        cmsAccess.setAccess_type(access_type);
        cmsAccess.setSite_id(String.valueOf(request.getSession().getAttribute("asideHomepageId")));

        return dao.addAccessLog(cmsAccess);
    }

    public List<CmsAccess> getAccessLogList(CmsAccess cmsAccess) {
        List<CmsAccess> list = dao.getAccessLogList(cmsAccess);

        if (list == null) return null;

        for (CmsAccess ca : list) {
            try {
                if (ca.getAccess_log() != null) {
                    byte[] decoded = Base64.getDecoder().decode(ca.getAccess_log());
                    ca.setAccess_log(new String(decoded, StandardCharsets.UTF_8));
                }
            } catch (IllegalArgumentException e) {
                // Base64 decode 실패
                e.printStackTrace();
            }
        }

        return list;
    }

    public List<CmsAccess> getAllAccessLogList(CmsAccess cmsAccess) {
        List<CmsAccess> list = dao.getAllAccessLogList(cmsAccess);

        if (list == null) return null;

        for (CmsAccess ca : list) {
            try {
                if (ca.getAccess_log() != null) {
                    byte[] decoded = Base64.getDecoder().decode(ca.getAccess_log());
                    ca.setAccess_log(new String(decoded, StandardCharsets.UTF_8));
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            }
        }

        return list;
    }

    public int getAccessLogListCnt(CmsAccess cmsAccess) {
        return dao.getAccessLogListCnt(cmsAccess);
    }

    public List<CmsAccess> getWorkerList(CmsAccess cmsAccess) {
        return dao.getWorkerList(cmsAccess);
    }
}