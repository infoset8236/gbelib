package kr.go.gbelib.app.roompad;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class RoomPad extends PagingUtils {
    private String subject;
    private String reserveStime;
    private String reserveEtime;
    private String masterName;
    private String memberCount;
    private String cal;
    private String room_id;

    private String room_day;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getReserveStime() {
        return reserveStime;
    }

    public void setReserveStime(String reserveStime) {
        this.reserveStime = reserveStime;
    }

    public String getReserveEtime() {
        return reserveEtime;
    }

    public void setReserveEtime(String reserveEtime) {
        this.reserveEtime = reserveEtime;
    }

    public String getMasterName() {
        return masterName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

    public String getMemberCount() {
        return memberCount;
    }

    public void setMemberCount(String memberCount) {
        this.memberCount = memberCount;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getCal() {
        return cal;
    }

    public void setCal(String cal) {
        this.cal = cal;
    }

    public String getRoom_day() {
        return room_day;
    }

    public void setRoom_day(String room_day) {
        this.room_day = room_day;
    }
}
