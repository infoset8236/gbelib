package kr.go.gbelib.app.module.pushNotification;

import java.util.List;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class PushNotification extends PagingUtils {

	private int idx;
	private String dttm;
	private String member_id;
	private String title;
	private String body;
	
	private List<Integer> idx_arr;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getDttm() {
		return dttm;
	}
	public void setDttm(String dttm) {
		this.dttm = dttm;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public List<Integer> getIdx_arr() {
		return idx_arr;
	}
	public void setIdx_arr(List<Integer> idx_arr) {
		this.idx_arr = idx_arr;
	}
	
}
