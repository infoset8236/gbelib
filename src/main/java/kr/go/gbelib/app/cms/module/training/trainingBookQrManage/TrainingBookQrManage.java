package kr.go.gbelib.app.cms.module.training.trainingBookQrManage;

import kr.co.whalesoft.framework.utils.PagingUtils;

import java.util.Date;

public class TrainingBookQrManage extends PagingUtils {
    private Integer training_book_qr_manage_idx;
    private Integer training_idx;
    private Integer qr_count;
    private String token;
    private Date add_date;
    private String add_id;

    public Integer getTraining_book_qr_manage_idx() {
        return training_book_qr_manage_idx;
    }

    public void setTraining_book_qr_manage_idx(Integer training_book_qr_manage_idx) {
        this.training_book_qr_manage_idx = training_book_qr_manage_idx;
    }

    public Integer getTraining_idx() {
        return training_idx;
    }

    public void setTraining_idx(Integer training_idx) {
        this.training_idx = training_idx;
    }

    public Integer getQr_count() {
        return qr_count;
    }

    public void setQr_count(Integer qr_count) {
        this.qr_count = qr_count;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
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
