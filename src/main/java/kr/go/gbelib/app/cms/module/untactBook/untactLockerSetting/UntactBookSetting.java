package kr.go.gbelib.app.cms.module.untactBook.untactLockerSetting;

public class UntactBookSetting {

	private String homepage_id;  		//홈페이지ID
	private String locker_use_yn;  		//사물함 사용여부
	private int row_count;  			//가로_갯수
	private int total_count; 			//총_갯수
	private int reservation_max_count;  //일일_최대_대출가능_권수
	private String loan_time;  			//대출가능시간
	private String locker_use_type;		//사물함 타입
	
	private String start_hour;			//대출가능 시작(시)
	private String start_minute;		//대출가능 시작(분)
	private String end_hour;			//대출가능 종료(시)
	private String end_minute;			//대출가능 종료(분)
	
	private String vFromPhone;
	private String password_yn;
	private String sms_use_yn;
	private String rentalPlace;
	
	public String getLocker_use_yn() {
		return locker_use_yn;
	}

	public void setLocker_use_yn(String locker_use_yn) {
		this.locker_use_yn = locker_use_yn;
	}

	public String getHomepage_id() {
		return homepage_id;
	}

	public void setHomepage_id(String homepage_id) {
		this.homepage_id = homepage_id;
	}

	public Integer getRow_count() {
		return row_count;
	}

	public void setRow_count(Integer row_count) {
		this.row_count = row_count;
	}

	public Integer getTotal_count() {
		return total_count;
	}

	public void setTotal_count(Integer total_count) {
		this.total_count = total_count;
	}

	public int getReservation_max_count() {
		return reservation_max_count;
	}

	public void setReservation_max_count(int reservation_max_count) {
		this.reservation_max_count = reservation_max_count;
	}

	public String getLoan_time() {
		return loan_time;
	}

	public void setLoan_time(String loan_time) {
		this.loan_time = loan_time;
	}

	public void setRow_count(int row_count) {
		this.row_count = row_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public String getStart_hour() {
		return start_hour;
	}

	public void setStart_hour(String start_hour) {
		this.start_hour = start_hour;
	}

	public String getStart_minute() {
		return start_minute;
	}

	public void setStart_minute(String start_minute) {
		this.start_minute = start_minute;
	}

	public String getEnd_hour() {
		return end_hour;
	}

	public void setEnd_hour(String end_hour) {
		this.end_hour = end_hour;
	}

	public String getEnd_minute() {
		return end_minute;
	}

	public void setEnd_minute(String end_minute) {
		this.end_minute = end_minute;
	}

	public String getLocker_use_type() {
		return locker_use_type;
	}

	public void setLocker_use_type(String locker_use_type) {
		this.locker_use_type = locker_use_type;
	}

	public String getvFromPhone() {
		return vFromPhone;
	}

	public void setvFromPhone(String vFromPhone) {
		this.vFromPhone = vFromPhone;
	}

	public String getPassword_yn() {
		return password_yn;
	}

	public void setPassword_yn(String password_yn) {
		this.password_yn = password_yn;
	}

	public String getRentalPlace() {
		return rentalPlace;
	}

	public void setRentalPlace(String rentalPlace) {
		this.rentalPlace = rentalPlace;
	}

	public String getSms_use_yn() {
		return sms_use_yn;
	}

	public void setSms_use_yn(String sms_use_yn) {
		this.sms_use_yn = sms_use_yn;
	}
	
}