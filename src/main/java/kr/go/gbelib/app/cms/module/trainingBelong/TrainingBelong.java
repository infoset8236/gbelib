package kr.go.gbelib.app.cms.module.trainingBelong;

import kr.co.whalesoft.framework.utils.PagingUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author ttkaz
 * 2022. 7. 26.
 *
 */
public class TrainingBelong extends PagingUtils{
	private int belong_idx; //기관idx
	private String homepage_id;	//홈페이지id
	private String belong_name;	//기관이름
	private String add_date;	//등록날짜
	private String add_id;	//등록id
	private String mod_date;	//수정날짜
	private String mod_id;	//수정id

	private String group_name; // 관할조직명
	private String zip_code; // 우편번호
	private String address;  // 상세주소
	private String use_yn; //사용여부
	private String manager_name; // 담당자 이름
	private String manager_phone; // 담당자 휴대폰 번호
	private String code_check = "N";

	private MultipartFile mfile;
	private int[] belong_idx_arr; //기관idx

	public int getBelong_idx() {
		return belong_idx;
	}

	public void setBelong_idx(int belong_idx) {
		this.belong_idx = belong_idx;
	}

	@Override
	public String getHomepage_id() {
		return homepage_id;
	}

	@Override
	public void setHomepage_id(String homepage_id) {
		this.homepage_id = homepage_id;
	}

	public String getBelong_name() {
		return belong_name;
	}

	public void setBelong_name(String belong_name) {
		this.belong_name = belong_name;
	}

	public String getAdd_date() {
		return add_date;
	}

	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}

	public String getAdd_id() {
		return add_id;
	}

	public void setAdd_id(String add_id) {
		this.add_id = add_id;
	}

	public String getMod_date() {
		return mod_date;
	}

	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}

	public String getMod_id() {
		return mod_id;
	}

	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getManager_phone() {
		return manager_phone;
	}

	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}

	public String getCode_check() {
		return code_check;
	}

	public void setCode_check(String code_check) {
		this.code_check = code_check;
	}

	public MultipartFile getMfile() {
		return mfile;
	}

	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}

	public int[] getBelong_idx_arr() {
		return belong_idx_arr;
	}

	public void setBelong_idx_arr(int[] belong_idx_arr) {
		this.belong_idx_arr = belong_idx_arr;
	}
}
