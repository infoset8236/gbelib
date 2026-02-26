package kr.go.gbelib.app.cms.module.elib.statistics;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class ElibStatistics extends PagingUtils {

	private String library_code;
	private String library_name;
	private String reg_dt;
	private int lend_pc;
	private int lend_smart;
	private String type = "EBK";
	private String com_code;
	private String lend_dt;
	private String search_sdt;
	private String search_edt;
	private int library_idx;
	private String menu = "HOURS";
	private String cate_name;
	private int p_cnt;
	private int s_cnt;
	private int a_cnt;
	private int i_cnt;
	private int e_cnt;
	private int book_idx;
	private String book_name;
	private String user_id;
	private String user_name;
	private String member_id;
	private int age;
	private String sex;
	private int lend_cnt;
	private String age_group;
	private int comments_cnt;
	private int total_reserves_cnt;
	private int reserves_cnt;
	private String device_cnt;
	private String comp_name;
	private String parent_name;

	//카테고리별 통계 (KDC 분류)
	private int cate_0; // 총류
	private int cate_1; // 철학
	private int cate_2; // 종교
	private int cate_3; // 사회과학
	private int cate_4; // 순수과학
	private int cate_5; // 기술과학
	private int cate_6; // 예술
	private int cate_7; // 언어
	private int cate_8; // 문학
	private int cate_9; // 역사

	public String getReg_dt() {
		return reg_dt;
	}
	public int getLend_pc() {
		return lend_pc;
	}
	public int getLend_smart() {
		return lend_smart;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public void setLend_pc(int lend_pc) {
		this.lend_pc = lend_pc;
	}
	public void setLend_smart(int lend_smart) {
		this.lend_smart = lend_smart;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCom_code() {
		return com_code;
	}
	public void setCom_code(String com_code) {
		this.com_code = com_code;
	}
	public String getLend_dt() {
		return lend_dt;
	}
	public void setLend_dt(String lend_dt) {
		this.lend_dt = lend_dt;
	}
	public int getLibrary_idx() {
		return library_idx;
	}
	public void setLibrary_idx(int library_idx) {
		this.library_idx = library_idx;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getSearch_sdt() {
		return search_sdt;
	}
	public void setSearch_sdt(String search_sdt) {
		this.search_sdt = search_sdt;
	}
	public String getSearch_edt() {
		return search_edt;
	}
	public void setSearch_edt(String search_edt) {
		this.search_edt = search_edt;
	}
	public String getCate_name() {
		return cate_name;
	}
	public int getP_cnt() {
		return p_cnt;
	}
	public int getS_cnt() {
		return s_cnt;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public void setP_cnt(int p_cnt) {
		this.p_cnt = p_cnt;
	}
	public void setS_cnt(int s_cnt) {
		this.s_cnt = s_cnt;
	}
	public int getBook_idx() {
		return book_idx;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_idx(int book_idx) {
		this.book_idx = book_idx;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getAge() {
		return age;
	}
	public int getLend_cnt() {
		return lend_cnt;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setLend_cnt(int lend_cnt) {
		this.lend_cnt = lend_cnt;
	}
	public String getLibrary_code() {
		return library_code;
	}
	public void setLibrary_code(String library_code) {
		this.library_code = library_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAge_group() {
		return age_group;
	}
	public void setAge_group(String age_group) {
		this.age_group = age_group;
	}
	public int getComments_cnt() {
		return comments_cnt;
	}
	public void setComments_cnt(int comments_cnt) {
		this.comments_cnt = comments_cnt;
	}
	public int getTotal_reserves_cnt() {
		return total_reserves_cnt;
	}
	public void setTotal_reserves_cnt(int total_reserves_cnt) {
		this.total_reserves_cnt = total_reserves_cnt;
	}
	public int getReserves_cnt() {
		return reserves_cnt;
	}
	public void setReserves_cnt(int reserves_cnt) {
		this.reserves_cnt = reserves_cnt;
	}
	public String getLibrary_name() {
		return library_name;
	}
	public void setLibrary_name(String library_name) {
		this.library_name = library_name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(int a_cnt) {
		this.a_cnt = a_cnt;
	}
	public int getI_cnt() {
		return i_cnt;
	}
	public void setI_cnt(int i_cnt) {
		this.i_cnt = i_cnt;
	}
	public int getE_cnt() {
		return e_cnt;
	}
	public void setE_cnt(int e_cnt) {
		this.e_cnt = e_cnt;
	}
	public String getDevice_cnt() {
		return device_cnt;
	}
	public void setDevice_cnt(String device_cnt) {
		this.device_cnt = device_cnt;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}

	public int getCate_0() {
		return cate_0;
	}

	public void setCate_0(int cate_0) {
		this.cate_0 = cate_0;
	}

	public int getCate_1() {
		return cate_1;
	}

	public void setCate_1(int cate_1) {
		this.cate_1 = cate_1;
	}

	public int getCate_2() {
		return cate_2;
	}

	public void setCate_2(int cate_2) {
		this.cate_2 = cate_2;
	}

	public int getCate_3() {
		return cate_3;
	}

	public void setCate_3(int cate_3) {
		this.cate_3 = cate_3;
	}

	public int getCate_4() {
		return cate_4;
	}

	public void setCate_4(int cate_4) {
		this.cate_4 = cate_4;
	}

	public int getCate_5() {
		return cate_5;
	}

	public void setCate_5(int cate_5) {
		this.cate_5 = cate_5;
	}

	public int getCate_6() {
		return cate_6;
	}

	public void setCate_6(int cate_6) {
		this.cate_6 = cate_6;
	}

	public int getCate_7() {
		return cate_7;
	}

	public void setCate_7(int cate_7) {
		this.cate_7 = cate_7;
	}

	public int getCate_8() {
		return cate_8;
	}

	public void setCate_8(int cate_8) {
		this.cate_8 = cate_8;
	}

	public int getCate_9() {
		return cate_9;
	}

	public void setCate_9(int cate_9) {
		this.cate_9 = cate_9;
	}
}
