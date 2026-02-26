package kr.go.gbelib.app.cms.module.dept;

import kr.co.whalesoft.framework.utils.PagingUtils;
import org.springframework.web.multipart.MultipartFile;

public class Dept extends PagingUtils {
	private String code_id;
	private String code_name;
	private String group_name;
	private String zipcode;
	private String address;
	private String use_yn;
	private String manager_name;
	private String manager_phone;
	private String code_check = "N";

	private MultipartFile mfile;
	
	public Dept() { }
	
	public Dept(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	@Override
	public String toString() {
		return "Dept [code_id=" + code_id + ", code_name=" + code_name + ", group_name=" + group_name + ", zipcode="
				+ zipcode + ", address=" + address + ", use_yn=" + use_yn + ", manager_name" + manager_name + ", manager_phone" + manager_phone + "]";
	}
	
}
