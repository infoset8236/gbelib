package kr.go.gbelib.app.cms.module.training.statistics;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class TrainingStatistics extends PagingUtils {
	
	private int group_idx;
	private int large_category_idx;
	private int category_idx;
	private int training_idx;
	private String large_category_name;
	private String group_name;
	private String category_name;
	private String training_name;
	private String teacher_name;
	
	private String start_date;
	private String end_date;
	
	private int training_limit_count;
	private int training_backup_count;
	private int training_offline_count;
	private int join_count; //참여인원
	private int cert_ok_count; // 수료인원
	
	public TrainingStatistics() {}

	
	public int getGroup_idx() {
		return group_idx;
	}

	
	public void setGroup_idx(int group_idx) {
		this.group_idx = group_idx;
	}

	
	public int getLarge_category_idx() {
		return large_category_idx;
	}

	
	public void setLarge_category_idx(int large_category_idx) {
		this.large_category_idx = large_category_idx;
	}

	
	public int getCategory_idx() {
		return category_idx;
	}

	
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	
	public int getTraining_idx() {
		return training_idx;
	}

	
	public void setTraining_idx(int training_idx) {
		this.training_idx = training_idx;
	}

	
	public String getLarge_category_name() {
		return large_category_name;
	}

	
	public void setLarge_category_name(String large_category_name) {
		this.large_category_name = large_category_name;
	}

	
	public String getGroup_name() {
		return group_name;
	}

	
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	
	public String getCategory_name() {
		return category_name;
	}

	
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	
	public String getTraining_name() {
		return training_name;
	}

	
	public void setTraining_name(String training_name) {
		this.training_name = training_name;
	}

	
	public String getTeacher_name() {
		return teacher_name;
	}

	
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
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

	
	public int getTraining_limit_count() {
		return training_limit_count;
	}

	
	public void setTraining_limit_count(int training_limit_count) {
		this.training_limit_count = training_limit_count;
	}

	
	public int getTraining_backup_count() {
		return training_backup_count;
	}

	
	public void setTraining_backup_count(int training_backup_count) {
		this.training_backup_count = training_backup_count;
	}

	
	public int getTraining_offline_count() {
		return training_offline_count;
	}

	
	public void setTraining_offline_count(int training_offline_count) {
		this.training_offline_count = training_offline_count;
	}

	
	public int getJoin_count() {
		return join_count;
	}

	
	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}

	
	public int getCert_ok_count() {
		return cert_ok_count;
	}

	
	public void setCert_ok_count(int cert_ok_count) {
		this.cert_ok_count = cert_ok_count;
	}
	

}
