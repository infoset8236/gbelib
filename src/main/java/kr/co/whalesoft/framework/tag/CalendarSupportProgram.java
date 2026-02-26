package kr.co.whalesoft.framework.tag;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang3.StringUtils;
import org.dom4j.Branch;

import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.app.cms.module.support.Support;

public class CalendarSupportProgram extends BodyTagSupport {
	
private static final long serialVersionUID = 1L;
	
	private List<Support> supportList;
	private String plan_date;
	private String mode;
	private List<CalendarManage> closeDateList;
	private String supportManageRepo;
	private boolean validationDate;
	
	@Override
	public int doEndTag() throws JspException{
		
		StringBuffer sb = new StringBuffer();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        Calendar calendar = Calendar.getInstance();
        String toDay = format.format(calendar.getTime());
		
		if (mode.equals("admin")) {
			
			boolean validHoliday = false;
			String holidayTitle = "";
			
			if (closeDateList != null) {
				for (CalendarManage calendarManage :  closeDateList) {
					
					if (plan_date.equals(calendarManage.getStart_date())) {
						validHoliday = true;
						holidayTitle = calendarManage.getTitle();
						break;
					} else {
						
					}
				}
			}
			
			if (!validHoliday) {
				for(int i=0; i<supportList.size(); i++) {
					Support support = supportList.get(i);
					String planMonth = plan_date.substring(0,7);				
					String startMonth = support.getHope_req_dt().substring(0,7);
					String endMonth = support.getHope_req_dt().substring(0,7);
					int planDay = Integer.parseInt(plan_date.substring(plan_date.lastIndexOf("-")+1));
					int startDay = Integer.parseInt(support.getHope_req_dt().substring(support.getHope_req_dt().lastIndexOf("-")+1));
					int endDay = Integer.parseInt(support.getHope_req_dt().substring(support.getHope_req_dt().lastIndexOf("-")+1));		
					
					int calendarDay = Integer.parseInt(plan_date.replaceAll("-", ""));
					int to_day = Integer.parseInt(toDay);
					
					if(planMonth.equals(startMonth) && !planMonth.equals(endMonth)) {
						if(planDay >= startDay && planDay <= 31) {
							if(support.getProcess_state().equals("S")) {
								sb.append("<a href=\"#\" class=\"modify\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
								sb.append("<a href=\"#\" class=\"btn btn3 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">신청</span></a>");
							} else if(support.getProcess_state().equals("N")) {
								sb.append("<a href=\"#\" class=\"modify\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
								sb.append("<a href=\"#\" class=\"btn btn1 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">접수</span></a>");
							} else {
								sb.append("<a href=\"javascript:alert('접수완료된 현장지원은 수정이 불가합니다.')\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
								sb.append("<a href=\"#\" class=\"btn btn2 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">완료</span></a>");
							}
							sb.append("<ul class=\"schedule\">");
							sb.append("</ul>");
						}
					} else if (planDay >= startDay && planDay <= endDay) {
						if(support.getProcess_state().equals("S")) {
							sb.append("<a href=\"#\" class=\"modify\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
							sb.append("<a href=\"#\" class=\"btn btn3 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">신청</span></a>");
						} else if(support.getProcess_state().equals("N")) {
							sb.append("<a href=\"#\" class=\"modify\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
							sb.append("<a href=\"#\" class=\"btn btn1 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">접수</span></a>");
						} else {
							sb.append("<a href=\"javascript:alert('접수완료된 현장지원은 수정이 불가합니다.')\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
							sb.append("<a href=\"#\" class=\"btn btn2 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">완료</span></a>");
						} 
						sb.append("<ul class=\"schedule\">");
						sb.append("</ul>");
					} else if(!planMonth.equals(startMonth) && planMonth.equals(endMonth)) {
						if(planDay >= 1 && planDay <= endDay) {
							if(support.getProcess_state().equals("S")) {
								sb.append("<a href=\"#\" class=\"modify\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
								sb.append("<a href=\"#\" class=\"btn btn3 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">신청</span></a>");
							} else if(support.getProcess_state().equals("N")) {
								sb.append("<a href=\"#\" class=\"modify\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
								sb.append("<a href=\"#\" class=\"btn btn1 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">접수</span></a>");
							} else {
								sb.append("<a href=\"javascript:alert('접수완료된 현장지원은 수정이 불가합니다.')\"><span style=\"margin-left : 5px; font-size:13px;\">"+support.getReq_name()+"</span></a><br>");
								sb.append("<a href=\"#\" class=\"btn btn2 result\" keyValue=\""+support.getSeq()+"\"><span style=\"margin-left : 5px; font-size:13px;\">완료</span></a>");
							}
							sb.append("<ul class=\"schedule\">");
							sb.append("</ul>");
						}
					}
				}
				
				if (StringUtils.isNotBlank(supportManageRepo) && validationDate) {
					sb.append("<a href=\"\" class=\"btn btn5 left dialog-add\" keyValue=\""+plan_date+"\"><i class=\"fa fa-plus\"></i><span>현장지원 등록</span></a>");
				}
			} else {
				//sb.append("<span style=\"color: red\">"+holidayTitle+"</span>");
			}
		}
		
		try {
			pageContext.getOut().println(sb.toString());
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		
		return EVAL_PAGE;
	}
	
	public List<Support> getSupportList() {
		if(supportList != null) {
			List<Support> arrayList = new ArrayList<Support>();
			arrayList.addAll(this.supportList);
			return arrayList;
		} else {
			return null;
		}
	}
	public void setSupportList(List<Support> supportList) {
		if(supportList != null) {
			this.supportList = new ArrayList<Support>();
			this.supportList.addAll(supportList);
		}
	}
	public String getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(String plan_date) {
		this.plan_date = plan_date;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}

	
	public List<CalendarManage> getCloseDateList() {
		return closeDateList;
	}

	
	public void setCloseDateList(List<CalendarManage> closeDateList) {
		this.closeDateList = closeDateList;
	}

	
	public String getSupportManageRepo() {
		return supportManageRepo;
	}

	
	public void setSupportManageRepo(String supportManageRepo) {
		this.supportManageRepo = supportManageRepo;
	}
	
	public boolean isValidationDate() {
		return validationDate;
	}
	
	public void setValidationDate(boolean validationDate) {
		this.validationDate = validationDate;
	}
	
}
