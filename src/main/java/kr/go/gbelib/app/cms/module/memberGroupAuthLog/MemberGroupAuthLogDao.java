package kr.go.gbelib.app.cms.module.memberGroupAuthLog;

import java.util.List;

public interface MemberGroupAuthLogDao {
    public int addMemberGroupAuthLogDao(MemberGroupAuthLog memberGroupAuthLog);

    public int getMemberGroupAuthLogCount(MemberGroupAuthLog memberGroupAuthLog);

    public List<MemberGroupAuthLog> getMemberGroupAuthLogList(MemberGroupAuthLog memberGroupAuthLog);

    public List<MemberGroupAuthLog> getMemberGroupAuthLogListExcel(MemberGroupAuthLog memberGroupAuthLog);
}
