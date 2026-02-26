package kr.go.gbelib.app.cms.module.trainingCategoryTerms.trainingTerms;

import java.util.Date;

import kr.co.whalesoft.framework.utils.PagingUtils;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
public class TrainingTerms extends PagingUtils {
	private String homepage_id; //홈페이지ID
	private int terms_idx; //약관IDX
	private String terms_type; // 공통코드 > 연수이용약관 > 코드ID의 FK
	private String title;	//제목
	private String contents;	//내용
	private String use_yn; //사용여부
	private String delete_yn; //삭제여부
	private String add_id; //등록ID
	private Date add_date;	//등록날짜
	private String modify_id;	//수정ID
	private Date modify_date;	//수정날짜
	private String terms_type_name;	// 공통코드 > 연수이용약관 > 코드명 FK
	
	public int getTerms_idx() {
		return terms_idx;
	}
	public void setTerms_idx(int terms_idx) {
		this.terms_idx = terms_idx;
	}
	public String getTerms_type() {
		return terms_type;
	}
	public void setTerms_type(String terms_type) {
		this.terms_type = terms_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public String getAdd_id() {
		return add_id;
	}
	public void setAdd_id(String add_id) {
		this.add_id = add_id;
	}
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}
	public String getModify_id() {
		return modify_id;
	}
	public void setModify_id(String modify_id) {
		this.modify_id = modify_id;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	public String getHomepage_id() {
		return homepage_id;
	}
	public void setHomepage_id(String homepage_id) {
		this.homepage_id = homepage_id;
	}
	public String getTerms_type_name() {
		return terms_type_name;
	}
	public void setTerms_type_name(String terms_type_name) {
		this.terms_type_name = terms_type_name;
	}
	
}
