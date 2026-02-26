package kr.go.gbelib.app.cms.module.untactBook.adminMode;

import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.cms.module.untactBook.untactBookBlackList.UntactBookBlackList;
import kr.go.gbelib.app.cms.module.untactBook.untactBookBlackList.UntactBookBlackListService;
import kr.go.gbelib.app.cms.module.untactBook.untactBookReservation.UntactBookReservation;
import kr.go.gbelib.app.cms.module.untactBook.untactBookReservation.UntactBookReservationSearchView;
import kr.go.gbelib.app.cms.module.untactBook.untactBookReservation.UntactBookReservationService;
import kr.go.gbelib.app.cms.module.untactBook.untactLockerSetting.UntactBookSetting;
import kr.go.gbelib.app.cms.module.untactBook.untactLockerSetting.UntactLockerSetting;
import kr.go.gbelib.app.cms.module.untactBook.untactLockerSetting.UntactLockerSettingService;
import kr.go.gbelib.app.common.api.ApiResponse;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.common.api.MemberAPI;
import kr.go.gbelib.app.intro.search.LibrarySearch;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = {"/cms/module/untactBook/adminMode"})
public class AdminModeController extends BaseController {

	private final String basePath = "/cms/module/untactBook/adminMode/";
	
	@Autowired
	private UntactLockerSettingService settingService;
	
	@Autowired
	private UntactBookReservationService reservationService;
	
	@Autowired
	private UntactBookBlackListService blackListService;
	
	@RequestMapping(value = { "/index.*" })
	public String index(Model model, UntactBookSetting untactBookSetting, UntactLockerSetting untactLockerSetting, UntactBookReservation untactBookReservation, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		
		untactBookSetting = settingService.getUntactBookSettingOne(getAsideHomepageId(request));
		
		untactLockerSetting.setHomepage_id(getAsideHomepageId(request));
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		
		int count = reservationService.getUntactBookReservationListCount(untactBookReservation);
		reservationService.setPaging(model, count, untactBookReservation);
		
		if (StringUtils.isEmpty(untactBookReservation.getStart_date())) {
			SimpleDateFormat startDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat endDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();
			untactBookReservation.setStart_date(startDateFormat.format(now));
			untactBookReservation.setEnd_date(endDateFormat.format(now));
		}
		
		model.addAttribute("untactBookSetting", untactBookSetting);
		model.addAttribute("untactLockerSetting", untactLockerSetting);
		model.addAttribute("untactLockerSettingList", settingService.showLockerState(getAsideHomepageId(request)));
		model.addAttribute("untactBookReservationListCount", count);
		model.addAttribute("untactBookReservationList", reservationService.getUntactBookReservationListNow(untactBookReservation));
		model.addAttribute("passwordCount", reservationService.checkPasswordCount(untactBookReservation));
		model.addAttribute("nonPasswordCount", reservationService.checkNonPasswordCount(untactBookReservation));
		
		if (StringUtils.isNotEmpty(settingService.getLockerUseType(getAsideHomepageId(request)))) {
			if(!(settingService.getLockerUseType(getAsideHomepageId(request)).equals("사물함없음"))) {
				return basePath + "index";
			}
		}
		
		
		return basePath + "nonLockerIndex";
	}
	
	@RequestMapping(value = { "/cancelSettingEdit.*" })
	public String cancelSettingEdit(Model model, UntactBookReservation untactBookReservation, HttpServletRequest request,  HttpServletResponse response) throws Exception {
		 untactBookReservation.setHomepage_id(getAsideHomepageId(request)); 
		untactBookReservation = reservationService.getUntactBookReservationOne(untactBookReservation);
		
		model.addAttribute("untactBookReservation", untactBookReservation);
		return basePath + "cancelSettingEdit_ajax";
	}

	@RequestMapping (value = {"/cancelSettingSave.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse cancelSettingSave(LibrarySearch librarySearch, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		JsonResponse res = new JsonResponse(request);
		
		untactBookReservation.setCancel_id(getSessionMemberId(request));
		untactBookReservation.setCancel_ip(request.getRemoteAddr());
		
		librarySearch.setvSeqNo(untactBookReservation.getSeqNo());
		ApiResponse apiResult = LibSearchAPI.modResve2("WEB", librarySearch, getSessionUserId(request));
		if(apiResult.getStatus()) {
			if (!result.hasErrors()) {
				reservationService.cancelReservationStep(untactBookReservation);
				res.setValid(true);
				res.setMessage("취소 되었습니다.");
			} else {
				res.setValid(false);
				res.setResult(result.getAllErrors());
			}
		} else {
			res.setValid(false);
			res.setMessage(apiResult.getMessage());
		}
		
		return res;

	}
	
	@RequestMapping(value = { "/blackListSettingEdit.*" })
	public String blackListSettingEdit(Model model, UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, HttpServletRequest request,  HttpServletResponse response) throws Exception {
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		untactBookReservation = reservationService.getUntactBookReservationOne(untactBookReservation);
		
		untactBookBlackList.setHomepage_id(untactBookReservation.getHomepage_id());
		untactBookBlackList.setMember_id(untactBookReservation.getMember_id());
		untactBookBlackList.setMember_name(untactBookReservation.getMember_name());
		
		if (blackListService.penaltyCount(untactBookBlackList) > 0) {
			blackListService.alertMessageOnly("penaltyFalse", request, response);
			return null;
		} else {
			model.addAttribute("untactBookBlackList", untactBookBlackList);
			return basePath + "blackListSettingEdit_ajax";
		}
	}

	@RequestMapping (value = {"/blackListSettingSave.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse blackListSettingSave(UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		
		untactBookBlackList.setHomepage_id(untactBookReservation.getHomepage_id());
		
		SimpleDateFormat penaltyDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		
		untactBookBlackList.setPenalty_day(penaltyDateFormat.format(now));
		untactBookBlackList.setPenalty_register_id(getSessionMemberId(request));
		untactBookBlackList.setPenalty_register_ip(request.getRemoteAddr());
		
		JsonResponse res = new JsonResponse(request);
		
		if (!result.hasErrors()) {
			blackListService.grantPenalty(untactBookBlackList);
			res.setValid(true);
			res.setMessage("패널티가 부여 되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;

	}
	
	@RequestMapping (value = {"/modifyReservationStep.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse modifyReservationStep(LibrarySearch librarySearch, UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		
		JsonResponse res = new JsonResponse(request);
		
		UntactBookSetting untactBookSetting = settingService.getUntactBookSettingOne(getAsideHomepageId(request));
		
		String lockerType = untactBookSetting.getLocker_use_type();
		
		if(lockerType.equals("비밀번호") || lockerType.equals("QR코드")) {
			if (reservationService.checkPassword(untactBookReservation) > 0) {
				res.setValid(false);
				res.setMessage("비밀번호 생성후 대출을 시도해주세요.");
				return res;
			}
		}
		
		if(lockerType.equals("사물함없음")) {
			if(StringUtils.isNotEmpty(untactBookSetting.getPassword_yn())) {
				if(untactBookSetting.getPassword_yn().equals("Y")) {
					if (reservationService.checkPassword(untactBookReservation) > 0) {
						res.setValid(false);
						res.setMessage("비밀번호 생성후 대출을 시도해주세요.");
						return res;
					}
				}
			}
		}
		
		librarySearch.setvLoca(untactBookReservation.getvLoca());
		librarySearch.setvUserId(untactBookReservation.getvUserId());
		librarySearch.setvAccNo(untactBookReservation.getvAccNo());
		
		/* ApiResponse apiResult = LibSearchAPI.reqPouch2(librarySearch); */
		
//		if(apiResult.getStatus()){
			
			if(StringUtils.isNotEmpty(untactBookSetting.getLocker_use_yn())){
				String vLocation = untactBookReservation.getvLoca();
				String vToPhone = untactBookReservation.getMember_phone();
				String vFromPhone = untactBookSetting.getvFromPhone();
				String bookName = untactBookReservation.getBook_name();
				int lockerNumber = untactBookReservation.getLocker_number();
				
				if(!(untactBookSetting.getSms_use_yn().isEmpty())) {
					if(untactBookSetting.getSms_use_yn().equals("Y")) {
						if(lockerType.equals("비밀번호") || lockerType.equals("QR코드")) {
							int lockerPassword = untactBookReservation.getLocker_password();
							String msg = "신청하신 책 ["+bookName+"]이 사물함 "+lockerNumber+"번에 비치되었습니다.\n비밀번호는 "+lockerPassword+" 입니다.\n도서관에 방문하여 책을 수령하세요.";
							MemberAPI.sendSMS("WEB", vLocation, "t01", vToPhone, vFromPhone, msg);
						} else if(lockerType.equals("사물함없음") && untactBookSetting.getPassword_yn().equals("Y")){
							int lockerPassword = untactBookReservation.getLocker_password();
							String msg = "신청하신 책 ["+bookName+"]이 "+untactBookSetting.getRentalPlace()+"에 비치되었습니다.\n비밀번호는 "+lockerPassword+" 입니다.\n회원증 지참후 도서관에 방문하여 책을 수령하세요.";
							MemberAPI.sendSMS("WEB", vLocation, "t01", vToPhone, vFromPhone, msg);
						} else {
							String msg = "신청하신 책 ["+bookName+"]이 "+untactBookSetting.getRentalPlace()+"에 비치되었습니다.\n회원증 지참후 도서관에 방문하여 책을 수령하세요.";
							MemberAPI.sendSMS("WEB", vLocation, "t01", vToPhone, vFromPhone, msg);
						}
					}
				}
			}
			
			if (!result.hasErrors()) {
				int req = reservationService.modifyReservationStep(untactBookReservation);
				if(req > 0) {
					res.setValid(true);
					res.setMessage("대출되었습니다.");
				} else {
					res.setValid(false);
					res.setResult(result.getAllErrors());
				}
			} else {
				res.setValid(false);
				res.setResult(result.getAllErrors());
			}
//		} else {
//			res.setValid(false);
//			res.setMessage(apiResult.getMessage());
//		}
		return res;
	}
	
	@RequestMapping (value = {"/modifyReservationStepAll.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse modifyReservationStepAll(LibrarySearch librarySearch, UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		
		JsonResponse res = new JsonResponse(request);
		
		List<UntactBookReservation> reservationList = reservationService.getReservationList(untactBookReservation);
		
		UntactBookSetting untactBookSetting = settingService.getUntactBookSettingOne(getAsideHomepageId(request));
		String lockerType = untactBookSetting.getLocker_use_type();
		
		if(lockerType.equals("비밀번호") || lockerType.equals("QR코드")) {
			if (reservationService.checkPassword(untactBookReservation) > 0) {
				res.setValid(false);
				res.setMessage("비밀번호 생성후 대출을 시도해주세요.");
				return res;
			}
		}
		
		if(lockerType.equals("사물함없음")) {
			if(StringUtils.isNotEmpty(untactBookSetting.getPassword_yn())) {
				if(untactBookSetting.getPassword_yn().equals("Y")) {
					if (reservationService.checkPassword(untactBookReservation) > 0) {
						res.setValid(false);
						res.setMessage("비밀번호 생성후 대출을 시도해주세요.");
						return res;
					}
				}
			}
		}

		for(int i = 0; i < reservationList.size(); i++) {
			String request_number = String.valueOf(reservationList.get(i).getRequest_number());
			String member_id = String.valueOf(reservationList.get(i).getMember_id());
			String vLoca = String.valueOf(reservationList.get(i).getvLoca());
			String vUserId = String.valueOf(reservationList.get(i).getvUserId());
			String vAccNo = String.valueOf(reservationList.get(i).getvAccNo());
			
			String vLocation = reservationList.get(i).getvLoca();
			String vToPhone = reservationList.get(i).getMember_phone();
			String vFromPhone = untactBookSetting.getvFromPhone();
			String bookName = reservationList.get(i).getBook_name();
			int lockerNumber = reservationList.get(i).getLocker_number();
			
			librarySearch.setvLoca(vLoca);
			librarySearch.setvUserId(vUserId);
			librarySearch.setvAccNo(vAccNo);

			untactBookReservation.setMember_id(member_id);
			untactBookReservation.setRequest_number(Integer.parseInt(request_number));
			untactBookReservation.setReservation_step("대출");
			

//			ApiResponse apiResult = LibSearchAPI.reqPouch2(librarySearch);
			
//			if(apiResult.getStatus()){
				if (!result.hasErrors()) {
					
					if(!(untactBookSetting.getSms_use_yn().isEmpty())) {
						if(untactBookSetting.getSms_use_yn().equals("Y")) {
							if(lockerType.equals("비밀번호") || lockerType.equals("QR코드")) {
								int lockerPassword = reservationList.get(i).getLocker_password();
								String msg = "신청하신 책 ["+bookName+"]이 비치되었습니다.\n사물함 번호는 "+lockerNumber+"번이며, 비밀번호는 "+lockerPassword+"입니다.\n도서관에 방문하여 책을 수령하세요.";
								MemberAPI.sendSMS("WEB", vLocation, "t01", vToPhone, vFromPhone, msg);
							} else if(lockerType.equals("사물함없음") && untactBookSetting.getPassword_yn().equals("Y")){
								int lockerPassword = reservationList.get(i).getLocker_password();
								String msg = "신청하신 책 ["+bookName+"]이 비치되었으며. 비밀번호는 "+lockerPassword+"입니다.\n도서관에 방문하여 책을 수령하세요.\n비치장소는 "+untactBookSetting.getRentalPlace()+" 입니다.";
								MemberAPI.sendSMS("WEB", vLocation, "t01", vToPhone, vFromPhone, msg);
							} else {
								String msg = "신청하신 책 ["+bookName+"]이 비치되었습니다.\n도서관에 방문시 신분증 혹은 회원증을 지참후 책을 수령하세요.\n비치장소는 "+untactBookSetting.getRentalPlace()+" 입니다.";
								MemberAPI.sendSMS("WEB", vLocation, "t01", vToPhone, vFromPhone, msg);
							}
						}
					}
					
					int req = reservationService.modifyReservationStep(untactBookReservation);
					if(req > 0) {
						res.setValid(true);
						res.setMessage("대출되었습니다.");
					} else {
						res.setValid(false);
						res.setMessage("대출후 저장에 실패하였습니다 관리자에게 문의해 주세요.");
					}
				} else {
					res.setValid(false);
					res.setResult(result.getAllErrors());
				}
//			} else {
//				res.setValid(false);
//				res.setMessage(apiResult.getMessage());
//			}
		}
		
		return res;
	}
	
	@RequestMapping (value = {"/deleteAll.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse deleteAllReservation(UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		
		untactBookReservation.setCancel_id(getSessionMemberId(request));
		untactBookReservation.setCancel_ip(request.getRemoteAddr());
		
		JsonResponse res = new JsonResponse(request);
		
		if (!result.hasErrors()) {
			reservationService.deleteAllReservation(untactBookReservation);
			res.setValid(true);
			res.setMessage("삭제되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;

	}
	
	@RequestMapping (value = {"/randomPassword.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse randomPassword(UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		
		JsonResponse res = new JsonResponse(request);
		
		if(reservationService.checkPasswordCount(untactBookReservation) == 0) {
			reservationService.alertMessageOnly("nonPasswordCheck", request, response);
			return null;
		}
		
		if (reservationService.checkNonPasswordCount(untactBookReservation) == 0) {
			reservationService.alertMessageOnly("passwordCheck", request, response);
			return null;
		}
		
		if (!result.hasErrors()) {
			reservationService.passwordSetting(untactBookReservation);
				res.setValid(true);
				res.setMessage("생성되었습니다.");
			} else {
				res.setValid(false);
				res.setResult(result.getAllErrors());
			}
		
		return res;
	}
	
	@RequestMapping (value = {"/reservationStepSave.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse reservationStep(UntactBookBlackList untactBookBlackList, UntactBookReservation untactBookReservation, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		untactBookReservation = reservationService.getUntactBookReservationOne(untactBookReservation);
		
		JsonResponse res = new JsonResponse(request);
		
		if (!result.hasErrors()) {
			reservationService.changeReservationStep(untactBookReservation);
			res.setValid(true);
			res.setMessage("대출되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;

	}
	
	@RequestMapping(value = { "/untactBookMemberDetail.*" })
	public String untactBookMemberDetail(Model model, UntactBookReservation untactBookReservation, HttpServletRequest request,  HttpServletResponse response) throws Exception {
		 untactBookReservation.setHomepage_id(getAsideHomepageId(request)); 
		untactBookReservation = reservationService.getUntactBookReservationOne(untactBookReservation);
		
		model.addAttribute("untactBookReservation", untactBookReservation);
		
		return basePath + "detail_ajax";
	}
	
	@RequestMapping(value = {"/excelDownload.*"}, method = RequestMethod.POST)
	public UntactBookReservationSearchView excelDownload(Model model, UntactBookReservation untactBookReservation, HttpServletRequest request){
		untactBookReservation.setHomepage_id(getAsideHomepageId(request));
		
		model.addAttribute("untactBookReservation", untactBookReservation);
		model.addAttribute("untactBookReservationList", reservationService.getUntactBookReservationExcelListNow(untactBookReservation));
		
		return new UntactBookReservationSearchView();
	}
	
}
