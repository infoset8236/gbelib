package kr.go.gbelib.app.cms.module.teach.teachBookManage;

import kr.co.whalesoft.framework.utils.PagingUtils;

import java.util.Date;
import java.util.List;

public class TeachBookManage extends PagingUtils {
    private Integer teach_book_manage_idx;
    private Integer teach_idx;
    private Integer student_idx;
    private String student_name;
    private String web_id;
    private String student_birth;
    private String applicant_cell_phone;
    private String teach_status; // 1 미출석, 2 출석
    private String teach_type; // 1 qr출석, 2 수동출석
    private Date teach_date;
    private Date add_date;
    private String add_id;

    private List<Integer> teach_book_manage_idx_arr;
    private String search_start_date;
    private String search_end_date;
    private String attendance_status;

    public Integer getTeach_book_manage_idx() {
        return teach_book_manage_idx;
    }

    public void setTeach_book_manage_idx(Integer teach_book_manage_idx) {
        this.teach_book_manage_idx = teach_book_manage_idx;
    }

    public Integer getTeach_idx() {
        return teach_idx;
    }

    public void setTeach_idx(Integer teach_idx) {
        this.teach_idx = teach_idx;
    }

    public Integer getStudent_idx() {
        return student_idx;
    }

    public void setStudent_idx(Integer student_idx) {
        this.student_idx = student_idx;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getWeb_id() {
        return web_id;
    }

    public void setWeb_id(String web_id) {
        this.web_id = web_id;
    }

    public String getStudent_birth() {
        return student_birth;
    }

    public void setStudent_birth(String student_birth) {
        this.student_birth = student_birth;
    }

    public String getApplicant_cell_phone() {
        return applicant_cell_phone;
    }

    public void setApplicant_cell_phone(String applicant_cell_phone) {
        this.applicant_cell_phone = applicant_cell_phone;
    }

    public String getTeach_status() {
        return teach_status;
    }

    public void setTeach_status(String teach_status) {
        this.teach_status = teach_status;
    }

    public String getTeach_type() {
        return teach_type;
    }

    public void setTeach_type(String teach_type) {
        this.teach_type = teach_type;
    }

    public Date getTeach_date() {
        return teach_date;
    }

    public void setTeach_date(Date teach_date) {
        this.teach_date = teach_date;
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

    public List<Integer> getTeach_book_manage_idx_arr() {
        return teach_book_manage_idx_arr;
    }

    public void setTeach_book_manage_idx_arr(List<Integer> teach_book_manage_idx_arr) {
        this.teach_book_manage_idx_arr = teach_book_manage_idx_arr;
    }

    public String getSearch_start_date() {
        return search_start_date;
    }

    public void setSearch_start_date(String search_start_date) {
        this.search_start_date = search_start_date;
    }

    public String getSearch_end_date() {
        return search_end_date;
    }

    public void setSearch_end_date(String search_end_date) {
        this.search_end_date = search_end_date;
    }

    public String getAttendance_status() {
        return attendance_status;
    }

    public void setAttendance_status(String attendance_status) {
        this.attendance_status = attendance_status;
    }
}
