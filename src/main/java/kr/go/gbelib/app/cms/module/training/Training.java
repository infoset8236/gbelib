package kr.go.gbelib.app.cms.module.training;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.whalesoft.framework.utils.PagingUtils;

public class Training extends PagingUtils {

	private List<Integer> category_idx_list;
	private String searchCate1;
	private String searchCate2;
	private String searchCate3;
	private String searchAge;
	private String group_idx_list;
	private int large_category_idx;  //강좌대분류idx
	private String large_category_name; //강좌대분류이름
	private int group_idx; //강좌중분류IDX
	private String group_name;//강좌중분류이름
	private int category_idx;  //강좌소분류IDX
	private String category_name; //강좌소분류이름
	private int teach_idx; // 데이터값을 받아오기 위한 teach_idx
	private int training_idx;  //강좌IDX
	private String training_name;  //강좌제목
	private String training_desc;  //강좌설명
	private String training_etc;  //준비물및재료비
	private String training_stage;  //강좌장소
	private String training_target;  //강좌대상
	private String training_status;  //강좌상태
	private int training_limit_count;  //강좌모집인원
	private String training_join_unit;  //강좌모집단위
	private int training_backup_count;  //강좌후보인원
	private int training_offline_count; //강좌오프라인인원
	private int training_join_count;  // 현재강좌신청인원
	private int training_backup_join_count; // 현재강좌후보신청인원
	private int training_off_join_count; // 현재강좌 오프라인 신청인원
	private int teacher_idx;  //강사IDX
	private String teacher_name;  //강사명
	private String teacher_birth;  //강사생년월일
	private int training_same_limit_count; //동일강좌신청제한 값
	private String training_join_limit_unit = "NONE"; //접수 제한 단위
	private String training_join_limit_value; //접수 제한 값
	private String start_join_date;  //접수시작일
	private String start_join_time;  //접수시작시간
	private String end_join_date;  //접수종료일
	private String end_join_time;  //접수종료시간
	private String cancle_use_yn = "N"; //취소사용여부
	private String start_cancle_date;  //취소시작일
	private String start_cancle_time;  //취소시작시간
	private String end_cancle_date;  //취소종료일
	private String end_cancle_time;  //취소종료시간
	private String cancle_guid; // 취소안내내용
	private String add_guide; // 등록안내내용
	private String apply_limit = "N"; // 신규신청제한
	private int sms_flag;	// sms전송상태
	private String training_day;  //강의요일
	private String start_date;  //강의시작일
	private String start_time;  //강의시작시간
	private String end_date;  //강의종료일
	private String end_time;  //강의종료시간
	private int training_count;
	private String plan_file_name;  //강의계획서파일명
	private String real_file_name; //실제파일명
	private String file_extension;  //파일확장자
	private long file_size;  //파일 사이즈
	private String image_plan_file_name;  //강의이미지파일명
	private String image_real_file_name; //실제파일명
	private String image_file_extension;  //파일확장자
	private long image_file_size;  //파일 사이즈
	private String member_yn = "N";  //정회원전용여부
	private String use_yn = "Y";  //사용여부
	private int print_seq;
	private String certificate_yn = "N";  //수료증발급여부
	private String survey_idx;  //설문조사IDX
	private String add_date;  //등록일
	private String add_id;  //등록자
	private String mod_date;  //수정일
	private String mod_id;  //수정자
	private String training_course; // 이수증 연수과정(제목)
	private String training_period; // 이수증 연수기간(제목)
	private String certificate_text; // 이수증 내용

	private String family_yn = "N"; //가족 프로그램 여부(부모동의)
	private String family_count_yn = "N"; //가족 프로그램 여부
	private String agent_yn = "N";//대리신청여부
	private String school_info_yn = "N";//학교 입력여부
	private String school_grade_yn = "N";//학년 입력여부
	private String limit_hak_yn = "N"; //학년제한사용여부
	private String limit_hak; //학년제한from
	private String limit_hak2; //학년제한to
	private String limit_hak_str; //학년제한from
	private String limit_hak2_str; //학년제한to
	private String calendar_view_yn = "Y";//달력 표시 여부
	private String remark_yn = "N";//비고 입력여부
	private String neis_location_yn = "N";//비고 입력여부
	private String neis_cd_yn = "N";//비고 입력여부
	private String neis_training_num_yn = "N";//나이스 연수지명번호
	private String organization_yn = "N";//기관 입력여부
	private String rank_yn = "N";//직급 입력여부
	private String course_taken_yn = "N";//연수수강여부 입력여부

	private String delete_yn;

	private MultipartFile plan_file;
	private MultipartFile image_plan_file;

	private String[] training_day_arr;

	private String member_id;
	private String status;

	private String member_key;

	private String searchStatus = "Y";

	private String student_idx;
	private String student_status; // 수료증 발급 가능 여부 판단용 변수 (MyLibrary)에서 사용

	private int main_view_count;

	private String student_name;
	private String student_birth;
	private String student_sex;

	private String homepage_alias;
	private String homepage_name;
	private String context_path;
	
	private int wait_num; // 대기자 번호

	// 통합검색 - 상세검색용 변수
	private String searchKeyword1;//searchType1 의 검색어
	private String searchKeyword2;//searchType2 의 검색어
	private String searchKeyword3;//searchType3 의 검색어
	private String searchKeyword4;//searchType4 의 검색어
	private String logicFunction1;//searchKeyowrd1 뒤의 조건절 (AND, OR, NOT 중 택 1)
	private String logicFunction2;//searchKeyowrd2 뒤의 조건절 (AND, OR, NOT 중 택 1)
	private String logicFunction3;//searchKeyowrd3 뒤의 조건절 (AND, OR, NOT 중 택 1)
	private String logicFunction4;//searchKeyowrd4 뒤의 조건절 (AND, OR, NOT 중 택 1)

	private String searchDateFrom;
	private String searchDateTo;

	private String holiday;
	private List<String> holidays;

	private String program_classification1;//프로그램 대분류(TeachLargeCode)
	private String program_classification2;//프로그램 중분류(TrainingMidCode)
	private String program_classification3;//프로그램 소분류(TrainingSmallCode)
	private String program_subject;//프로그램 주제구분(TrainingCode2)
	private String program_age_div;//프로그램 연령구분(TrainingCode2)
	private List<String> program_age_div_arr;//프로그램 연령구분(TrainingCode2)
	private String program_classification1_name;//프로그램 대분류(TrainingLargeCode)
	private String program_classification2_name;//프로그램 중분류(TrainingMidCode)
	private String program_classification3_name;//프로그램 소분류(TrainingSmallCode)
	private String program_subject_name;//프로그램 주제구분(TrainingCode2)

	private String belong_name;//소속기관명

	private String qr_check;
	private Integer qr_check_count;
	private String token;

	public Training() {}

	public Training(String homepage_id, int mainViewCount) {
		setHomepage_id(homepage_id);
		this.main_view_count = mainViewCount;
	}

	public Training(String homepage_id, int group_idx, int category_idx) {
		setHomepage_id(homepage_id);
		this.group_idx = group_idx;
		this.category_idx = category_idx;

	}

	public Training(String homepage_id, int group_idx, int category_idx, int training_idx) {
		setHomepage_id(homepage_id);
		this.group_idx = group_idx;
		this.category_idx = category_idx;
		this.training_idx = training_idx;
	}

	
	public List<Integer> getCategory_idx_list() {
		return category_idx_list;
	}

	
	public void setCategory_idx_list(List<Integer> category_idx_list) {
		this.category_idx_list = category_idx_list;
	}

	
	public String getSearchCate1() {
		return searchCate1;
	}

	
	public void setSearchCate1(String searchCate1) {
		this.searchCate1 = searchCate1;
	}

	
	public String getSearchCate2() {
		return searchCate2;
	}

	
	public void setSearchCate2(String searchCate2) {
		this.searchCate2 = searchCate2;
	}

	
	public String getSearchCate3() {
		return searchCate3;
	}

	
	public void setSearchCate3(String searchCate3) {
		this.searchCate3 = searchCate3;
	}

	
	public String getSearchAge() {
		return searchAge;
	}

	
	public void setSearchAge(String searchAge) {
		this.searchAge = searchAge;
	}

	
	public String getGroup_idx_list() {
		return group_idx_list;
	}

	
	public void setGroup_idx_list(String group_idx_list) {
		this.group_idx_list = group_idx_list;
	}

	
	public int getLarge_category_idx() {
		return large_category_idx;
	}

	
	public void setLarge_category_idx(int large_category_idx) {
		this.large_category_idx = large_category_idx;
	}

	
	public String getLarge_category_name() {
		return large_category_name;
	}

	
	public void setLarge_category_name(String large_category_name) {
		this.large_category_name = large_category_name;
	}

	
	public int getGroup_idx() {
		return group_idx;
	}

	
	public void setGroup_idx(int group_idx) {
		this.group_idx = group_idx;
	}

	
	public String getGroup_name() {
		return group_name;
	}

	
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	
	public int getCategory_idx() {
		return category_idx;
	}

	
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	
	public String getCategory_name() {
		return category_name;
	}

	
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	
	public int getTeach_idx() {
		return teach_idx;
	}

	
	public void setTeach_idx(int teach_idx) {
		this.teach_idx = teach_idx;
	}

	
	public int getTraining_idx() {
		return training_idx;
	}

	
	public void setTraining_idx(int training_idx) {
		this.training_idx = training_idx;
	}

	
	public String getTraining_name() {
		return training_name;
	}

	
	public void setTraining_name(String training_name) {
		this.training_name = training_name;
	}

	
	public String getTraining_desc() {
		return training_desc;
	}

	
	public void setTraining_desc(String training_desc) {
		this.training_desc = training_desc;
	}

	
	public String getTraining_etc() {
		return training_etc;
	}

	
	public void setTraining_etc(String training_etc) {
		this.training_etc = training_etc;
	}

	
	public String getTraining_stage() {
		return training_stage;
	}

	
	public void setTraining_stage(String training_stage) {
		this.training_stage = training_stage;
	}

	
	public String getTraining_target() {
		return training_target;
	}

	
	public void setTraining_target(String training_target) {
		this.training_target = training_target;
	}

	
	public String getTraining_status() {
		return training_status;
	}

	
	public void setTraining_status(String training_status) {
		this.training_status = training_status;
	}

	
	public int getTraining_limit_count() {
		return training_limit_count;
	}

	
	public void setTraining_limit_count(int training_limit_count) {
		this.training_limit_count = training_limit_count;
	}

	
	public String getTraining_join_unit() {
		return training_join_unit;
	}

	
	public void setTraining_join_unit(String training_join_unit) {
		this.training_join_unit = training_join_unit;
	}

	
	public int getTraining_backup_count() {
		return training_backup_count;
	}

	
	public void setTraining_backup_count(int training_backup_count) {
		this.training_backup_count = training_backup_count;
	}

	
	public int getTraining_offline_count() {
		return training_offline_count;
	}

	
	public void setTraining_offline_count(int training_offline_count) {
		this.training_offline_count = training_offline_count;
	}

	
	public int getTraining_join_count() {
		return training_join_count;
	}

	
	public void setTraining_join_count(int training_join_count) {
		this.training_join_count = training_join_count;
	}

	
	public int getTraining_backup_join_count() {
		return training_backup_join_count;
	}

	
	public void setTraining_backup_join_count(int training_backup_join_count) {
		this.training_backup_join_count = training_backup_join_count;
	}

	
	public int getTraining_off_join_count() {
		return training_off_join_count;
	}

	
	public void setTraining_off_join_count(int training_off_join_count) {
		this.training_off_join_count = training_off_join_count;
	}

	
	public int getTeacher_idx() {
		return teacher_idx;
	}

	
	public void setTeacher_idx(int teacher_idx) {
		this.teacher_idx = teacher_idx;
	}

	
	public String getTeacher_name() {
		return teacher_name;
	}

	
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	
	public String getTeacher_birth() {
		return teacher_birth;
	}

	
	public void setTeacher_birth(String teacher_birth) {
		this.teacher_birth = teacher_birth;
	}

	
	public int getTraining_same_limit_count() {
		return training_same_limit_count;
	}

	
	public void setTraining_same_limit_count(int training_same_limit_count) {
		this.training_same_limit_count = training_same_limit_count;
	}

	
	public String getTraining_join_limit_unit() {
		return training_join_limit_unit;
	}

	
	public void setTraining_join_limit_unit(String training_join_limit_unit) {
		this.training_join_limit_unit = training_join_limit_unit;
	}

	
	public String getTraining_join_limit_value() {
		return training_join_limit_value;
	}

	
	public void setTraining_join_limit_value(String training_join_limit_value) {
		this.training_join_limit_value = training_join_limit_value;
	}

	
	public String getStart_join_date() {
		return start_join_date;
	}

	
	public void setStart_join_date(String start_join_date) {
		this.start_join_date = start_join_date;
	}

	
	public String getStart_join_time() {
		return start_join_time;
	}

	
	public void setStart_join_time(String start_join_time) {
		this.start_join_time = start_join_time;
	}

	
	public String getEnd_join_date() {
		return end_join_date;
	}

	
	public void setEnd_join_date(String end_join_date) {
		this.end_join_date = end_join_date;
	}

	
	public String getEnd_join_time() {
		return end_join_time;
	}

	
	public void setEnd_join_time(String end_join_time) {
		this.end_join_time = end_join_time;
	}

	
	public String getCancle_use_yn() {
		return cancle_use_yn;
	}

	
	public void setCancle_use_yn(String cancle_use_yn) {
		this.cancle_use_yn = cancle_use_yn;
	}

	
	public String getStart_cancle_date() {
		return start_cancle_date;
	}

	
	public void setStart_cancle_date(String start_cancle_date) {
		this.start_cancle_date = start_cancle_date;
	}

	
	public String getStart_cancle_time() {
		return start_cancle_time;
	}

	
	public void setStart_cancle_time(String start_cancle_time) {
		this.start_cancle_time = start_cancle_time;
	}

	
	public String getEnd_cancle_date() {
		return end_cancle_date;
	}

	
	public void setEnd_cancle_date(String end_cancle_date) {
		this.end_cancle_date = end_cancle_date;
	}

	
	public String getEnd_cancle_time() {
		return end_cancle_time;
	}

	
	public void setEnd_cancle_time(String end_cancle_time) {
		this.end_cancle_time = end_cancle_time;
	}

	
	public String getCancle_guid() {
		return cancle_guid;
	}

	
	public void setCancle_guid(String cancle_guid) {
		this.cancle_guid = cancle_guid;
	}

	
	public String getApply_limit() {
		return apply_limit;
	}

	
	public void setApply_limit(String apply_limit) {
		this.apply_limit = apply_limit;
	}

	
	public int getSms_flag() {
		return sms_flag;
	}

	
	public void setSms_flag(int sms_flag) {
		this.sms_flag = sms_flag;
	}

	
	public String getTraining_day() {
		return training_day;
	}

	
	public void setTraining_day(String training_day) {
		this.training_day = training_day;
	}

	
	public String getStart_date() {
		return start_date;
	}

	
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	
	public String getStart_time() {
		return start_time;
	}

	
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	
	public String getEnd_date() {
		return end_date;
	}

	
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	
	public String getEnd_time() {
		return end_time;
	}

	
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	
	public int getTraining_count() {
		return training_count;
	}

	
	public void setTraining_count(int training_count) {
		this.training_count = training_count;
	}

	
	public String getPlan_file_name() {
		return plan_file_name;
	}

	
	public void setPlan_file_name(String plan_file_name) {
		this.plan_file_name = plan_file_name;
	}

	
	public String getReal_file_name() {
		return real_file_name;
	}

	
	public void setReal_file_name(String real_file_name) {
		this.real_file_name = real_file_name;
	}

	
	public String getFile_extension() {
		return file_extension;
	}

	
	public void setFile_extension(String file_extension) {
		this.file_extension = file_extension;
	}

	
	public long getFile_size() {
		return file_size;
	}

	
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	
	public String getImage_plan_file_name() {
		return image_plan_file_name;
	}

	
	public void setImage_plan_file_name(String image_plan_file_name) {
		this.image_plan_file_name = image_plan_file_name;
	}

	
	public String getImage_real_file_name() {
		return image_real_file_name;
	}

	
	public void setImage_real_file_name(String image_real_file_name) {
		this.image_real_file_name = image_real_file_name;
	}

	
	public String getImage_file_extension() {
		return image_file_extension;
	}

	
	public void setImage_file_extension(String image_file_extension) {
		this.image_file_extension = image_file_extension;
	}

	
	public long getImage_file_size() {
		return image_file_size;
	}

	
	public void setImage_file_size(long image_file_size) {
		this.image_file_size = image_file_size;
	}

	
	public String getMember_yn() {
		return member_yn;
	}

	
	public void setMember_yn(String member_yn) {
		this.member_yn = member_yn;
	}

	
	public String getUse_yn() {
		return use_yn;
	}

	
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	
	public int getPrint_seq() {
		return print_seq;
	}

	
	public void setPrint_seq(int print_seq) {
		this.print_seq = print_seq;
	}

	
	public String getCertificate_yn() {
		return certificate_yn;
	}

	
	public void setCertificate_yn(String certificate_yn) {
		this.certificate_yn = certificate_yn;
	}

	
	public String getSurvey_idx() {
		return survey_idx;
	}

	
	public void setSurvey_idx(String survey_idx) {
		this.survey_idx = survey_idx;
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

	
	public String getMod_date() {
		return mod_date;
	}

	
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}

	
	public String getMod_id() {
		return mod_id;
	}

	
	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}

	
	public String getFamily_yn() {
		return family_yn;
	}

	
	public void setFamily_yn(String family_yn) {
		this.family_yn = family_yn;
	}

	
	public String getFamily_count_yn() {
		return family_count_yn;
	}

	
	public void setFamily_count_yn(String family_count_yn) {
		this.family_count_yn = family_count_yn;
	}

	
	public String getAgent_yn() {
		return agent_yn;
	}

	
	public void setAgent_yn(String agent_yn) {
		this.agent_yn = agent_yn;
	}

	
	public String getSchool_info_yn() {
		return school_info_yn;
	}

	
	public void setSchool_info_yn(String school_info_yn) {
		this.school_info_yn = school_info_yn;
	}

	
	public String getSchool_grade_yn() {
		return school_grade_yn;
	}

	
	public void setSchool_grade_yn(String school_grade_yn) {
		this.school_grade_yn = school_grade_yn;
	}

	
	public String getLimit_hak_yn() {
		return limit_hak_yn;
	}

	
	public void setLimit_hak_yn(String limit_hak_yn) {
		this.limit_hak_yn = limit_hak_yn;
	}

	
	public String getLimit_hak() {
		return limit_hak;
	}

	
	public void setLimit_hak(String limit_hak) {
		this.limit_hak = limit_hak;
	}

	
	public String getLimit_hak2() {
		return limit_hak2;
	}

	
	public void setLimit_hak2(String limit_hak2) {
		this.limit_hak2 = limit_hak2;
	}

	
	public String getLimit_hak_str() {
		return limit_hak_str;
	}

	
	public void setLimit_hak_str(String limit_hak_str) {
		this.limit_hak_str = limit_hak_str;
	}

	
	public String getLimit_hak2_str() {
		return limit_hak2_str;
	}

	
	public void setLimit_hak2_str(String limit_hak2_str) {
		this.limit_hak2_str = limit_hak2_str;
	}

	
	public String getCalendar_view_yn() {
		return calendar_view_yn;
	}

	
	public void setCalendar_view_yn(String calendar_view_yn) {
		this.calendar_view_yn = calendar_view_yn;
	}

	
	public String getRemark_yn() {
		return remark_yn;
	}

	
	public void setRemark_yn(String remark_yn) {
		this.remark_yn = remark_yn;
	}

	
	public String getNeis_location_yn() {
		return neis_location_yn;
	}

	
	public void setNeis_location_yn(String neis_location_yn) {
		this.neis_location_yn = neis_location_yn;
	}

	
	public String getNeis_cd_yn() {
		return neis_cd_yn;
	}

	
	public void setNeis_cd_yn(String neis_cd_yn) {
		this.neis_cd_yn = neis_cd_yn;
	}

	
	public String getNeis_training_num_yn() {
		return neis_training_num_yn;
	}

	
	public void setNeis_training_num_yn(String neis_training_num_yn) {
		this.neis_training_num_yn = neis_training_num_yn;
	}

	
	public String getOrganization_yn() {
		return organization_yn;
	}

	
	public void setOrganization_yn(String organization_yn) {
		this.organization_yn = organization_yn;
	}

	
	public String getRank_yn() {
		return rank_yn;
	}

	
	public void setRank_yn(String rank_yn) {
		this.rank_yn = rank_yn;
	}

	
	public String getCourse_taken_yn() {
		return course_taken_yn;
	}

	
	public void setCourse_taken_yn(String course_taken_yn) {
		this.course_taken_yn = course_taken_yn;
	}

	
	public String getDelete_yn() {
		return delete_yn;
	}

	
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}

	
	public MultipartFile getPlan_file() {
		return plan_file;
	}

	
	public void setPlan_file(MultipartFile plan_file) {
		this.plan_file = plan_file;
	}

	
	public MultipartFile getImage_plan_file() {
		return image_plan_file;
	}

	
	public void setImage_plan_file(MultipartFile image_plan_file) {
		this.image_plan_file = image_plan_file;
	}

	
	public String[] getTraining_day_arr() {
		return training_day_arr;
	}

	
	public void setTraining_day_arr(String[] training_day_arr) {
		this.training_day_arr = training_day_arr;
	}

	
	public String getMember_id() {
		return member_id;
	}

	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	
	public String getStatus() {
		return status;
	}

	
	public void setStatus(String status) {
		this.status = status;
	}

	
	public String getMember_key() {
		return member_key;
	}

	
	public void setMember_key(String member_key) {
		this.member_key = member_key;
	}

	
	public String getSearchStatus() {
		return searchStatus;
	}

	
	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}

	
	public String getStudent_idx() {
		return student_idx;
	}

	
	public void setStudent_idx(String student_idx) {
		this.student_idx = student_idx;
	}

	
	public String getStudent_status() {
		return student_status;
	}

	
	public void setStudent_status(String student_status) {
		this.student_status = student_status;
	}

	
	public int getMain_view_count() {
		return main_view_count;
	}

	
	public void setMain_view_count(int main_view_count) {
		this.main_view_count = main_view_count;
	}

	
	public String getStudent_name() {
		return student_name;
	}

	
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	
	public String getStudent_birth() {
		return student_birth;
	}

	
	public void setStudent_birth(String student_birth) {
		this.student_birth = student_birth;
	}

	
	public String getStudent_sex() {
		return student_sex;
	}

	
	public void setStudent_sex(String student_sex) {
		this.student_sex = student_sex;
	}

	
	public String getHomepage_alias() {
		return homepage_alias;
	}

	
	public void setHomepage_alias(String homepage_alias) {
		this.homepage_alias = homepage_alias;
	}

	
	public String getHomepage_name() {
		return homepage_name;
	}

	
	public void setHomepage_name(String homepage_name) {
		this.homepage_name = homepage_name;
	}

	
	public String getContext_path() {
		return context_path;
	}

	
	public void setContext_path(String context_path) {
		this.context_path = context_path;
	}

	
	public int getWait_num() {
		return wait_num;
	}

	
	public void setWait_num(int wait_num) {
		this.wait_num = wait_num;
	}

	
	public String getSearchKeyword1() {
		return searchKeyword1;
	}

	
	public void setSearchKeyword1(String searchKeyword1) {
		this.searchKeyword1 = searchKeyword1;
	}

	
	public String getSearchKeyword2() {
		return searchKeyword2;
	}

	
	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}

	
	public String getSearchKeyword3() {
		return searchKeyword3;
	}

	
	public void setSearchKeyword3(String searchKeyword3) {
		this.searchKeyword3 = searchKeyword3;
	}

	
	public String getSearchKeyword4() {
		return searchKeyword4;
	}

	
	public void setSearchKeyword4(String searchKeyword4) {
		this.searchKeyword4 = searchKeyword4;
	}

	
	public String getLogicFunction1() {
		return logicFunction1;
	}

	
	public void setLogicFunction1(String logicFunction1) {
		this.logicFunction1 = logicFunction1;
	}

	
	public String getLogicFunction2() {
		return logicFunction2;
	}

	
	public void setLogicFunction2(String logicFunction2) {
		this.logicFunction2 = logicFunction2;
	}

	
	public String getLogicFunction3() {
		return logicFunction3;
	}

	
	public void setLogicFunction3(String logicFunction3) {
		this.logicFunction3 = logicFunction3;
	}

	
	public String getLogicFunction4() {
		return logicFunction4;
	}

	
	public void setLogicFunction4(String logicFunction4) {
		this.logicFunction4 = logicFunction4;
	}

	
	public String getSearchDateFrom() {
		return searchDateFrom;
	}

	
	public void setSearchDateFrom(String searchDateFrom) {
		this.searchDateFrom = searchDateFrom;
	}

	
	public String getSearchDateTo() {
		return searchDateTo;
	}

	
	public void setSearchDateTo(String searchDateTo) {
		this.searchDateTo = searchDateTo;
	}

	
	public String getHoliday() {
		return holiday;
	}

	
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	
	public List<String> getHolidays() {
		return holidays;
	}

	
	public void setHolidays(List<String> holidays) {
		this.holidays = holidays;
	}

	
	public String getProgram_classification1() {
		return program_classification1;
	}

	
	public void setProgram_classification1(String program_classification1) {
		this.program_classification1 = program_classification1;
	}

	
	public String getProgram_classification2() {
		return program_classification2;
	}

	
	public void setProgram_classification2(String program_classification2) {
		this.program_classification2 = program_classification2;
	}

	
	public String getProgram_classification3() {
		return program_classification3;
	}

	
	public void setProgram_classification3(String program_classification3) {
		this.program_classification3 = program_classification3;
	}

	
	public String getProgram_subject() {
		return program_subject;
	}

	
	public void setProgram_subject(String program_subject) {
		this.program_subject = program_subject;
	}

	
	public String getProgram_age_div() {
		return program_age_div;
	}

	
	public void setProgram_age_div(String program_age_div) {
		this.program_age_div = program_age_div;
	}

	
	public List<String> getProgram_age_div_arr() {
		return program_age_div_arr;
	}

	
	public void setProgram_age_div_arr(List<String> program_age_div_arr) {
		this.program_age_div_arr = program_age_div_arr;
	}

	
	public String getProgram_classification1_name() {
		return program_classification1_name;
	}

	
	public void setProgram_classification1_name(String program_classification1_name) {
		this.program_classification1_name = program_classification1_name;
	}

	
	public String getProgram_classification2_name() {
		return program_classification2_name;
	}

	
	public void setProgram_classification2_name(String program_classification2_name) {
		this.program_classification2_name = program_classification2_name;
	}

	
	public String getProgram_classification3_name() {
		return program_classification3_name;
	}

	
	public void setProgram_classification3_name(String program_classification3_name) {
		this.program_classification3_name = program_classification3_name;
	}

	
	public String getProgram_subject_name() {
		return program_subject_name;
	}

	
	public void setProgram_subject_name(String program_subject_name) {
		this.program_subject_name = program_subject_name;
	}

	public String getAdd_guide() {
		return add_guide;
	}

	public void setAdd_guide(String add_guide) {
		this.add_guide = add_guide;
	}

	public String getCertificate_text() {
		return certificate_text;
	}

	public void setCertificate_text(String certificate_text) {
		this.certificate_text = certificate_text;
	}

	public String getTraining_course() {
		return training_course;
	}

	public void setTraining_course(String tarining_course) {
		this.training_course = tarining_course;
	}

	public String getTraining_period() {
		return training_period;
	}

	public void setTraining_period(String training_period) {
		this.training_period = training_period;
	}

	public String getBelong_name() {
		return belong_name;
	}

	public void setBelong_name(String belong_name) {
		this.belong_name = belong_name;
	}

	public String getQr_check() {
		return qr_check;
	}

	public void setQr_check(String qr_check) {
		this.qr_check = qr_check;
	}

	public Integer getQr_check_count() {
		return qr_check_count;
	}

	public void setQr_check_count(Integer qr_check_count) {
		this.qr_check_count = qr_check_count;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
}