package kr.co.whalesoft.app.cms.cmsAccessLog;

import kr.co.whalesoft.app.cms.adminMenu.AdminMenu;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.utils.PagingUtils;

public class CmsAccess extends PagingUtils {

	private String worker_id;
	private AdminMenu menu;
	private String menu_id;
	private String access_log;
	private String access_type;
	private String access_ip;
	private String year;
	private String month;
	private String day;
	private String time;
	private String start_date;
	private String end_date;
	private String site_id;
	private String homepage_name;

	private String member_name;

	public CmsAccess() { }

	public CmsAccess(Member member, String menu_id, String access_type) {
		this.worker_id = member.getMember_id();
		this.menu_id= menu_id;
		this.access_type = access_type;
	}

	public CmsAccess(Member member, AdminMenu menu, String access_type) {
		this.worker_id = member.getMember_id();
		this.menu_id = String.valueOf(menu.getMenu_idx());
		this.access_type = access_type;
	}

	public String getWorker_id() {
		return worker_id;
	}

	public void setWorker_id(String worker_id) {
		this.worker_id = worker_id;
	}

	public AdminMenu getMenu() {
		return menu;
	}

	public void setMenu(AdminMenu menu) {
		this.menu = menu;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getAccess_log() {
		return access_log;
	}

	public void setAccess_log(String access_log) {
		this.access_log = access_log;
	}

	public String getAccess_type() {
		return access_type;
	}

	public void setAccess_type(String access_type) {
		this.access_type = access_type;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public String getAccess_ip() {
		return access_ip;
	}


	public void setAccess_ip(String access_ip) {
		this.access_ip = access_ip;
	}

	public String getSite_id() {
		return site_id;
	}

	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}

	public String getHomepage_name() {
		return homepage_name;
	}

	public void setHomepage_name(String homepage_name) {
		this.homepage_name = homepage_name;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
}
