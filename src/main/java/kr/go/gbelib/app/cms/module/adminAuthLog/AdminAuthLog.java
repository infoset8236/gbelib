package kr.go.gbelib.app.cms.module.adminAuthLog;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class AdminAuthLog extends PagingUtils {

    private int idx;
    private String os;
    private String browser;
    private String ip;
    private String add_date;
    private String group_name;
    private String menu;
    private String auth;
    private String type;
    private String add_id;
    private String module_type;
    private String homepage_name;

    private int member_group_idx;
    private String site_id;
    private int menu_idx;
    private int module_idx;
    private String auth_code_id;
    private String moduleType = "CMS";
    private String add_dttm;

    private String module_name;
    private String menu_name;
    private String member_group_name;
    private String change_type;

    private String start_date;
    private String end_date;

    private String search_type_1;

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

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAdd_id() {
        return add_id;
    }

    public void setAdd_id(String add_id) {
        this.add_id = add_id;
    }

    public int getMember_group_idx() {
        return member_group_idx;
    }

    public void setMember_group_idx(int member_group_idx) {
        this.member_group_idx = member_group_idx;
    }

    public String getSite_id() {
        return site_id;
    }

    public void setSite_id(String site_id) {
        this.site_id = site_id;
    }

    public int getMenu_idx() {
        return menu_idx;
    }

    public void setMenu_idx(int menu_idx) {
        this.menu_idx = menu_idx;
    }

    public int getModule_idx() {
        return module_idx;
    }

    public void setModule_idx(int module_idx) {
        this.module_idx = module_idx;
    }

    public String getAuth_code_id() {
        return auth_code_id;
    }

    public void setAuth_code_id(String auth_code_id) {
        this.auth_code_id = auth_code_id;
    }

    public String getModuleType() {
        return moduleType;
    }

    public void setModuleType(String moduleType) {
        this.moduleType = moduleType;
    }

    public String getAdd_dttm() {
        return add_dttm;
    }

    public void setAdd_dttm(String add_dttm) {
        this.add_dttm = add_dttm;
    }

    public String getChange_type() {
        return change_type;
    }

    public void setChange_type(String change_type) {
        this.change_type = change_type;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getMember_group_name() {
        return member_group_name;
    }

    public void setMember_group_name(String member_group_name) {
        this.member_group_name = member_group_name;
    }

    public String getModule_name() {
        return module_name;
    }

    public void setModule_name(String module_name) {
        this.module_name = module_name;
    }

    public String getModule_type() {
        return module_type;
    }

    public void setModule_type(String module_type) {
        this.module_type = module_type;
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

    public String getSearch_type_1() {
        return search_type_1;
    }

    public void setSearch_type_1(String search_type_1) {
        this.search_type_1 = search_type_1;
    }

    public String getHomepage_name() {
        return homepage_name;
    }

    public void setHomepage_name(String homepage_name) {
        this.homepage_name = homepage_name;
    }
}
