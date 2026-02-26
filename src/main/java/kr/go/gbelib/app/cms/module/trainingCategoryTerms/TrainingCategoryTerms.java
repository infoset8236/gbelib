package kr.go.gbelib.app.cms.module.trainingCategoryTerms;

import java.util.Date;

import kr.co.whalesoft.framework.utils.PagingUtils;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
public class TrainingCategoryTerms extends PagingUtils {
	private String homepage_id; //홈페이지ID
	private int large_category_idx;	//대분류IDX
	private int group_idx;	//중분류IDX
	private int category_idx;	//소분류IDX
	private int terms_idx;	//약관IDX
	private Date add_date; //등록날짜
	private String add_id; //등록ID
	
	private String idx_param; //파라미터 GET 전달용
	private String code_name;	//대분류명 파라미터 전달용
	private String group_name;	//중분류명 파라미터 전달용
	private String category_name;	//소분류명 파라미터 전달용
	private int index_no;	//선택한 분류번호 전달용
	private String terms_type_name; // 조인해서 가져올 코드네임
	private String title; //조인해서 가져올 약관 제목
	
	public TrainingCategoryTerms() {} 
	
	public TrainingCategoryTerms(String homepage_id, int large_category_idx, int group_idx, int category_idx) {
		this.homepage_id = homepage_id;
		this.large_category_idx = large_category_idx;
		this.group_idx = group_idx;
		this.category_idx = category_idx;
	}
	
	public int getLarge_category_idx() {
		return large_category_idx;
	}
	public void setLarge_category_idx(int large_category_idx) {
		this.large_category_idx = large_category_idx;
	}
	public int getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(int group_idx) {
		this.group_idx = group_idx;
	}
	public int getCategory_idx() {
		return category_idx;
	}
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}
	public int getTerms_idx() {
		return terms_idx;
	}
	public void setTerms_idx(int terms_idx) {
		this.terms_idx = terms_idx;
	}
	public String getIdx_param() {
		return idx_param;
	}
	public void setIdx_param(String idx_param) {
		this.idx_param = idx_param;
	}
	public String getHomepage_id() {
		return homepage_id;
	}
	public void setHomepage_id(String homepage_id) {
		this.homepage_id = homepage_id;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
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
	public int getIndex_no() {
		return index_no;
	}
	public void setIndex_no(int index_no) {
		this.index_no = index_no;
	}
	public String getTerms_type_name() {
		return terms_type_name;
	}
	public void setTerms_type_name(String terms_type_name) {
		this.terms_type_name = terms_type_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	

}
