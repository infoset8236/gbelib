package kr.go.gbelib.app.module.bookBasket;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import kr.go.gbelib.app.module.myItem.MyItem;
import kr.go.gbelib.app.module.myItem.MyItemService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 내 보관함
 *
 * @author whalesoft SEONGHYEON 2022. 7. 22.
 *
 */
@Controller (value = "userBookBasket")
@RequestMapping (value = {"/{homepagePath}/module/bookBasket"})
public class BookBasketController extends BaseController {
	private String basePath = "/homepage/%s/module/bookBasket/";
	
	private String basePath2 = "/homepage/%s/commonIntro/search/";

	@Autowired
	private BookBasketService service;

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MyItemService myItemService;
	
	@Autowired
	private CalendarManageService calendarManageService;

	/**
	 * 관심도서 목록
	 *
	 * @author whalesoft SEONGHYEON 2022. 7. 22.
	 * @param model
	 * @param bookBasket
	 * @param request
	 * @param response
	 * @param url
	 * @return
	 * @throws Exception
	 */
	@RequestMapping (value = {"/index{url}.*"}, method = RequestMethod.GET)
	public String index(Model model, BookBasket bookBasket, HttpServletRequest request, HttpServletResponse response, @PathVariable ("url") String url) throws Exception {
		Homepage homepage = (Homepage)request.getAttribute("homepage");

		if (!isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			bookBasket.setBefore_url(String.format("/%s/module/bookBasket/index.do?menu_idx=%s", homepage.getContext_path(), bookBasket.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), bookBasket.getMenu_idx(), bookBasket.getBefore_url()), request, response);
			return null;
		}

		Menu m = new Menu();
		m.setHomepage_id(homepage.getHomepage_id());
		m.setMenu_idx(2);

		int searchMenuIdx = menuService.getMenuIdxByProgramIdx(m);
		model.addAttribute("searchMenuIdx", searchMenuIdx);

		bookBasket.setMember_key(getSessionUserSeqNo(request));
		service.setPaging(model, service.getBookBasketCount(bookBasket), bookBasket);

		model.addAttribute("bookBasket", bookBasket);
		model.addAttribute("bookBasketList", service.getBookBasketList(bookBasket));

		return String.format(basePath, homepage.getFolder()) + "index";
	}

	/**
	 * 관심도서 저장
	 *
	 * @author whalesoft SEONGHYEON 2022. 7. 22.
	 * @param bookBasket
	 * @param result
	 * @param request
	 * @return
	 */
	@RequestMapping (value = {"/save.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse save(BookBasket bookBasket, BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse(request);
		Homepage homepage = (Homepage)request.getAttribute("homepage");

		if (!isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			result.reject("로그인 후 이용가능합니다.");
		}
		
		bookBasket.setMember_key(getSessionUserSeqNo(request));
		bookBasket.setHomepage_id(homepage.getHomepage_id());
/*		
		if (service.getBookCheck(bookBasket) >= 1) {
			result.reject("이미 관심등록된 책입니다.");
		}
*/

		if (!result.hasErrors()) {
			if (bookBasket.getEditMode().equals("ADD")) { //자료검색 목록에서 담기
				if(bookBasket.getStrList().size() > 0 && bookBasket.getStrList().size() < 2) { //한권만 담기
					bookBasket.getStrList().get(0).replaceAll("^^^", ",");					
					bookBasket.setLoca(bookBasket.getStrList().get(0).split("__")[0]);				
					bookBasket.setCtrl_no(bookBasket.getStrList().get(0).split("__")[1]);
					
					try {
						bookBasket.setImage_url(bookBasket.getStrList().get(0).split("__")[3]);
					}catch (Exception e) {
						bookBasket.setImage_url(null);
					}
					bookBasket.setLib_name(bookBasket.getStrList().get(0).split("__")[4]); //소장도서
					bookBasket.setCall_no(bookBasket.getStrList().get(0).split("__")[5]); //청구기호
					bookBasket.setTitle(bookBasket.getStrList().get(0).split("__")[6]);
					bookBasket.setAuthor(bookBasket.getStrList().get(0).split("__")[7]);
					bookBasket.setPubler(bookBasket.getStrList().get(0).split("__")[8]);
					if (service.getBookCheck(bookBasket) >= 1) {
						res.setValid(true);
						res.setMessage("이미 관심등록된 도서입니다.");
					}else {
						service.addBookBasket(bookBasket);
						res.setValid(true);
						res.setMessage("등록되었습니다.");
					}
				}else { //한권 이상 담을때
					boolean reOrder = false;
					String errorMsg = null;
					for (String str : bookBasket.getStrList()) {
						str.replaceAll("^^^", ",");
						String[] lib_rec_tid = str.split("__|_ _|_");
						Map<String, Object> bookDetail = LibSearchAPI.getBookDetail(new LibrarySearch(lib_rec_tid[0], lib_rec_tid[1]));
						BookBasket bookBasket1 = new BookBasket(homepage.getHomepage_id(), bookBasket.getMember_key());
						bookBasket1.setBasket_idx(bookBasket.getBasket_idx());
						List<Map<String, Object>> dsItemDetail = (List<Map<String, Object>>) bookDetail.get("dsItemDetail");
						Map<String, Object> detailOne = null;
						try {
							detailOne = dsItemDetail.get(0);
						}catch (Exception e) {
							errorMsg = "제어번호 " + lib_rec_tid[1] +" 정보를 찾는데 실패했습니다";
							continue;
						}
						bookBasket1.setTitle(String.valueOf(detailOne.get("TITLE")));
						bookBasket1.setAuthor(String.valueOf(detailOne.get("AUTHOR")));
						bookBasket1.setPubler(String.valueOf(detailOne.get("PUBLISHER")));
						bookBasket1.setLoca(String.valueOf(detailOne.get("LOCA")));
						bookBasket1.setCtrl_no(lib_rec_tid[1]);
						int count = service.getBookCheck(bookBasket1);
						if(count > 0) { //중복은 건너뛴다.
							reOrder = true;
							continue;
						}
						
						try {
							bookBasket1.setImage_url(lib_rec_tid[3]);
						}catch (Exception e) {
							bookBasket1.setImage_url(null);
						}
						try {
							bookBasket1.setLib_name(lib_rec_tid[4]); //소장도서
						} catch (Exception e) {
							bookBasket1.setLib_name(null);
						}
						try {
							bookBasket1.setCall_no(lib_rec_tid[5]); //청구기호
						} catch (Exception e) {
							bookBasket1.setCall_no(null);
						}

						service.addBookBasket(bookBasket1);
					}
					res.setValid(true);
					if(reOrder) {
						 if(errorMsg != null) {
							 res.setMessage( errorMsg + ", 그 외 이미 보관된 도서를 제외, 정상 등록 되었습니다.");
						 }else {
							 res.setMessage("이미 보관된 도서를 제외, 정상 등록 되었습니다.");
						 }
					}else {
						if(errorMsg != null) {
							 res.setMessage( errorMsg + ", 그 외 도서는 정상 등록 되었습니다.");
						 }else {
							 res.setMessage("보관함에 정상 등록 되었습니다.");
						 }
						
					}		
				}
			}else if(bookBasket.getEditMode().equals("DETAILADD")) { //자료검색 > 도서상세 페이지에서 담기			
				if (service.getBookCheck(bookBasket) >= 1) {
					res.setValid(true);
					res.setMessage("이미 관심등록된 도서입니다.");
				}else {
					service.addBookBasket(bookBasket);
					res.setValid(true);
					res.setMessage("등록되었습니다.");
				}
			}else if(bookBasket.getEditMode().equals("DELETE")) { //나의관심도서에서 삭제
				if(bookBasket.getStrList().size() > 0) {
					for(String str : bookBasket.getStrList()) { 
						bookBasket.setBasket_idx(Integer.parseInt(str));
						service.deleteBookBasket(bookBasket);					
					}
					res.setValid(true);
					res.setMessage("삭제 되었습니다.");
				}else {
					service.deleteBookBasket(bookBasket);
					res.setValid(true);
					res.setMessage("삭제 되었습니다.");
				}
			}
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	/**
	 * 관심도서 삭제
	 *
	 * @author whalesoft SEONGHYEON 2022. 7. 22.
	 * @param bookBasket
	 * @param result
	 * @param request
	 * @return
	 */
	@RequestMapping (value = {"/delete.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse delete(BookBasket bookBasket, BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse(request);

		if (!isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			result.reject("로그인 후 이용가능합니다.");
		}

		if (!result.hasErrors()) {
			bookBasket.setMember_id(getSessionMemberId(request));
			service.deleteBookBasket(bookBasket);
			res.setValid(true);
			res.setMessage("삭제되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	/**
	 * 관심도서 일괄 삭제
	 *
	 * @author whalesoft SEONGHYEON 2022. 7. 22.
	 * @param bookBasket
	 * @param result
	 * @param request
	 * @return
	 */
	@RequestMapping (value = {"/deleteBatch.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse deleteBatch(BookBasket bookBasket, BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse(request);

		if (!isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			result.reject("로그인 후 이용가능합니다.");
		}

		if (!result.hasErrors()) {
			bookBasket.setMember_id(getSessionMemberId(request));
			if (bookBasket.getStrList() != null && bookBasket.getStrList().size() > 0) {
				for (String i : bookBasket.getStrList()) {
					bookBasket.setBasket_idx(Integer.parseInt(i));
					service.deleteBookBasket(bookBasket);
				}
			}
			res.setValid(true);
			res.setMessage("삭제되었습니다.");
		} else {
			res.setValid(false);
			res.setResult(result.getAllErrors());
		}

		return res;
	}
	
	/**
	 * 엑셀다운
	 *
	 * @author whalesoft SEONGHYEON 2022. 7. 22.
	 * @param bookBasket
	 * @param result
	 * @param request
	 * @return
	 */

	@RequestMapping (value = {"/excel{url}.*"}, method = RequestMethod.GET)
	public String excel(Model model, BookBasket bookBasket, HttpServletRequest request, HttpServletResponse response, @PathVariable ("url") String url) throws Exception {
		Homepage homepage = (Homepage)request.getAttribute("homepage");

		if (!isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
			bookBasket.setBefore_url(String.format("/%s/module/bookBasket/index.do?menu_idx=%s", homepage.getContext_path(), bookBasket.getMenu_idx()));
			service.alertMessageAndUrl("로그인 후 이용가능합니다.", String.format("/%s/intro/login/index.do?menu_idx=%s&before_url=%s", homepage.getContext_path(), bookBasket.getMenu_idx(), bookBasket.getBefore_url()), request, response);
			return null;
		}

		bookBasket.setViewPage(1);
		bookBasket.setRowCount(99999);
		bookBasket.setMember_key(getSessionUserSeqNo(request));

		service.setPaging(model, service.getBookBasketCount(bookBasket), bookBasket);

		model.addAttribute("bookBasket", bookBasket);
		model.addAttribute("bookBasketList", service.getBookBasketList(bookBasket));

		return String.format(basePath, homepage.getFolder()) + "excel_ajax";
	}
	
	/**
	 * 상세보기 팝업
	 *
	 * @author whalesoft SEONGHYEON 2022. 7. 22.
	 * @param bookBasket
	 * @param result
	 * @param request
	 * @return
	 */
	
	@RequestMapping(value = {"/detailPopup.*"})
	public String detailPopup(Model model, BookBasket bookBasket, HttpServletRequest request) {
		Homepage homepage = (Homepage)request.getAttribute("homepage");
		//model.addAttribute("introMenu", "도서상세정보");//임시
		Map<String, Object> result = LibSearchAPI.getBookDetail(new LibrarySearch(bookBasket.getLoca(),bookBasket.getCtrl_no()));
		model.addAttribute("detail", result);
		model.addAttribute("librarySearch", bookBasket);
		model.addAttribute("isTodayClosed", calendarManageService.isTodayClosed(homepage.getHomepage_id()));
		return String.format(basePath2, homepage.getFolder()) + "detailPopup_ajax";
	}
}
