package kr.go.gbelib.app.cms.module.training.trainingCategoryCode;

import java.util.Date;

/**
 * 강좌분류코드
 * @author YONGJU
 *
 */
public class TrainingCategoryCode {

	private String training_group_id;  //코드그룹ID
	private String training_code_id;  //코드ID
	private String training_code_name;  //코드명
	private String up_training_code_id;  //상위코드ID
	private String remark;  //비고
	private int print_seq;  //정렬순서
	private Date add_date;  //등록일
	private String add_id;  //등록ID
	private Date modify_date;  //수정일
	private String modify_id;  //수정ID
	
	private String	editMode;

	
	public String getTraining_group_id() {
		return training_group_id;
	}

	
	public void setTraining_group_id(String training_group_id) {
		this.training_group_id = training_group_id;
	}

	
	public String getTraining_code_id() {
		return training_code_id;
	}

	
	public void setTraining_code_id(String training_code_id) {
		this.training_code_id = training_code_id;
	}

	
	public String getTraining_code_name() {
		return training_code_name;
	}

	
	public void setTraining_code_name(String training_code_name) {
		this.training_code_name = training_code_name;
	}

	
	public String getUp_training_code_id() {
		return up_training_code_id;
	}

	
	public void setUp_training_code_id(String up_training_code_id) {
		this.up_training_code_id = up_training_code_id;
	}

	
	public String getRemark() {
		return remark;
	}

	
	public void setRemark(String remark) {
		this.remark = remark;
	}

	
	public int getPrint_seq() {
		return print_seq;
	}

	
	public void setPrint_seq(int print_seq) {
		this.print_seq = print_seq;
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

	
	public String getEditMode() {
		return editMode;
	}

	
	public void setEditMode(String editMode) {
		this.editMode = editMode;
	}


}