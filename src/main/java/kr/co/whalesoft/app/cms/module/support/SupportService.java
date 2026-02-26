package kr.co.whalesoft.app.cms.module.support;

import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.module.calendarStatus.CalendarStatus;
import kr.co.whalesoft.framework.base.BaseService;
import kr.go.gbelib.app.cms.module.dept.Dept;
import kr.go.gbelib.app.cms.module.dept.DeptService;
import kr.go.gbelib.app.common.api.PushAPI;

@Service
public class SupportService extends BaseService {
	
	@Autowired
	private SupportDao dao;
	
	public List<Calendar> getCalendar(Support support) {
		return dao.getCalendar(support);
	}
	
	public List<CalendarStatus> getSupportStatus(CalendarStatus calendarStatus) {
		return dao.getSupportStatus(calendarStatus);
	}
	
	public List<CalendarStatus> getSupportMonthStatus(CalendarStatus calendarStatus) {
		return dao.getSupportMonthStatus(calendarStatus);
	}
	
	public List<CalendarStatus> getSupportYearStatus(CalendarStatus calendarStatus) {
		return dao.getSupportYearStatus(calendarStatus);
	}
	
	public List<Support> getSupport(Support support) {
		return dao.getSupport(support);
	}
	
	public List<Support> getUserSupport(Support support) {
		return dao.getUserSupport(support);
	}
	
	public Support getSupportOne(Support support) {
		return dao.getSupportOne(support);
	}
	
	public int addSupport(Support support) {
		return dao.addSupport(support);
	}
	
	public int modifySupport(Support support) {
		return dao.modifySupport(support);
	}
	
	public int modifySupportResult(Support support) {
		return dao.modifySupportResult(support);
	}
	
	public int deleteSupport(Support support) {
		return dao.deleteSupport(support);
	}
	
	public void supportSmsSend(Homepage homepage, Support support) {
		try {
        	String[] hope_req_dt_attr = support.getHope_req_dt().split("-");
        	
        	String date_str = hope_req_dt_attr[0]+"년 "+hope_req_dt_attr[1]+"월 "+hope_req_dt_attr[2]+"일";
        	
        	// 신청자 문자 발신
        	String message = support.getRequer_name()+"님 "+date_str+ "에 ["+support.getReq_name()+"](으)로 현장지원 신청이 완료 되었습니다.";
        	PushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, support.getRequer_tel1()+"-"+support.getRequer_tel2()+"-"+support.getRequer_tel3(), message, homepage.getHomepage_send_tell(), true);
        	// 관리자 문자 발신
        	String adminMessage = date_str+ "에 ["+support.getReq_name()+"](으)로 현장지원 신청이 접수 되었습니다.";
        	
        	if (StringUtils.isNotEmpty(homepage.getSupport_manager_phone())) {
        		PushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, homepage.getSupport_manager_phone(), adminMessage, homepage.getHomepage_send_tell(), true);
        	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
