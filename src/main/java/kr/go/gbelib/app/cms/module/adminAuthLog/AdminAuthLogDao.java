package kr.go.gbelib.app.cms.module.adminAuthLog;

import java.util.List;

public interface AdminAuthLogDao {

    public int addAdminAuthLog(AdminAuthLog adminAuthLog);


    public List<AdminAuthLog> getAdminAuthLogList(AdminAuthLog adminAuthLog);

    public int getAdminAuthLogCount(AdminAuthLog adminAuthLog);

    public List<AdminAuthLog> getAdminAuthLogList_excel(AdminAuthLog adminAuthLog);
}
