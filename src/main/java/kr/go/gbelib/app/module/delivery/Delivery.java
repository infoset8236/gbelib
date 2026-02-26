package kr.go.gbelib.app.module.delivery;

import kr.co.whalesoft.framework.utils.PagingUtils;

import java.util.Date;
import java.util.List;

public class Delivery extends PagingUtils {
    private Integer delivery_idx; // 택배식별자
    private String member_name; // 회원이름
    private String member_id; // 회원번호
    private String member_cell_phone; // 회원휴대폰번호
    private String member_address; // 회원주소
    private Date delivery_reqst_date; // 택배신청일
    private Date delivery_return_date; // 택배반납예정일
    private Date delivery_delete_date; // 택배취소일
    private String delivery_delete_yn = "N"; // 택배취소여부
    private String delivery_status; // 택배상태값(0:승인대기, 1:승인, 2:반려)
    private String delivery_return_status; // 택배반납상태값(0:반납대기, 1:반납중, 2:반납완료)
    private String book_title; // 책제목
    private String book_loca_name; // 책소장처
    private String book_call_no; // 책청구기호
    private String book_acsson_no; // 책등록번호
    private List<Integer> delivery_idx_arr;	// 체크박스로 일괄 삭제할 때 씀

    public Integer getDelivery_idx() {
        return delivery_idx;
    }

    public void setDelivery_idx(Integer delivery_idx) {
        this.delivery_idx = delivery_idx;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getMember_cell_phone() {
        return member_cell_phone;
    }

    public void setMember_cell_phone(String member_cell_phone) {
        this.member_cell_phone = member_cell_phone;
    }

    public String getMember_address() {
        return member_address;
    }

    public void setMember_address(String member_address) {
        this.member_address = member_address;
    }

    public Date getDelivery_reqst_date() {
        return delivery_reqst_date;
    }

    public void setDelivery_reqst_date(Date delivery_reqst_date) {
        this.delivery_reqst_date = delivery_reqst_date;
    }

    public Date getDelivery_return_date() {
        return delivery_return_date;
    }

    public void setDelivery_return_date(Date delivery_return_date) {
        this.delivery_return_date = delivery_return_date;
    }

    public Date getDelivery_delete_date() {
        return delivery_delete_date;
    }

    public void setDelivery_delete_date(Date delivery_delete_date) {
        this.delivery_delete_date = delivery_delete_date;
    }

    public String getDelivery_delete_yn() {
        return delivery_delete_yn;
    }

    public void setDelivery_delete_yn(String delivery_delete_yn) {
        this.delivery_delete_yn = delivery_delete_yn;
    }

    public String getDelivery_status() {
        return delivery_status;
    }

    public void setDelivery_status(String delivery_status) {
        this.delivery_status = delivery_status;
    }

    public String getDelivery_return_status() {
        return delivery_return_status;
    }

    public void setDelivery_return_status(String delivery_return_status) {
        this.delivery_return_status = delivery_return_status;
    }

    public String getBook_title() {
        return book_title;
    }

    public void setBook_title(String book_title) {
        this.book_title = book_title;
    }

    public String getBook_loca_name() {
        return book_loca_name;
    }

    public void setBook_loca_name(String book_loca_name) {
        this.book_loca_name = book_loca_name;
    }

    public String getBook_call_no() {
        return book_call_no;
    }

    public void setBook_call_no(String book_call_no) {
        this.book_call_no = book_call_no;
    }

    public String getBook_acsson_no() {
        return book_acsson_no;
    }

    public void setBook_acsson_no(String book_acsson_no) {
        this.book_acsson_no = book_acsson_no;
    }

    public List<Integer> getDelivery_idx_arr() {
        return delivery_idx_arr;
    }

    public void setDelivery_idx_arr(List<Integer> delivery_idx_arr) {
        this.delivery_idx_arr = delivery_idx_arr;
    }
}
