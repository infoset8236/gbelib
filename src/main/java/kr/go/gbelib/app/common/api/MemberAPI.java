package kr.go.gbelib.app.common.api;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;

import kr.co.whalesoft.app.cms.member.Member;

public class MemberAPI {
	protected final static Logger log = LoggerFactory.getLogger(MemberAPI.class);

	/**
	 * API로 부터 회원정보 조회
	 * @param workerId
	 * @param member
	 * @return Map<String, String>
	 */
	public static Map<String, String> getMember(String workerId, Member member) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserInfoD");
		param.put("vUserId", member.getUser_id());

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		if ( "0".equals(code) ) {
			return CommonAPI.getFieldData(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 회원정보 조회
	 * @param workerId
	 * @param member
	 * @return Map<String, String>
	 */
	public static List<Map<String, String>> getMemberList(String workerId, Member member) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserInfoD");
		param.put("vUserId", member.getUser_id());

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 이용자 인증
	 * @param workerId
	 * @param member
	 * @return Map<String, String>
	 */
	public static Map<String, String> getMemberCertify(String workerId, Member member) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserCertify");
		param.put("vType", member.getCheck_certify_type()); // EMAIL, MOBILE, WEBID, RFIDNO, SEQNO
		param.put("vData", member.getCheck_certify_data()); // 타입에 따른 값을 넣어줘야 한다.

		if ( StringUtils.isNotEmpty(member.getMember_id()) ) {
			param.put("vWebId", member.getMember_id());
		}
		if ( StringUtils.isNotEmpty(member.getBirth_day()) ) {
			param.put("vBirthd", member.getBirth_day());
		}
		if ( StringUtils.isNotEmpty(member.getMember_name()) ) {
//			param.put("vUserName", URLEncoder.encode(member.getMember_name()));
			try {
				param.put("vUserName", URLEncoder.encode(member.getMember_name(), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return null;
			}
		}

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldData(doc);
		}
		else {
			return null;
		}
	}
	
	/**
	 * 관리자 일루스 API로 부터 이용자 인증
	 * @param workerId
	 * @param member
	 * @return Map<String, String>
	 */
	public static Map<String, String> getLoginMemberCertify(String workerId, Member member) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("className", "action.lnk.LnkAdminList");
		param.put("vAdminId", member.getCheck_certify_data());
		param.put("USERID", workerId);

/*		if ( StringUtils.isNotEmpty(member.getMember_id()) ) {
			param.put("vWebId", member.getMember_id());
		}*/
/*		if ( StringUtils.isNotEmpty(member.getBirth_day()) ) {
			param.put("vBirthd", member.getBirth_day());
		}*/
		if ( StringUtils.isNotEmpty(member.getMember_name()) ) {
//			param.put("vUserName", URLEncoder.encode(member.getMember_name()));
			try {
				param.put("vUserName", URLEncoder.encode(member.getMember_name(), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return null;
			}
		}

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldData(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 비밀번호 확인
	 * @param workerId
	 * @param member
	 * @return boolean
	 */
	public static boolean checkMemberPasswd(String workerId, Member member) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkCheckUserPass");
		param.put("vUserId", member.getUser_id());
		param.put("vLocation", member.getLoca());
		param.put("vUserPass", CommonAPI.getCrypt(member.getMember_pw()));

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return true;
		}
		else {
			return false;
		}
	}

	/**
	 * API로 부터 회원 비밀번호 변경
	 * @param workerId WEB
	 * @param memberId userId
	 * @param memberPw 변경할 비밀번호
	 * @return boolean
	 */
	public static boolean updateMemberPasswd(String workerId, String memberId, String memberPw) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserPassMod");
		param.put("vUserId", memberId);
		param.put("vUserPass", CommonAPI.getCrypt(memberPw));

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return true;
		}
		else {
			return false;
		}
	}

	/**
	 * API로 부터 회원 가입
	 * @param workerId
	 * @param member
	 * @return boolean
	 */
	public static List<Map<String, String>> addMember(String workerId, Member member) {
		List<String> values = new ArrayList<String>();
		values.add(String.format("%s|%s", "USER_NAME", CommonAPI.getCrypt(member.getMember_name())));
		values.add(String.format("%s|%s", "PASSWORD", CommonAPI.getCrypt(member.getMember_pw())));
		values.add(String.format("%s|%s", "BIRTHD", CommonAPI.getCrypt(member.getBirth_day().replaceAll("-", ""))));
		values.add(String.format("%s|%s", "SEX", CommonAPI.getCrypt(member.getSex())));
		if (StringUtils.isNotEmpty(member.getPhone1()) && StringUtils.isNumeric(member.getPhone1())) {
			if (StringUtils.isNotEmpty(member.getPhone2()) && StringUtils.isNumeric(member.getPhone2())) {
				if (StringUtils.isNotEmpty(member.getPhone3()) && StringUtils.isNumeric(member.getPhone3())) {
					values.add(String.format("%s|%s", "TEL_NO", CommonAPI.getCrypt(String.format("%s%s%s", member.getPhone1(), member.getPhone2(), member.getPhone3()))));
				}
			}
		}

		values.add(String.format("%s|%s", "MOBILE_NO", CommonAPI.getCrypt(member.getCell_phone())));
		if (StringUtils.isNotEmpty(member.getEmail())) {
			if (!member.getEmail().equals("@")) {
				values.add(String.format("%s|%s", "EMAIL", CommonAPI.getCrypt(member.getEmail())));
			}
		}
		values.add(String.format("%s|%s", "ZIP_CODE", CommonAPI.getCrypt(member.getZipcode())));
		values.add(String.format("%s|%s", "ADDRS", CommonAPI.getCrypt(String.format("%s", member.getAddress1()))));
//		values.add(String.format("%s|%s", "WEB_HINT_TY", CommonAPI.getCrypt(member.getWeb_hint_ty())));
//		values.add(String.format("%s|%s", "WEB_HINT_ANS", CommonAPI.getCrypt(member.getWeb_hint_ans())));
		values.add(String.format("%s|%s", "DUPINFO", CommonAPI.getCrypt(member.getDi_value())));
		values.add(String.format("%s|%s", "CONN_INFO", CommonAPI.getCrypt(member.getCi_value())));
		if (!StringUtils.equals(member.getSms_service_yn(), "Y")) {
			member.setSms_service_yn("N");
		}
		values.add(String.format("%s|%s", "SMS_CHECK", CommonAPI.getCrypt(member.getSms_service_yn())));
		if (!StringUtils.equals(member.getEmail_service_yn(), "Y")) {
			member.setEmail_service_yn("N");
		}
		values.add(String.format("%s|%s", "MAIL_CHECK", CommonAPI.getCrypt(member.getEmail_service_yn())));
		values.add(String.format("%s|%s", "UN_AGREE_FLAG", CommonAPI.getCrypt("0001")));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		values.add(String.format("%s|%s", "UN_AGREE_DATE", CommonAPI.getCrypt(sdf.format(new Date()))));


		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserJoin");
		param.put("vId", member.getMember_id());
		param.put("vUserPos", "WEB");
		param.put("vLocation", member.getLoca());
//		param.put("vWorkType", "WEBID"); // null - 일련번호(기본), WEBID - USER_ID와 WEB_ID가 동일
		param.put("value", StringUtils.join(values, "><"));

		Document doc = CommonAPI.sendILUS(param);

//		String code = CommonAPI.getElementValueByName(doc, "code");
//		String msg = CommonAPI.getElementValueByName(doc, "msg");

		return CommonAPI.getFieldDataList(doc);


//		if ( "0".equals(code) ) {
//			return CommonAPI.getFieldDataList(doc);
//		}
//		else {
//			return null;
//		}
	}

	/**
	 * API로 부터 회원 수정
	 * @param workerId
	 * @param member
	 * @return boolean
	 */
	public static boolean updateMember(String workerId, Member member, boolean changePw) {
		List<String> values = new ArrayList<String>();
		if (StringUtils.isNotEmpty(member.getPhone1()) && StringUtils.isNumeric(member.getPhone1())) {
			if (StringUtils.isNotEmpty(member.getPhone2()) && StringUtils.isNumeric(member.getPhone2())) {
				if (StringUtils.isNotEmpty(member.getPhone3()) && StringUtils.isNumeric(member.getPhone3())) {
					values.add(String.format("%s|%s", "TEL_NO", CommonAPI.getCrypt(String.format("%s%s%s", member.getPhone1(), member.getPhone2(), member.getPhone3()))));
				}
			}
		}

		if (StringUtils.isNotEmpty(member.getBirth_day()) && member.getBirth_day().replaceAll("-", "").length() > 0) {
			values.add(String.format("%s|%s", "BIRTHD", CommonAPI.getCrypt(member.getBirth_day().replaceAll("-", ""))));
		}
		if (StringUtils.isNotEmpty(member.getSex())) {
			values.add(String.format("%s|%s", "SEX", CommonAPI.getCrypt(member.getSex())));
		}
		values.add(String.format("%s|%s", "MOBILE_NO", CommonAPI.getCrypt(String.format("%s%s%s", member.getCell_phone1(), member.getCell_phone2(), member.getCell_phone3()))));
		if (StringUtils.isNotEmpty(member.getEmail())) {
			if (!member.getEmail().equals("@")) {
				values.add(String.format("%s|%s", "EMAIL", CommonAPI.getCrypt(member.getEmail())));
			}
		}
		values.add(String.format("%s|%s", "ZIP_CODE", CommonAPI.getCrypt(member.getZipcode())));
		values.add(String.format("%s|%s", "ADDRS", CommonAPI.getCrypt(String.format("%s",member.getAddress1()))));

		if (changePw) {
			if (StringUtils.isNotEmpty(member.getMember_pw())) {
				values.add(String.format("%s|%s", "PASSWORD", CommonAPI.getCrypt(member.getMember_pw())));
			}
		}

		if (StringUtils.isNotEmpty(member.getCi_value())) {
			values.add(String.format("%s|%s", "CONN_INFO", CommonAPI.getCrypt(member.getCi_value())));
		}

		if (StringUtils.isNotEmpty(member.getDi_value())) {
			values.add(String.format("%s|%s", "DUPINFO", CommonAPI.getCrypt(member.getDi_value())));
		}

		if (StringUtils.isNotEmpty(member.getWeb_id())) {
			values.add(String.format("%s|%s", "WEB_ID", CommonAPI.getCrypt(member.getWeb_id())));
		}

		if (StringUtils.isNotEmpty(member.getLoca())) {
			values.add(String.format("%s|%s", "LOCA", CommonAPI.getCrypt(member.getLoca())));
		}

		if (StringUtils.isNotEmpty(member.getCard_password())) {
			values.add(String.format("%s|%s", "CARD_PASSWORD", CommonAPI.getCrypt(CommonAPI.getCryptSimplex(member.getCard_password()))));
		}

		if (!StringUtils.equals(member.getSms_service_yn(), "Y")) {
			member.setSms_service_yn("N");
		}
		values.add(String.format("%s|%s", "SMS_CHECK", CommonAPI.getCrypt(member.getSms_service_yn())));

		if (!StringUtils.equals(member.getEmail_service_yn(), "Y")) {
			member.setEmail_service_yn("N");
		}
		values.add(String.format("%s|%s", "MAIL_CHECK", CommonAPI.getCrypt(member.getEmail_service_yn())));

		if (StringUtils.isNotEmpty(member.getUnAgreeFlag())) {
			values.add(String.format("%s|%s", "UN_AGREE_FLAG", CommonAPI.getCrypt(member.getUnAgreeFlag())));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			values.add(String.format("%s|%s", "UN_AGREE_DATE", CommonAPI.getCrypt(sdf.format(new Date()))));
		}

		if (StringUtils.isNotEmpty(member.getvFamYn())) {
			values.add(String.format("%s|%s", "FAM_AGREE", CommonAPI.getCrypt(member.getvFamYn())));
		}

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserInfoDMod");
		param.put("vUserId", member.getUser_id());
		param.put("value", StringUtils.join(values, "><"));
		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return true;
		} else {
			try {
				log.error("@@@@@@@@@@@@@@@@ updateMember Failed : " + CommonAPI.getElementValueByName(doc, "msg"));
			} catch ( Exception e ) {
			}
			return false;
		}
	}

	/**
	 * API로 부터 회원 수정(이름만 변경)
	 * @param workerId
	 * @param member
	 * @return boolean
	 */
	public static boolean updateMemberName(String workerId, Member member) {
		List<String> values = new ArrayList<String>();
		if (StringUtils.isNotEmpty(member.getMember_name())) {
			values.add(String.format("%s|%s", "USER_NAME", CommonAPI.getCrypt(String.format("%s",member.getMember_name()))));
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("USERID", workerId);
			param.put("className", "action.lnk.LnkUserInfoDMod");
			param.put("vUserId", member.getUser_id());
			param.put("value", StringUtils.join(values, "><"));
			Document doc = CommonAPI.sendILUS(param);

			String code = CommonAPI.getElementValueByName(doc, "code");

			if ( "0".equals(code) ) {
				return true;
			} else {
				try {
					log.error("@@@@@@@@@@@@@@@@ updateMemberName Failed : " + CommonAPI.getElementValueByName(doc, "msg"));
				} catch ( Exception e ) {
				}
				return false;
			}
		} else {
			return false;
		}

	}

	/**
	 * API로 부터 회원 탈퇴
	 * @param workerId
	 * @param member
	 * @return boolean
	 */
	public static Map<String, String> deleteMember(String workerId, Member member) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserStatusMod");
		param.put("vType", "0002"); // 0002 - 회원 탈퇴
//		param.put("vUserId", StringUtils.leftPad(StringUtils.upperCase(member.getMember_id()), 12, "0"));
		param.put("vUserId", member.getUser_id());

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		String message = CommonAPI.getElementValueByName(doc, "message");

		Map<String, String> result = new HashMap<String, String>();
		result.put("code", code);
		result.put("message", message);

		if ( !"0".equals(code) ) {
			return result;
		} else {
			return null;
		}
	}

	/**
	 * API로 부터 ID 중복 확인
	 * @param workerId
	 * @param member
	 * @param type
	 * @return boolean
	 */
	public static boolean checkUserId(String workerId, Member member, String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkCheckUserId");
		param.put("vType", type); // WEBID, USERID
		param.put("vId", member.getMember_id());
		//param.put("vLocation", member.getLoca());

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return true;
		} else {
			try {
				log.error("@@@@@@@@@@@@@@@@ checkUserId Failed : " + CommonAPI.getElementValueByName(doc, "msg"));
			} catch ( Exception e ) {
			}
			return false;
		}
	}

	/**
	 * API로 부터 이용자 중복 확인
	 * @param workerId
	 * @param vType : (이름,생년월일,이동전화) - 0001, 이용자ID - 0002, DUPINFO - 0003, CONN_INFO - 0004, WEB_ID - 0005
	 * @param member.check_dup_ip(req) : 웹아이디, 0002~0005 값 선택시 필수.
	 * @param member.member_name(req)
	 * @param member.birth_day(req) : YYYYMMDD
	 * @param member.cell_phone(req) : 010XXXXYYYY
	 * @return boolean true : 중복있음, false: 중복있음
	 */
	public static boolean checkDupUser(String workerId, Member member, String vType, String vId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkCheckDupUser");
		param.put("vType", vType); // 생년월일 - 0001, 이용자ID - 0002, DUPINFO - 0003, CONN_INFO - 0004, WEB_ID - 0005
//		param.put("vId", URLEncoder.encode(vId));
//		param.put("vUserName", URLEncoder.encode(member.getMember_name()));// 0002~0005 값 선택시 필수.
		try {
			if (StringUtils.isNotEmpty(vId)) {
				param.put("vId", URLEncoder.encode(vId, "UTF-8"));
			}
			param.put("vUserName", URLEncoder.encode(member.getMember_name(), "UTF-8"));// 0002~0005 값 선택시 필수.
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return true;
		}
		param.put("vBirthDay", member.getBirth_day().replaceAll("-", ""));
		param.put("vMobileNo", member.getMobile_no());

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return false;
//			String count = CommonAPI.getElementValueByName(doc, "count"); // 중복자 수
//			if ( "0".equals(count) ) {
//				return false;
//			}
//			else {
//				return true;
//			}
		} else {
			return true;
		}
	}

	/**
	 * API로 부터 이용자 중복 확인
	 * @param workerId
	 * @param vType : 생년월일 - 0001, 이용자ID - 0002, DUPINFO - 0003, CONN_INFO - 0004, WEB_ID - 0005
	 * @param member.check_dup_ip(req) : 웹아이디, 0002~0005 값 선택시 필수.
	 * @param member.member_name(req)
	 * @param member.birth_day(req) : YYYYMMDD
	 * @param member.cell_phone(req) : 010XXXXYYYY
	 * @return boolean true : 중복있음, false: 중복있음
	 */
	public static Map<String, String> getDupUser(String workerId, Member member, String vType, String vId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkCheckDupUser");
		param.put("vType", vType); // 생년월일 - 0001, 이용자ID - 0002, DUPINFO - 0003, CONN_INFO - 0004, WEB_ID - 0005
//		param.put("vId", URLEncoder.encode(vId));
//		param.put("vUserName", URLEncoder.encode(member.getMember_name()));
		try {
			if (StringUtils.isNotEmpty(vId)) {
				param.put("vId", URLEncoder.encode(vId, "UTF-8"));
			}
			if (StringUtils.isNotEmpty(member.getMember_name())) {
				param.put("vUserName", URLEncoder.encode(member.getMember_name(), "UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if ( member.getBirth_day() != null ) {
			param.put("vBirthDay", member.getBirth_day().replaceAll("-", ""));
		}
		if ( member.getMobile_no() != null ) {
			param.put("vMobileNo", member.getMobile_no().replaceAll("-", ""));
		}

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( !"0".equals(code) ) {
			return CommonAPI.getFieldData(doc);
//			String count = CommonAPI.getElementValueByName(doc, "count"); // 중복자 수
//			if ( "0".equals(count) ) {
//				return false;
//			}
//			else {
//				return true;
//			}
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 이용자 중복 확인
	 * @param workerId
	 * @param vType : 생년월일 - 0001, 이용자ID - 0002, DUPINFO - 0003, CONN_INFO - 0004, WEB_ID - 0005
	 * @param member.check_dup_ip(req) : 웹아이디, 0002~0005 값 선택시 필수.
	 * @param member.member_name(req)
	 * @param member.birth_day(req) : YYYYMMDD
	 * @param member.cell_phone(req) : 010XXXXYYYY
	 * @return boolean true : 중복있음, false: 중복있음
	 */
	public static List<Map<String, String>> getDupUserList(String workerId, Member member, String vType, String vId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkCheckDupUser");
		param.put("vType", vType); // 생년월일 - 0001, 이용자ID - 0002, DUPINFO - 0003, CONN_INFO - 0004, WEB_ID - 0005
//		param.put("vId", URLEncoder.encode(vId));
//		param.put("vUserName", URLEncoder.encode(member.getMember_name()));
		try {
			if (StringUtils.isNotEmpty(vId)) {
				param.put("vId", URLEncoder.encode(vId, "UTF-8"));
			}
			if (member.getMember_name() != null) {
				param.put("vUserName", URLEncoder.encode(member.getMember_name(), "UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if ( member.getBirth_day() != null ) {
			param.put("vBirthDay", member.getBirth_day().replaceAll("-", ""));
		}
		if ( member.getMobile_no() != null ) {
			param.put("vMobileNo", member.getMobile_no().replaceAll("-", ""));
		} else if (member.getCell_phone() != null) {
			param.put("vMobileNo", member.getCell_phone().replaceAll("-", ""));
		}

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( !"0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
//			String count = CommonAPI.getElementValueByName(doc, "count"); // 중복자 수
//			if ( "0".equals(count) ) {
//				return false;
//			}
//			else {
//				return true;
//			}
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 개인정보 동의 항목을 조회
	 * @param workerId
	 * @return List<Map<String, String>>
	 */
	public static List<Map<String, String>> getPrtcNoticeList(String workerId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkGetPrtcNoticeList");

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 개인정보 동의 처리
	 * @param workerId
	 * @param member
	 * @param codeList
	 * @return boolean
	 */
	public static boolean agreePrtcInfo(String workerId, String vId, String vUserLoca, String[] codeList) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkInsertAgreePrtcInfo");
		param.put("vId", vId); // 0002~0005 값 선택시 필수.
		param.put("vUserLoca", vUserLoca);
		param.put("vCodes", StringUtils.join(codeList, "|"));

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		if ( "0".equals(code) ) {
			return true;
		}
		else {
			return false;
		}
	}

	/**
	 * API로 부터 개인정보 동의 처리
	 * @param workerId
	 * @param member
	 * @param codeList
	 * @return boolean
	 */
	public static ApiResponse agreePrtcInfoWithGrpCode(String workerId, Member member, String vGrpCode, String[] codeList) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkInsertAgreePrtcInfo");
		param.put("vId", member.getUser_id()); // 0002~0005 값 선택시 필수.
		param.put("vUserLoca", member.getLoca());
		param.put("vGrpCode", vGrpCode);
		param.put("vCodes", StringUtils.join(codeList, "|"));

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		if ( "0".equals(code) ) {
			return new ApiResponse(true);
		} else {
			return new ApiResponse(false, CommonAPI.getElementValueByName(doc, "message"));
		}
	}

	/**
	 * API로 부터 웹 코드 조회
	 * @param workerId
	 * @return List<Map<String, String>>
	 */
	public static List<Map<String, String>> getCodeWeb(String workerId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkGetCodeWeb");
		param.put("vModule", "member"); // 이용자 관리
		param.put("vDiv", "001"); // 이용자 확인 질문

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 소장처 정보 조회
	 * @param workerId
	 * @param search_type
	 * @param search_text
	 * @return List<Map<String, String>>
	 */
	public static List<Map<String, String>> getLibInfoQry(String workerId, String search_type, String search_text) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkLibInfoQry");
		param.put("vSearchType", search_type); // 0001 - 소장처, 0002 - 자료실, HOPE - 비치처 가능 소장처 리스트, OUT - 상호대차 수령처 가능 리스트
		if (StringUtils.isNotEmpty(search_text)) {
			param.put("vLocation", search_text); // 소장처 코드 - 자료실 리스트 시 사용
		}

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * SMS 전송
	 * @param workerId
	 * @param search_type
	 * @param search_text
	 * @return List<Map<String, String>>
	 */
	public static boolean sendSMS(String workerId, String vLocation, String vSmsCode, String vToPhone, String vFromPhone, String vMsg) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkSmsDataInsert");
		param.put("vLocation", vLocation); // 소장처 코드
		param.put("vSmsCode", vSmsCode); // SMS코드
		if(StringUtils.isNotEmpty(vToPhone)) {
			param.put("vToPhone", vToPhone.replaceAll("-", ""));
		}
		if(StringUtils.isNotEmpty(vFromPhone)) {
			param.put("vFromPhone", vFromPhone.replaceAll("-", "")); //
		}
		try {
			param.put("vMsg", URLEncoder.encode(vMsg, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return true;
		}
		else {
			return false;
		}
	}

	/**
	 * API로 부터 LAS코드 조회
	 * @return List<Map<String, String>>
	 */
	public static List<Map<String, String>> getLasCode(String div_code) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", "WEB");
		param.put("className", "action.lnk.LnkGetCode");
		param.put("vDiv", div_code);

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 소속코드 조회
	 * @return List<Map<String, String>>
	 */
	public static List<Map<String, String>> getAgencyCode(String div_code) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", "WEB");
		param.put("className", "action.lnk.LnkGetDept");
		param.put("vDiv", div_code);

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 기관코드 조회
	 * @return List<Map<String, String>>
	 */
	public static List<Map<String, String>> getBelongCode(String div_code, String belong_code) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", "WEB");
		param.put("className", "action.lnk.LnkGetDept");
		param.put("vDiv", div_code);
		param.put("vCode", belong_code);

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 * API로 부터 대출현황 조회
	 * @return List<Map<String, String>>
	 */
	public static List<Map<String, String>> getLoanMemberList(String birth_day, String sex, String loca_code, String date, String user_positn) {
		Map<String, Object> param = new HashMap<String, Object>();

		List<String> values = new ArrayList<String>();

		if(birth_day != null && !birth_day.equals("")) {
			values.add(String.format("%s|%s", "BIRTHD2", birth_day));
		}
		if(sex != null && !sex.equals("")) {
			values.add(String.format("%s|%s", "SEX", sex));
		}
		if(user_positn != null && !user_positn.equals("")) {
			values.add(String.format("%s|%s", "USER_POSITN", user_positn));
		}

		// 준회원, 기타회원, 탈퇴회원은 대출기간을 넣지 않는다
		if(!StringUtils.equals("WEB", user_positn) && !StringUtils.equals("0010", user_positn) && !StringUtils.equals("9999", user_positn)) {
			values.add(String.format("%s|%s", "LOAN_DATE", date));
		}

		param.put("USERID", "WEB");
		param.put("className", "action.lnk.LnkUserList");
		param.put("vLoca", loca_code);
		param.put("vStartPos", 1);
		param.put("vEndPos", 999999);
		param.put("value", StringUtils.join(values, "><"));

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return CommonAPI.getFieldDataList(doc);
		}
		else {
			return null;
		}
	}

	/**
	 *	DLS 인증
	 * @param workerId
	 * @param member
	 * @return
	 */
	public static List<Map<String, String>> addMemberRegular(String workerId, Member member) {
		// TODO Auto-generated method stub
		List<String> values = new ArrayList<String>();
		values.add(String.format("%s|%s", "USER_NAME", CommonAPI.getCrypt(member.getMember_name())));
		values.add(String.format("%s|%s", "PASSWORD", CommonAPI.getCrypt(member.getMember_pw())));
		values.add(String.format("%s|%s", "BIRTHD", CommonAPI.getCrypt(member.getBirth_day().replaceAll("-", ""))));
		values.add(String.format("%s|%s", "SEX", CommonAPI.getCrypt(member.getSex())));
		if (StringUtils.isNotEmpty(member.getPhone1()) && StringUtils.isNumeric(member.getPhone1())) {
			if (StringUtils.isNotEmpty(member.getPhone2()) && StringUtils.isNumeric(member.getPhone2())) {
				if (StringUtils.isNotEmpty(member.getPhone3()) && StringUtils.isNumeric(member.getPhone3())) {
					values.add(String.format("%s|%s", "TEL_NO", CommonAPI.getCrypt(String.format("%s%s%s", member.getPhone1(), member.getPhone2(), member.getPhone3()))));
				}
			}
		}

		values.add(String.format("%s|%s", "MOBILE_NO", CommonAPI.getCrypt(member.getCell_phone())));
		if (StringUtils.isNotEmpty(member.getEmail())) {
			if (!member.getEmail().equals("@")) {
				values.add(String.format("%s|%s", "EMAIL", CommonAPI.getCrypt(member.getEmail())));
			}
		}
		values.add(String.format("%s|%s", "ZIP_CODE", CommonAPI.getCrypt(member.getZipcode())));
		values.add(String.format("%s|%s", "ADDRS", CommonAPI.getCrypt(String.format("%s", member.getAddress1()))));
//		values.add(String.format("%s|%s", "WEB_HINT_TY", CommonAPI.getCrypt(member.getWeb_hint_ty())));
//		values.add(String.format("%s|%s", "WEB_HINT_ANS", CommonAPI.getCrypt(member.getWeb_hint_ans())));
		values.add(String.format("%s|%s", "DUPINFO", CommonAPI.getCrypt(member.getDi_value())));
		values.add(String.format("%s|%s", "CONN_INFO", CommonAPI.getCrypt(member.getCi_value())));
		if (!StringUtils.equals(member.getSms_service_yn(), "Y")) {
			member.setSms_service_yn("N");
		}
		values.add(String.format("%s|%s", "SMS_CHECK", CommonAPI.getCrypt(member.getSms_service_yn())));
		if (!StringUtils.equals(member.getEmail_service_yn(), "Y")) {
			member.setEmail_service_yn("N");
		}
		values.add(String.format("%s|%s", "MAIL_CHECK", CommonAPI.getCrypt(member.getEmail_service_yn())));
		values.add(String.format("%s|%s", "UN_AGREE_FLAG", CommonAPI.getCrypt("0001")));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		values.add(String.format("%s|%s", "UN_AGREE_DATE", CommonAPI.getCrypt(sdf.format(new Date()))));


		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserJoin");
		param.put("vId", member.getMember_id());
		param.put("vLocation", member.getLoca());
		param.put("vUserPos", "0001");
		param.put("vLoanCheck", "0001");
		param.put("vStatus", "0001");
		param.put("vTmplatCode", "00000001");
		param.put("vWorkType", "USERID"); // null - 일련번호(기본), WEBID - USER_ID와 WEB_ID가 동일
		param.put("value", StringUtils.join(values, "><"));

		Document doc = CommonAPI.sendILUS(param);

//		String code = CommonAPI.getElementValueByName(doc, "code");
//		String msg = CommonAPI.getElementValueByName(doc, "msg");

		return CommonAPI.getFieldDataList(doc);
	}
	
	public static boolean updateMemberRegular(String workerId, Member member, boolean b) {
		List<String> values = new ArrayList<String>();

		values.add(String.format("%s|%s", "STATUS_CODE", CommonAPI.getCrypt("0001")));
		values.add(String.format("%s|%s", "USER_POSITN", CommonAPI.getCrypt("0001")));
		values.add(String.format("%s|%s", "TMPLAT_CODE", CommonAPI.getCrypt("00000001")));
		values.add(String.format("%s|%s", "LOAN_CHECK", CommonAPI.getCrypt("0001")));
		
		values.add(String.format("%s|%s", "GRADE_CODE", CommonAPI.getCrypt("0002")));

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserInfoDMod");
		param.put("vUserConvert", "Y");
		param.put("vUserId", member.getUser_id());
		param.put("value", StringUtils.join(values, "><"));
		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			return true;
		}
		else {
			return false;
		}
	}
	
	
	/**
	 * 도민인증 정회원전환
	 * HAESU 2022-03-17
	 * @param workerId
	 * @param member
	 * @return
	 */
	public static Map<String, String> updateMemberAgent(String workerId, Member member) {
		List<String> values = new ArrayList<String>();

		values.add(String.format("%s|%s", "STATUS_CODE", CommonAPI.getCrypt("0001")));
		values.add(String.format("%s|%s", "USER_POSITN", CommonAPI.getCrypt("0001")));
		values.add(String.format("%s|%s", "TMPLAT_CODE", CommonAPI.getCrypt("00000001")));
		values.add(String.format("%s|%s", "LOAN_CHECK", CommonAPI.getCrypt("0002")));
		
		int age = changeAmerican_age(member);
		
		if(age <= 12) {
			values.add(String.format("%s|%s", "GRADE_CODE", CommonAPI.getCrypt("0001")));
		} else if(age < 19) {
			values.add(String.format("%s|%s", "GRADE_CODE", CommonAPI.getCrypt("0002")));
		} else {
			values.add(String.format("%s|%s", "GRADE_CODE", CommonAPI.getCrypt("0003")));
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkUserInfoDMod");
		param.put("vUserConvert", "Y");
		param.put("vUserId", member.getUser_id());
		param.put("value", StringUtils.join(values, "><"));
		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");

		if ( "0".equals(code) ) {
			Map<String, String> result = CommonAPI.getFieldData(doc);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@ API Result : " + result);
			return result;
		} else {
			return null;
		}
	}

	private static int changeAmerican_age(Member member) {
		int birth_yy = 0;
		int birth_mm = 0;
		int birth_dd = 0;
		
		if(!member.getBirth_day().isEmpty() ) {
			birth_yy = Integer.parseInt(StringUtils.substring(member.getBirth_day(), 0,4));
			birth_mm = Integer.parseInt(StringUtils.substring(member.getBirth_day(), 4,6));
			birth_dd = Integer.parseInt(StringUtils.substring(member.getBirth_day(), 6));
		}else if (!member.getBirthday().isEmpty()) {
			birth_yy = Integer.parseInt(StringUtils.substring(member.getBirthday(), 0,4));
			birth_mm = Integer.parseInt(StringUtils.substring(member.getBirthday(), 4,6));
			birth_dd = Integer.parseInt(StringUtils.substring(member.getBirthday(), 6));
		}
		
		Calendar cal= Calendar.getInstance();
		int sys_yy = cal.get(Calendar.YEAR);
		int sys_mm = cal.get(Calendar.MONTH) + 1;
		int sys_dd = cal.get(Calendar.DAY_OF_MONTH);
		int age = sys_yy - birth_yy;
		if (birth_mm* 100 + birth_dd > sys_mm * 100 + sys_dd) {
			age--;
		}
		return age;
	}

	public static String getCheckBookConn(String workerId, Map<String, String> memberInfo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", workerId);
		param.put("className", "action.lnk.LnkBcReqUserStatus");
		param.put("vType", "SEQNO");
		param.put("vSeqNo", memberInfo.get("SEQ_NO"));

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		if ( "0".equals(code) ) {
			return CommonAPI.getFieldData(doc).get("LOCAL_REQ_STATUS");
		}
		else {
			return null;
		}
	}
	
	
	/**
	 * 모바일바코드 API
	 * @param vUserId
	 * @param vType
	 * @param user_no
	 * @return boolean
	 */
	public static boolean userCardModSp(String vUserId, String vType, String user_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", "WEB");
		param.put("className", "action.lnk.LnkUserCardModSp1");
		param.put("vUserId", vUserId);
		param.put("vType", vType);
		
		SimpleDateFormat sdf = new SimpleDateFormat("MMddkkmm", Locale.KOREA);
		
		Date date = new Date();
		param.put("vCardNo", user_no + sdf.format(date)); // 이용자대출번호 + SimpleDateFormat("MMddkkmm", Locale.KOREA) 카드번호

		Document doc = CommonAPI.sendILUS(param);

		String code = CommonAPI.getElementValueByName(doc, "code");
		if ( "0".equals(code) ) {
			return true;
		}
		else {
			return false;
		}
	}
	
}
