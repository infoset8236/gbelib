package kr.co.whalesoft.app.cms.module.calendarManage;

import java.util.List;

import kr.co.whalesoft.app.cms.module.calendarStatus.CalendarStatus;

public interface CalendarManageDao {
	public List<CalendarManage> getCalendar(CalendarManage calendarManage );
	
	public List<CalendarManage> getCalendarType2(CalendarManage calendarManage );
	
	public List<CalendarManage> getCalendarManage(CalendarManage calendarManage);
	
	public CalendarManage getCalendarManageOne(CalendarManage calendarManage);
	
	public List<CalendarManage> getClosedDate(CalendarManage calendarManage);
	
	public List<CalendarManage> getCalendarStatus(CalendarStatus calendarStatus);
	
	public List<CalendarManage> getCalendarMonthStatus(CalendarStatus calendarStatus);
	
	public List<CalendarManage> getCalendarYearStatus(CalendarStatus calendarStatus);
	
	public int closedDateCheck(CalendarManage calendarManage);
	
	public int closedDateCheck2(CalendarManage calendarManage);
	
	public int addCalendarManage(CalendarManage calendarManage);
	
	public int modifyCalendarManage(CalendarManage calendarManage);
	
	public int deleteCalendarManage(CalendarManage calendarManage);

	public CalendarManage getClosedDate2(CalendarManage calendarManage);
	
	public CalendarManage getClosedDate3(CalendarManage calendarManage);

	public List<CalendarManage> getClosedDate4(CalendarManage calendarManage);
	
	public List<CalendarManage> getCalendarManageDetail(CalendarManage calendarManage);
	
	public List<CalendarManage> getCalendarManageDetail2(CalendarManage calendarManage);

	public List<CalendarManage> getCalendarListType(CalendarManage calendarManage);

	public int getNextCmIdx(CalendarManage calendarManage);

	public CalendarManage getCalendarManageOne2(CalendarManage calendarManage);

	public int deleteCalendarManageGroup(CalendarManage calendarManage);

	public int getCalendarManageCheckCount(CalendarManage calendarManage);
	
	public int isTodayClosed(String homepage_id);

	List<CalendarManage> getCalendarManageOneByDate(CalendarManage cm);

    List<CalendarManage> getEvent(CalendarManage calendarManage);

	List<CalendarManage> getToDayEvent(CalendarManage calendarManage);

	List<CalendarManage> getCalendarForIct(CalendarManage calendarManage);

	List<CalendarManage> getCalendarByTeachBook(CalendarManage calendarManage);

	List<CalendarManage> getCalendarByTeachBookExcel(CalendarManage calendarManage);
}
