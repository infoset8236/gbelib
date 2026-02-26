package kr.go.gbelib.app.module.loginLog;

import java.util.List;

import kr.co.whalesoft.app.cms.member.Member;

public interface LoginLogDao {

	public int getLoginLogCnt(LoginLog loginLog);
	
	public List<LoginLog> getLoginLogList(LoginLog loginLog);
	
	public int addLoginLog(LoginLog loginLog);
	
	public List<LoginLog> getLoginLogListCms(LoginLog loginLog);
	
	public int getLoginLogCntCms(LoginLog loginLog);

	public String getLoginDate(Member loginMember);
	
}
