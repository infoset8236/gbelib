package kr.go.gbelib.app.cms.module.excelDownLog;

import kr.co.whalesoft.framework.utils.PagingUtils;
import java.util.List;

public class ExcelDownLog extends PagingUtils {

    private int idx;
    private String os;
    private String browser;
    private String ip;
    private String add_date;
    private String add_id;
    private String add_ip;
    private int teach_idx;
    private String type;
    private String teach_name;
    private String site_id;
    private String homepage_name;

    private String start_date;
    private String end_date;

    private String menu_path;

    private List<Integer> excel_idx_arr; // 체크박스로 일괄 다운할 때 씀

    private String worker_id;

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
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

    public int getTeach_idx() {
        return teach_idx;
    }

    public void setTeach_idx(int teach_idx) {
        this.teach_idx = teach_idx;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTeach_name() {
        return teach_name;
    }

    public void setTeach_name(String teach_name) {
        this.teach_name = teach_name;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getHomepage_name() {
        return homepage_name;
    }

    public void setHomepage_name(String homepage_name) {
        this.homepage_name = homepage_name;
    }

    public String getSite_id() {
        return site_id;
    }

    public void setSite_id(String site_id) {
        this.site_id = site_id;
    }

    public String getMenu_path() {
        return menu_path;
    }

    public void setMenu_path(String menu_path) {
        this.menu_path = menu_path;
    }

    public String getAdd_ip() {
        return add_ip;
    }

    public void setAdd_ip(String add_ip) {
        this.add_ip = add_ip;
    }

    public List<Integer> getExcel_idx_arr() {
        return excel_idx_arr;
    }

    public void setExcel_idx_arr(List<Integer> excel_idx_arr) {
        this.excel_idx_arr = excel_idx_arr;
    }

    public String getWorker_id() {
        return worker_id;
    }

    public void setWorker_id(String worker_id) {
        this.worker_id = worker_id;
    }
}
  