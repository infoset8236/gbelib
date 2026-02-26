package kr.go.gbelib.app.cms.module.training.trainingBookManage;

import kr.co.whalesoft.framework.utils.PagingUtils;

import java.util.Date;
import java.util.List;

public class TrainingBookManage extends PagingUtils {
    private Integer training_book_manage_idx;
    private Integer training_idx;
    private Integer student_idx;
    private String student_name;
    private String web_id;
    private String student_birth;
    private String belong_name;
    private String applicant_cell_phone;
    private String student_rank;
    private Integer qr_count;
    private String training_status; // 1 미출석, 2 출석
    private String training_type; // 1 qr출석, 2 수동출석
    private Date training_date;
    private Date add_date;
    private String add_id;

    private List<Integer> training_book_manage_idx_arr;
    private String search_start_date;
    private String search_end_date;
    private String attendance_status;

    public Integer getTraining_book_manage_idx() {
        return training_book_manage_idx;
    }

    public void setTraining_book_manage_idx(Integer training_book_manage_idx) {
        this.training_book_manage_idx = training_book_manage_idx;
    }

    public Integer getTraining_idx() {
        return training_idx;
    }

    public Integer getStudent_idx() {
        return student_idx;
    }

    public void setStudent_idx(Integer student_idx) {
        this.student_idx = student_idx;
    }

    public void setTraining_idx(Integer training_idx) {
        this.training_idx = training_idx;
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

    public String getBelong_name() {
        return belong_name;
    }

    public void setBelong_name(String belong_name) {
        this.belong_name = belong_name;
    }

    public String getApplicant_cell_phone() {
        return applicant_cell_phone;
    }

    public void setApplicant_cell_phone(String applicant_cell_phone) {
        this.applicant_cell_phone = applicant_cell_phone;
    }

    public String getStudent_rank() {
        return student_rank;
    }

    public void setStudent_rank(String student_rank) {
        this.student_rank = student_rank;
    }

    public Integer getQr_count() {
        return qr_count;
    }

    public void setQr_count(Integer qr_count) {
        this.qr_count = qr_count;
    }

    public String getTraining_status() {
        return training_status;
    }

    public void setTraining_status(String training_status) {
        this.training_status = training_status;
    }

    public String getTraining_type() {
        return training_type;
    }

    public void setTraining_type(String training_type) {
        this.training_type = training_type;
    }

    public Date getTraining_date() {
        return training_date;
    }

    public void setTraining_date(Date training_date) {
        this.training_date = training_date;
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

    public List<Integer> getTraining_book_manage_idx_arr() {
        return training_book_manage_idx_arr;
    }

    public void setTraining_book_manage_idx_arr(List<Integer> training_book_manage_idx_arr) {
        this.training_book_manage_idx_arr = training_book_manage_idx_arr;
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
