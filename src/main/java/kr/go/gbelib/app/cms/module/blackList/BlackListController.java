package kr.go.gbelib.app.cms.module.blackList;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.go.gbelib.app.common.api.ApiResponse;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.core.pattern.AbstractStyleNameConverter.Black;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.whalesoft.app.cms.code.Code;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.common.api.MemberAPI;

@Controller
@RequestMapping(value = {"/cms/module/blackList"})
public class BlackListController extends BaseController{

	private final String basePath = "/cms/module/blackList/";

	@Autowired
	private BlackListService service;

	@Autowired
	private CodeService codeService;

	@RequestMapping(value = { "/index.*" })
	public String index(Model model, BlackList blackList, HttpServletRequest request) throws AuthException {
		checkAuth("R", model, request);
		blackList.setHomepage_id(getAsideHomepageId(request));
		Map<String, String> codeMap = new HashMap<String, String>();
		for ( Code one : codeService.getCode("CMS", "C0017") ) {
			codeMap.put(one.getCode_id(), one.getCode_name());
		}

		service.setPaging(model, service.getBlackListCount(blackList), blackList);
		model.addAttribute("blackTypeList", codeMap);
		model.addAttribute("blackList", blackList);
		model.addAttribute("list", service.getBlackListList(blackList));

		return basePath + "index";
	}

	@RequestMapping(value = { "/edit.*" }, method = RequestMethod.GET)
	public String edit(Model model, BlackList blackList, HttpServletRequest request) throws AuthException {
		if ( StringUtils.isNotEmpty(blackList.getMember_key()) ) {
			if ( service.checkSaveBlackList(blackList) > 0 ) {
				blackList.setEditMode("MODIFY");
			}
		}

		if (blackList.getEditMode().equals("ADD")) {
			checkAuth("C", model, request);
			model.addAttribute("blackListOne", blackList);
		} else if (blackList.getEditMode().equals("MODIFY")) {
			checkAuth("U", model, request);
			BlackList result = service.getBlackListOne(blackList);
			if ( StringUtils.isNotEmpty(blackList.getBlack_type()) ) {
				String newBlackType = String.format("%s,%s", result.getBlack_type(), blackList.getBlack_type());
				result.setBlack_type(newBlackType);
			}
			result.setAfter_click_btn(blackList.getAfter_click_btn());
			model.addAttribute("blackListOne", service.copyObjectPaging(blackList, result));
		}

		model.addAttribute("blackTypeList", codeService.getCode("CMS", "C0017"));
		//model.addAttribute("codeList", codeService.getCode(blackList.getHomepage_id(), "H0002"));

		return basePath + "edit_ajax";
	}

	@RequestMapping(value = {"/excelDownload.*"}, method = RequestMethod.POST)
	public BlackListSearchView excel(Model model, BlackList blackList, HttpServletRequest request, HttpServletResponse response) throws Exception{
		model.addAttribute("blackList", blackList);
		model.addAttribute("blackListResult", service.getBlackListListExcel(blackList));
		return new BlackListSearchView();
	}
	
	@RequestMapping(value = {"/csvDownload.*"}, method = RequestMethod.POST)
	public void csv(Model model, BlackList blackList, HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<BlackList> blackListResult = service.getBlackListListExcel(blackList);
		
		String fileName = blackListResult.get(0).getHomepage_name() + "블랙리스트 내역.csv";
		new BlackListXlsToCsv(blackList, blackListResult, fileName, request, response);
	}

	@RequestMapping(value = {"/checkId.*"}, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkId(Model model, BlackList blackList, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();

		Member blackListMember = new Member();
		blackListMember.setUser_id(blackList.getMember_id());

		Map<String, String> memberInfo = null;
		if ( blackList.getSearch_api_type().equals("WEBID") ) {
			blackListMember.setCheck_certify_type("WEBID");
			blackListMember.setCheck_certify_data(blackList.getMember_id());

			memberInfo = MemberAPI.getMemberCertify("WEB", blackListMember);

			if ( memberInfo == null ) {
				result.put("resultMsg", "해당 ID는 유효한 회원이 아닙니다.");
				return result;
			}
		}
		else {
			memberInfo = MemberAPI.getDupUser("WEB", blackListMember, "0002", blackList.getMember_id());
			if ( memberInfo == null ) {
				result.put("resultMsg", "해당 ID는 유효한 회원이 아닙니다.");
				return result;
			}
		}
		result.put("memberInfo", memberInfo);
		return result;
	}

	@RequestMapping(value = { "/save.*" }, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(BlackList blackList, BindingResult result, HttpServletRequest request) {

		/* 유효성 검증 >>>>> */
		JsonResponse res = new JsonResponse(request);

		if (!blackList.getEditMode().equals("DELETE")) {
			ValidationUtils.rejectIfEmpty(result, "homepage_id", "홈페이지를 설정해 주세요.");
			if(blackList.getEditMode().equals("ADD")) {
				ValidationUtils.rejectIfEmpty(result, "member_id", "블랙리스트 아이디를 입력해 주세요.");
				if (service.checkSaveBlackList(blackList) > 0) {
					result.reject("이미 등록된 아이디 입니다.");
				}
			}
		}

		if (!result.hasErrors()) {
			blackList.setAdd_id(getSessionMemberId(request));
			blackList.setMod_id(getSessionMemberId(request));
			if (blackList.getEditMode().equals("ADD")) {
				service.addBlackList(blackList);
				res.setValid(true);
				res.setMessage("등록 되었습니다.");
			} else if (blackList.getEditMode().equals("MODIFY")) {
				service.modifyBlackList(blackList);
				res.setValid(true);
				res.setMessage("수정 되었습니다.");
			} else if (blackList.getEditMode().equals("DELETE")) {
				service.deleteBlackList(blackList);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			} else if ( blackList.getEditMode().equals("BLACKTYPEDELETE") ) {
				service.blackTypeDelete(blackList);
				res.setValid(true);
				res.setMessage("삭제 되었습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = {"/blackListBatchAdd.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse bookBatchReturnDelay(Model model, BlackList blackList, BindingResult result, HttpServletRequest request) throws IOException {
		JsonResponse res = new JsonResponse(request);


		if (!result.hasErrors()) {
			ObjectMapper objectMapper = new ObjectMapper();
			List<Map<String, Object>> getAddBlackUsers = objectMapper.readValue(blackList.getBlackListBatchArray(), new TypeReference<List<Map<String, Object>>>() {
			});

			if (getAddBlackUsers != null && getAddBlackUsers.size() > 0) {
				for (Map<String, Object> getBlackUser : getAddBlackUsers) {
					blackList.setAdd_id(getSessionMemberId(request));
					blackList.setMod_id(getSessionMemberId(request));
					blackList.setHomepage_id(getAsideHomepageId(request));
					blackList.setBlack_type("10");
					blackList.setMember_key(getBlackUser.get("member_key").toString());
					blackList.setMember_name(getBlackUser.get("member_name").toString());
					blackList.setReason("");
					service.addBlackList(blackList);
				}
				res.setValid(true);
				res.setMessage("모든 블랙리스트 추가가 성공적으로 처리되었습니다.");
			} else {
				res.setValid(false);
				res.setMessage("블랙리스트에 추가할 회원이 선택되지 않았습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;
	}

	@RequestMapping(value = {"/blackListBatchCancel.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse blackListBatchCancel(Model model, BlackList blackList, BindingResult result, HttpServletRequest request) throws IOException {
		JsonResponse res = new JsonResponse(request);

		if (!result.hasErrors()) {
			ObjectMapper objectMapper = new ObjectMapper();
			List<Map<String, Object>> getAddBlackUsers = objectMapper.readValue(blackList.getBlackListBatchArray(), new TypeReference<List<Map<String, Object>>>() {
			});

			if (getAddBlackUsers != null && getAddBlackUsers.size() > 0) {
				for (Map<String, Object> getBlackUser : getAddBlackUsers) {
					blackList.setMod_id(getSessionMemberId(request));
					blackList.setHomepage_id(getAsideHomepageId(request));
					blackList.setBlack_type("10");
					blackList.setMember_key(getBlackUser.get("member_key").toString());
					blackList.setMember_name(getBlackUser.get("member_name").toString());
					blackList.setReason("");
					service.deleteBlackList(blackList);
				}
				res.setValid(true);
				res.setMessage("모든 블랙리스트 해제가 성공적으로 처리되었습니다.");
			} else {
				res.setValid(false);
				res.setMessage("블랙리스트 해제에 실패하였습니다.");
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}
		return res;
	}
}
