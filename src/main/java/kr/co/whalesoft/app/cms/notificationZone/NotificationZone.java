package kr.co.whalesoft.app.cms.notificationZone;

import java.util.Date;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class NotificationZone extends PagingUtils{
    private String homepage_id; 
    private int notification_zone_idx; 
    private String notification_zone_code; 
    private String notification_zone_code_name;
    private String title; 
    private String sub_title; 
    private String contents; 
    private String start_date; 
    private String end_date; 
    private String link_type; 
    private String link_target = "CURRENT"; 
    private String link_url; 
    private String use_yn = "Y"; 
    private Date add_date; 
    private String add_id; 
    private Date modify_date; 
    private String modify_id;
    
    public NotificationZone() {}
    
    public NotificationZone(String homepage_id, String notification_zone_code) {
    	this.homepage_id = homepage_id;
    	this.notification_zone_code = notification_zone_code;
    }
    
    public String getHomepage_id() {
    	return homepage_id;
    }
    
    public void setHomepage_id(String homepage_id) {
    	this.homepage_id = homepage_id;
    }
    
	public String getNotification_zone_code_name() {
		return notification_zone_code_name;
	}

	
	public void setNotification_zone_code_name(String notification_zone_code_name) {
		this.notification_zone_code_name = notification_zone_code_name;
	}

	public int getNotification_zone_idx() {
    	return notification_zone_idx;
    }
    
    public void setNotification_zone_idx(int notification_zone_idx) {
    	this.notification_zone_idx = notification_zone_idx;
    }
    
    public String getNotification_zone_code() {
    	return notification_zone_code;
    }
    
    public void setNotification_zone_code(String notification_zone_code) {
    	this.notification_zone_code = notification_zone_code;
    }
    
    public String getTitle() {
    	return title;
    }
    
    public void setTitle(String title) {
    	this.title = title;
    }
    
    public String getSub_title() {
    	return sub_title;
    }
    
    public void setSub_title(String sub_title) {
    	this.sub_title = sub_title;
    }
    
    public String getContents() {
    	return contents;
    }
    
    public void setContents(String contents) {
    	this.contents = contents;
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
    
    public String getLink_type() {
    	return link_type;
    }
    
    public void setLink_type(String link_type) {
    	this.link_type = link_type;
    }
    
    public String getLink_target() {
    	return link_target;
    }
    
    public void setLink_target(String link_target) {
    	this.link_target = link_target;
    }
    
    public String getLink_url() {
    	return link_url;
    }
    
    public void setLink_url(String link_url) {
    	this.link_url = link_url;
    }
    
    public String getUse_yn() {
    	return use_yn;
    }
    
    public void setUse_yn(String use_yn) {
    	this.use_yn = use_yn;
    }
    
    public Date getAdd_date() {
    	return add_date;
    }
    
    public void setAdd_date(Date add_date) {
    	this.add_date = add_date;
    }
    
    public String getAdd_id() {
    	return add_id;
    }
    
    public void setAdd_id(String add_id) {
    	this.add_id = add_id;
    }
    
    public Date getModify_date() {
    	return modify_date;
    }
    
    public void setModify_date(Date modify_date) {
    	this.modify_date = modify_date;
    }
    
    public String getModify_id() {
    	return modify_id;
    }
    
    public void setModify_id(String modify_id) {
    	this.modify_id = modify_id;
    }
}
		