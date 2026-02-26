/**
 *
 */
package kr.go.gbelib.app.module.bookBasket;

import kr.co.whalesoft.framework.utils.PagingUtils;

import java.util.Date;
import java.util.List;

/**
 * @author whaleesoft YONGJU 2020. 4. 3.
 *
 */
public class BookBasket extends PagingUtils {
	
	//경기도 기존 소스
	private int basket_idx; // 보관함IDX
	private String member_id; // 사용자ID
	private String manage_code; // 도서관관리부호
	private String media_name; // 매체구분
	private String reg_no; // 등록번호	
	private String book_type; // 자료구분
	
	//경북 보관함 추가 소스
	private String homepage_id;
	private String member_key; // 사용자키
	private String title; // 제목
	private String lib_name; // 도서관명
	private String call_no; // 청구기호
	private String author;
	private String loca;	
	private String ctrl_no;
	private String image_url;
	private String item_type;
	private Date add_date; // 등록일
	private String publer; //출판사
	private List<String> strList;
	private String context_path;
	
	private String vAccNo;
	private String vLoca;
	private String vCtrl;
	private String vImg;
	
	public BookBasket() {}
	
	public BookBasket(String homepage_id, String member_key) {
		setHomepage_id(homepage_id);
		this.setMember_key(member_key);
	}


	public int getBasket_idx() {
		return basket_idx;
	}
	
	
	public void setBasket_idx(int basket_idx) {
		this.basket_idx = basket_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getManage_code() {
		return manage_code;
	}

	public void setManage_code(String manage_code) {
		this.manage_code = manage_code;
	}

	public String getLib_name() {
		return lib_name;
	}

	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMedia_name() {
		return media_name;
	}

	public void setMedia_name(String media_name) {
		this.media_name = media_name;
	}

	public String getReg_no() {
		return reg_no;
	}

	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}

	public String getCall_no() {
		return call_no;
	}

	public void setCall_no(String call_no) {
		this.call_no = call_no;
	}

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}

	public Date getAdd_date() {
		return add_date;
	}

	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}

	public List<String> getStrList() {
		return strList;
	}

	public void setStrList(List<String> strList) {
		this.strList = strList;
	}
	
	public String getContext_path() {
		return context_path;
	}

	public void setContext_path(String context_path) {
		this.context_path = context_path;
	}

	public String getMember_key() {
		return member_key;
	}

	public void setMember_key(String member_key) {
		this.member_key = member_key;
	}

	public String getHomepage_id() {
		return homepage_id;
	}

	public void setHomepage_id(String homepage_id) {
		this.homepage_id = homepage_id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getLoca() {
		return loca;
	}

	public void setLoca(String loca) {
		this.loca = loca;
	}

	public String getCtrl_no() {
		return ctrl_no;
	}

	public void setCtrl_no(String ctrl_no) {
		this.ctrl_no = ctrl_no;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getItem_type() {
		return item_type;
	}

	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}

	public String getPubler() {
		return publer;
	}

	public void setPubler(String publer) {
		this.publer = publer;
	}

	public String getvLoca() {
		return vLoca;
	}

	public void setvLoca(String vLoca) {
		this.vLoca = vLoca;
	}

	public String getvCtrl() {
		return vCtrl;
	}

	public void setvCtrl(String vCtrl) {
		this.vCtrl = vCtrl;
	}

	public String getvImg() {
		return vImg;
	}

	public void setvImg(String vImg) {
		this.vImg = vImg;
	}

	public String getvAccNo() {
		return vAccNo;
	}

	public void setvAccNo(String vAccNo) {
		this.vAccNo = vAccNo;
	}
	
}
