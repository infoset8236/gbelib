package kr.go.gbelib.app.cms.module.memberGroupAuthLog;

import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberGroupAuthLogService extends BaseService {

    @Autowired
    private MemberGroupAuthLogDao dao;

    public int getMemberGroupAuthLogCount(MemberGroupAuthLog memberGroupAuthLog) {
       return dao.getMemberGroupAuthLogCount(memberGroupAuthLog);
    }

    public List<MemberGroupAuthLog> getMemberGroupAuthLogList(MemberGroupAuthLog memberGroupAuthLog) {
        return dao.getMemberGroupAuthLogList(memberGroupAuthLog);
    }

    public List<MemberGroupAuthLog> getMemberGroupAuthLogListExcel(MemberGroupAuthLog memberGroupAuthLog) {
        return dao.getMemberGroupAuthLogListExcel(memberGroupAuthLog);
    }
}
