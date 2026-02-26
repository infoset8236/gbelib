package kr.co.whalesoft.app.cms.cmsAccessLog;

import java.util.List;

public interface CmsAccessLogDao {

	public int addAccessLog(CmsAccess cmsAccess);
	
	public List<CmsAccess> getAccessLogList(CmsAccess cmsAccess);

	public List<CmsAccess> getAllAccessLogList(CmsAccess cmsAccess);

	public int getAccessLogListCnt(CmsAccess cmsAccess);

    public List<CmsAccess> getWorkerList(CmsAccess cmsAccess);
	
}