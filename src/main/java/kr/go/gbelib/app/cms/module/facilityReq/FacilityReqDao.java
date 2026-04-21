package kr.go.gbelib.app.cms.module.facilityReq;

import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;

import java.util.List;

public interface FacilityReqDao  {

	public List<FacilityReq> getFacilityReqListAll(FacilityReq facilityReq);
	
	public List<FacilityReq> getFacilityReqList(FacilityReq facilityReq);
	
	public FacilityReq getFacilityReqOne(FacilityReq facilityReq);
	
	public int checkFacilityReq(FacilityReq facilityReq);

	public int checkFacilityReqByIds(FacilityReq facilityReq);

	public int addFacilityReq(FacilityReq facilityReq);
	
	public int modifyFacilityReq(FacilityReq facilityReq);
	
	public int deleteFacilityReq(FacilityReq facilityReq);

	public List<FacilityReq> getFacilityReqCalendar(CalendarManage calendarManage);

	public int changeStatus(FacilityReq facilityReq);

	public List<FacilityReq> getFacilityReqListByExcel(FacilityReq facilityReq);

	public List<FacilityReq> getApplyList(FacilityReq facilityReq);

	public List<FacilityReq> getFacilityReqListByExcelChoice(FacilityReq facilityReq);

	public List<FacilityReq> getFacilityReqCalendarIct(CalendarManage calendarManage);
}