package kr.go.gbelib.app.cms.module.memberGroupAuthLog;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class MemberGroupAuthLog extends PagingUtils {

    private int member_group_auth_log_idx;
    private String member_id;
    private String add_date;
    private String add_ip;
    private String mod_id;
    private String authGroupIdxList;
    private String authGroupIdxModList;

    private String start_date;
    private String end_date;

    private String added_auth;
    private String removed_auth;

    public int getMember_group_auth_log_idx() {
        return member_group_auth_log_idx;
    }

    public void setMember_group_auth_log_idx(int member_group_auth_log_idx) {
        this.member_group_auth_log_idx = member_group_auth_log_idx;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getAdd_date() {
        return add_date;
    }

    public void setAdd_date(String add_date) {
        this.add_date = add_date;
    }

    public String getAdd_ip() {
        return add_ip;
    }

    public void setAdd_ip(String add_ip) {
        this.add_ip = add_ip;
    }

    public String getMod_id() {
        return mod_id;
    }

    public void setMod_id(String mod_id) {
        this.mod_id = mod_id;
    }

    public String getAuthGroupIdxList() {
        return authGroupIdxList;
    }

    public void setAuthGroupIdxList(String authGroupIdxList) {
        this.authGroupIdxList = authGroupIdxList;
    }

    public String getAuthGroupIdxModList() {
        return authGroupIdxModList;
    }

    public void setAuthGroupIdxModList(String authGroupIdxModList) {
        this.authGroupIdxModList = authGroupIdxModList;
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

    public String getAdded_auth() {
        return added_auth;
    }

    public void setAdded_auth(String added_auth) {
        this.added_auth = added_auth;
    }

    public String getRemoved_auth() {
        return removed_auth;
    }

    public void setRemoved_auth(String removed_auth) {
        this.removed_auth = removed_auth;
    }
}
