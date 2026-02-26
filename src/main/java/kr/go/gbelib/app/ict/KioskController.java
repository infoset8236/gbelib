package kr.go.gbelib.app.ict;

import kr.co.whalesoft.app.board.Board;
import kr.co.whalesoft.app.board.BoardService;
import kr.co.whalesoft.app.cms.boardManage.BoardManage;
import kr.co.whalesoft.app.cms.boardManage.BoardManageService;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.login.LoginService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.app.cms.terms.Terms;
import kr.co.whalesoft.app.cms.terms.TermsService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.ValidationUtils;
import kr.co.whalesoft.framework.utils.WebFilterCheckUtils;
import kr.go.gbelib.app.cms.module.blackList.BlackList;
import kr.go.gbelib.app.cms.module.blackList.BlackListService;
import kr.go.gbelib.app.cms.module.category.Category;
import kr.go.gbelib.app.cms.module.category.CategoryService;
import kr.go.gbelib.app.cms.module.category.group.CategoryGroup;
import kr.go.gbelib.app.cms.module.category.group.CategoryGroupService;
import kr.go.gbelib.app.cms.module.teach.Teach;
import kr.go.gbelib.app.cms.module.teach.TeachService;
import kr.go.gbelib.app.cms.module.teach.student.Student;
import kr.go.gbelib.app.cms.module.teach.student.StudentService;
import kr.go.gbelib.app.common.api.CommonAPI;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.common.api.LoginAPI;
import kr.go.gbelib.app.common.api.MemberAPI;
import kr.go.gbelib.app.intro.bookDescription.BookDescriptionService;
import kr.go.gbelib.app.intro.bookImage.BookImageService;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import kr.go.gbelib.app.intro.search.LibrarySearchService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = {"/{context_path}/ict/kiosk"})
public class KioskController extends BaseController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private BoardManageService boardManageService;

    @Autowired
    private BookImageService bookImageService;

    @Autowired
    private TeachService teachService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryGroupService categoryGroupService;

    @Autowired
    private CodeService codeService;

    @Autowired
    private TermsService termsService;

    @Autowired
    private BlackListService blackListService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private BookDescriptionService bookDescriptionService;

    public final static String ICT_TYPE = "/ict/type";
    public final static String KIOSK = "/kiosk/";

    private String basePath (HttpServletRequest request) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        return ICT_TYPE + homepage.getKiosk_type() + KIOSK;
    }

    @RequestMapping(value = {"/{type}/index.*"})
    public String index (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + type + "/index";
    }

    @RequestMapping(value = {"/{type}/info.*"})
    public String info (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + type + "/info";
    }

    @RequestMapping(value = {"/{type}/notice.*"})
    public String notice (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        setBoardListToModel(homepage.getHomepage_id(), model);

        return basePath(request) + type + "/notice";
    }

    @RequestMapping(value = {"/{type}/facility.*"})
    public String facility (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + type + "/facility";
    }

    @RequestMapping(value = {"/{type}/login.*"})
    public String login (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + type + "/login";
    }

    @RequestMapping(value = {"/{type}/rfidLogin.*"})
    public String rfidLogin (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + type + "/rfidLogin";
    }

    @RequestMapping(value = {"/{type}/loginProc.*"})
    public @ResponseBody JsonResponse loginProc (Model model, @PathVariable String type, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable String context_path) throws Exception {
        JsonResponse res = new JsonResponse(request);

        Homepage homepage = (Homepage) request.getAttribute("homepage");
        request.removeAttribute("userIdLoginFail");

        Object result = LoginAPI.login(member);
        if (result instanceof Member) {
            try {
                member = (Member) result;
                member.setLogin(true);
                member.setLoginType("HOMEPAGE");

                res.setValid(true);
            } catch (Exception e) {
                res.setValid(false);
                res.setMessage(e.getMessage());
            }
            loginService.setSessionMember(member, request);
        } else {
            res.setValid(false);
            res.setMessage("아이디 또는 비밀번호를 다시 확인하세요.");
        }

        return res;
    }

    @RequestMapping(value = {"/{type}/rfidProc.*"})
    public @ResponseBody JsonResponse rfidProc (Model model, @PathVariable String type, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("context_path") String context_path) throws Exception {
        JsonResponse res = new JsonResponse(request);

        Homepage homepage = (Homepage) request.getAttribute("homepage");
        request.removeAttribute("userIdLoginFail");

        member.setLoca(homepage.getHomepage_codeList()[0]);
        Object result = LoginAPI.rfidLogin(member);
        if (result instanceof Member) {
            try {
                member = (Member) result;
                member.setLogin(true);
                member.setLoginType("HOMEPAGE");

                res.setValid(true);
            } catch (Exception e) {
                res.setValid(false);
                res.setMessage(e.getMessage());
            }

            loginService.setSessionMember(member, request);
        } else {
            if (homepage.getHomepage_id().equals("h23")) {
                result = LoginAPI.barcodeLogin(member);
                if (result instanceof Member) {
                    try {
                        member = (Member) result;
                        member.setLogin(true);
                        member.setLoginType("HOMEPAGE");

                        res.setValid(true);
                    } catch (Exception e) {
                        res.setValid(false);
                        res.setMessage(e.getMessage());
                    }

                    loginService.setSessionMember(member, request);
                } else {
                    res.setValid(false);
                    res.setMessage("바코드 또는 RFID를 확인해주세요.");
                }
            } else {
                res.setValid(false);
                res.setMessage("아이디 또는 비밀번호를 다시 확인하세요.");
            }
        }

        return res;
    }

    @RequestMapping(value = "/{type}/logout.*")
    public String logout(@PathVariable String context_path, @PathVariable String type, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        loginService.logout(request);

        return basePath(request) + type + "/index";
    }

    @RequestMapping(value = {"/{type}/newBook.*"})
    public String newBook (@PathVariable String context_path, LibrarySearch librarySearch, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            if ("yc".equals(context_path)) {
                librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -60)));
            } else {
                librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            }
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        if (StringUtils.isEmpty(librarySearch.getvLoca())) {
            librarySearch.setvLoca(homepage.getHomepage_code());
        }

        librarySearch.setEndRowNum(24);

        Map<String, Object> result = null;

        try {
            result = bookImageService.resultImageMap(LibSearchAPI.getNewBookList(librarySearch, null),librarySearch, "dsNewBookList", "COVER_SMALLURL");

            List<Map<String, Object>> newBookList = (List<Map<String, Object>>) result.get("dsNewBookList");

            String content = "";

            if (newBookList != null && newBookList.size() > 0) {
                for (Map<String, Object> map : newBookList) {
                    if(StringUtils.isNotEmpty(map.get("ISBN").toString())) {
                        librarySearch.setSearch_type("isbn");
                        librarySearch.setSearch_text(map.get("ISBN").toString());
                        Map<String, Object> kakaoMap = LibSearchAPI.getKaKaoList(librarySearch);

                        List<Map<String, Object>> itemList = (List<Map<String, Object>>) kakaoMap.get("list");

                        if (itemList != null && itemList.size() > 0) {
                            for (Map<String, Object> map3 : itemList) {
                                content = String.valueOf(map3.get("contents"));
                            }

                            map.put("contentsDetail", content);
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("newBookList", result);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + type + "/newBook";
    }

    @RequestMapping(value = {"/{type}/bestBook.*"})
    public String bestBook (@PathVariable String context_path, LibrarySearch librarySearch, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        if (StringUtils.isEmpty(librarySearch.getvLoca())) {
            librarySearch.setvLoca(homepage.getHomepage_code());
        }

        Map<String, Object> bestBookResult = LibSearchAPI.getBestBookList(librarySearch);

        try {
            bestBookResult = bookImageService.resultImageMap(bestBookResult ,librarySearch, "dsLoanBestList", "COVER_SMALLURL");

            List<Map<String, Object>> bestBookList = (List<Map<String, Object>>) bestBookResult.get("dsLoanBestList");

            String content = "";

            if (bestBookList != null && bestBookList.size() > 0) {
                for (Map<String, Object> map : bestBookList) {
                    if(StringUtils.isNotEmpty(map.get("ISBN").toString())) {
                        librarySearch.setSearch_type("isbn");
                        librarySearch.setSearch_text(map.get("ISBN").toString());
                        Map<String, Object> kakaoMap = LibSearchAPI.getKaKaoList(librarySearch);

                        List<Map<String, Object>> itemList = (List<Map<String, Object>>) kakaoMap.get("list");

                        if (itemList != null && itemList.size() > 0) {
                            for (Map<String, Object> map3 : itemList) {
                                content = String.valueOf(map3.get("contents"));
                            }

                            map.put("contentsDetail", content);
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("bestBookList", bestBookResult);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + type + "/bestBook";
    }

    @RequestMapping(value = {"/{type}/detail.*"})
    public String detail (@PathVariable String context_path, @PathVariable String type, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);

        try {
            result = bookImageService.resultImageMap(result ,librarySearch, "dsItemDetail", "IMAGE_URL");
            bookDescriptionService.resultDescriptionMap(result, librarySearch, "dsItemDetail", "contentsDetail");
        }catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("detail", result);
        model.addAttribute("librarySearch", librarySearch);

        if(StringUtils.isEmpty(librarySearch.getSearch_end_date())) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            if ("yc".equals(context_path)) {
                librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -60)));
            } else {
                librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            }
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        librarySearch.setEndRowNum(10);

        if (homepage.getHomepage_id().equals("h23")) {
            librarySearch.setvLoca("00147015");
        }

        Map<String, Object> newBookList = LibSearchAPI.getNewBookList(librarySearch, null);

        Map<String, Object> newBookResult = bookImageService.resultImageMap(newBookList, librarySearch, "dsNewBookList", "COVER_SMALLURL");
        bookDescriptionService.resultDescriptionMap(newBookResult, librarySearch, "dsNewBookList", "contentsDetail");

        model.addAttribute("newBookList", newBookResult);

        return basePath(request) + type + "/detail";
    }

    @RequestMapping(value = {"/{type}/teach.*"})
    public String teach (@PathVariable String context_path, @PathVariable String type, Teach teach, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage)request.getAttribute("homepage");
        if ( isLogin(request) && getSessionMemberLoginType(request).equals("HOMEPAGE") ) {
            teach.setMember_key(getSessionUserSeqNo(request));
        }

        teach.setHomepage_id(homepage.getHomepage_id());
        CategoryGroup categoryGroup = new CategoryGroup();
        List<CategoryGroup> categoryGroupList = new ArrayList<CategoryGroup>();
        teach.setSearchCate1("18");
        String[] teachCate = teach.getSearchCate1().split(",");
        categoryGroup.setHomepage_id(homepage.getHomepage_id());

        for(int i = 0; i < teachCate.length; i++) {
            categoryGroup.setLarge_category_idx(Integer.parseInt(teachCate[i]));
            categoryGroupList.addAll(categoryGroupService.getCategoryGroupList(categoryGroup));
        }
        List<Category> categoryList = new ArrayList<Category>();
        Category category = new Category();
        category.setHomepage_id(homepage.getHomepage_id());
        category.setGroup_idx(teach.getGroup_idx());

        if(teach.getGroup_idx() > 0) {
            for(int j = 0; j < teachCate.length; j++) {
                category.setLarge_category_idx(Integer.parseInt(teachCate[j]));
                categoryList.addAll(categoryService.getCategoryListAll(category));
            }
        }

        String teachDay = "";
        if(teach.getTeach_day_arr() != null && teach.getTeach_day_arr().length > 0){
            for(String teachDayArr : teach.getTeach_day_arr()) {
                if("".equals(teachDay) || teachDay == null) {
                    teachDay = teachDayArr;
                }else {
                    teachDay = teachDay + "|" + teachDayArr;
                }
            }
            teach.setTeach_day(teachDay);
        }

        model.addAttribute("teach", teach);
        model.addAttribute("categoryGroupList", categoryGroupList);
        model.addAttribute("teachList", teachService.getTeachListForUser(teach));
        model.addAttribute("categoryList", categoryList);

        return basePath(request) + type + "/teach";
    }

    @RequestMapping(value = {"/{type}/teachDetail.*"})
    public String teachDetail (@PathVariable String context_path, @PathVariable String type, Teach teach, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage)request.getAttribute("homepage");
        if ( isLogin(request) && getSessionMemberLoginType(request).equals("HOMEPAGE") ) {
            teach.setMember_key(getSessionUserSeqNo(request));
        }

        if ( !"h1".equals(homepage.getHomepage_id()) ) {
            teach.setHomepage_id(homepage.getHomepage_id());
        }

        int menu_idx = teach.getMenu_idx();
        int large_category_idx = teach.getLarge_category_idx();

        teach = teachService.getTeachDetailForUser(teach);
        if ( teach == null ) {
            teachService.alertMessage("해당 강좌 정보가 없습니다.", request, response);
            return null;
        }
        teach.setMenu_idx(menu_idx);
        teach.setLarge_category_idx(large_category_idx);

        model.addAttribute("teach", teach);

        return basePath(request) + type + "/teachDetail";
    }

    @RequestMapping(value = {"/{type}/teachEdit.*"})
    public String teachEdit (@PathVariable String context_path, @PathVariable String type, Student student, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage)request.getAttribute("homepage");

        if (!homepage.getHomepage_id().equals("h1")) {
            student.setHomepage_id(homepage.getHomepage_id());
        }
        student.setMember_id(getSessionMemberId(request));
        student.setMember_key(getSessionUserSeqNo(request));

        String checkResult = studentService.checkStudent(student);
        if ( checkResult != null ) {
            studentService.alertMessage(checkResult, request, response);
            return null;
        }

        //블랙리스트 체크
        if("Y".equals(student.getBlack_yn())) {
            if ( blackListService.checkBlackList(new BlackList(student.getHomepage_id(), getSessionUserSeqNo(request)), "10")) {
                studentService.alertMessage("신청이 불가능합니다.\\n도서관에 문의해주세요.", request, response);
                return null;
            }
        }

        /*model.addAttribute("termsList", termsService.getTermsListInModule(new Terms(menuOne.getManage_idx())));*/
        model.addAttribute("hakList", codeService.getCode("CMS", "C0020"));
        model.addAttribute("teach", teachService.getTeachOne(new Teach(student.getHomepage_id(), student.getGroup_idx(), student.getCategory_idx(), student.getTeach_idx())));
        model.addAttribute("memberInfo", MemberAPI.getMember("WEB", getSessionMemberInfo(request)));
        model.addAttribute("student", student);
        model.addAttribute("cellPhoneCode", codeService.getCode("CMS", "C0002"));
        model.addAttribute("phoneCode", codeService.getCode("CMS", "C0003"));
        model.addAttribute("prtcNotice",MemberAPI.getPrtcNoticeList("WEB"));
        model.addAttribute("traingLocationList", codeService.getCode("CMS", "C0022"));

        return basePath(request) + type + "/teachEdit";
    }

    @RequestMapping(value = {"/{type}/teachSave.*"})
    public @ResponseBody JsonResponse teachSave (@PathVariable String context_path, @PathVariable String type, BindingResult result, Student student, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JsonResponse res = new JsonResponse(request);
        Teach teachOne = null;

        if ( !isLogin(request) || !"HOMEPAGE".equals(getSessionMemberLoginType(request))) {
            res.setValid(false);
            res.setMessage("로그인 후 이용가능합니다.");
            return res;
        }

        if(student.getEditMode().equals("ADD")) {
            teachOne = teachService.getTeachOne(new Teach(student.getHomepage_id(), student.getGroup_idx(), student.getCategory_idx(), student.getTeach_idx()));
        }

        if(!result.hasErrors()) {
            ObjectMapper mapper = new ObjectMapper();
            mapper.setVisibilityChecker(mapper.getSerializationConfig().getDefaultVisibilityChecker()
                    .withFieldVisibility(JsonAutoDetect.Visibility.ANY)
                    .withGetterVisibility(JsonAutoDetect.Visibility.NONE)
                    .withSetterVisibility(JsonAutoDetect.Visibility.NONE)
                    .withCreatorVisibility(JsonAutoDetect.Visibility.NONE));
            String body = "";
            try {
                body = mapper.writeValueAsString(student);
            } catch(Exception e) {
                e.printStackTrace();
            }

            String filterResult = WebFilterCheckUtils.webFilterCheck("신청자", "신청", body);
            if (filterResult != null) {
                res.setValid(false);
                res.setUrl(filterResult);
                res.setTargetOpener(true);
                return res;
            }

            if(student.getEditMode().equals("ADD")) {
                String webId = getSessionWebId(request);
                if (StringUtils.isNotEmpty(webId)) {
                    student.setAdd_id(getSessionWebId(request));
                } else {
                    student.setAdd_id(getSessionMemberId(request));
                }
                student.setWeb_id(getSessionWebId(request));
                student.setMember_key(getSessionUserSeqNo(request));
                student.setApi_user_id(getSessionUserId(request));
                student.setSearch_api_type("USER_ID");

                Object[] addResult = studentService.addStudent(student, "HOMEPAGE");
                res.setValid((Boolean) addResult[0]);

                if("Y".equals(teachOne.getCancle_use_yn()) && addResult != null && addResult.length >= 3 && addResult[2] != null && (Boolean) addResult[2]  == true) {
                    String strDate = teachOne.getStart_cancle_date() + " " + teachOne.getStart_cancle_time();
                    String endDate = teachOne.getEnd_cancle_date() + " " + teachOne.getEnd_cancle_time();
                    res.setMessage((String) addResult[1] + "\n" + teachOne.getTeach_name()+" 과정이 신청되었습니다.\n수강 취소 기간은 " + strDate + "~" + endDate + "까지 입니다");
                } else {
                    res.setMessage((String) addResult[1]);
                }
            } else if (student.getEditMode().equals("CANCEL")) {
                student.setMember_key(getSessionUserSeqNo(request));
                studentService.cancelStudent(student);

                res.setValid(true);
                res.setMessage("취소 되었습니다.");
                res.setUrl("applyList.do");
                res.setData("group_idx=" + student.getGroup_idx() + "&category_idx=" + student.getCategory_idx() + "&menu_idx=" + student.getMenu_idx());
            }
        } else {
            res.setValid(false);
            res.setResult(result.getAllErrors());
        }

        return res;
    }

    @RequestMapping(value = {"/{type}/librarian.*"})
    public String librarian (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        setBoardListToModelIct(homepage.getHomepage_id(), model);

        return basePath(request) + type + "/librarian";
    }

    @RequestMapping(value = {"/{type}/librarianDetail.*"})
    public String librarianDetail (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + type + "/librarianDetail";
    }

    private void setBoardListToModel(String homepage_id, Model model) {
        try{
            String[] boardInfoList = ResourceBundle.getBundle("board").getString(homepage_id).split(",");
            for (String oneStr : boardInfoList) {
                if (!StringUtils.isEmpty(oneStr)) {
                    String[] boardInfo = oneStr.split("/");
                    String key = boardInfo[0];
                    int manage_idx = Integer.parseInt(boardInfo[1]);
                    int count = 20;
                    BoardManage boardManage = boardManageService.getBoardManageOne(new BoardManage(homepage_id, manage_idx));
                    model.addAttribute(key, boardService.getBoardByMainKiosk(manage_idx, count, boardManage));
                }
            }
        }catch (MissingResourceException ex) {
            log.debug("MissingResourceException : "+ex);
        }
    }

    private void setBoardListToModelIct(String homepage_id, Model model) {
        try{
            String[] boardInfoList = ResourceBundle.getBundle("ict").getString(homepage_id).split(",");
            for (String oneStr : boardInfoList) {
                if (!StringUtils.isEmpty(oneStr)) {
                    String[] boardInfo = oneStr.split("/");
                    String key = boardInfo[0];
                    int manage_idx = Integer.parseInt(boardInfo[1]);
                    int count = 20;
                    BoardManage boardManage = boardManageService.getBoardManageOne(new BoardManage(homepage_id, manage_idx));
                    List<Board> boardList = boardService.getBoardByMainNoCache(manage_idx, count, boardManage);
                    if ("BOOK".equals(boardManage.getBoard_type())) {
                        if (boardList == null || boardList.isEmpty()) {
                            boardManage.setBoard_type("ICT");
                            boardList = boardService.getBoardByMainNoCache(manage_idx, count, boardManage);
                            boardManage.setBoard_type("BOOK");
                        }
                    }
                    model.addAttribute(key, boardList);
                }
            }
        }catch (MissingResourceException ex) {
            log.debug("MissingResourceException : "+ex);
        }
    }


    @RequestMapping(value = {"/{type}/ai.*"})
    public String ai(@PathVariable String context_path,@PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return basePath(request) + type + "/ai";
    }

    @RequestMapping(value = {"/{type}/aiResult.*"})
    public String aiResult(LibrarySearch librarySearch, @PathVariable String type, @PathVariable String context_path, Model model, @RequestParam(value = "question", required = false) String question, HttpServletRequest request) {
        if (question == null) {
            question = "";
        }
        librarySearch.setSearch_text(question);

        model.addAttribute("searchText", question);
        return basePath(request) + type + "/aiResult";
    }

    @RequestMapping(value = {"/{type}/aiDetail.*"})
    public String aiDetail (@PathVariable String context_path, @PathVariable String type, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);

        try {
            result = bookImageService.resultImageMap(result ,librarySearch, "dsItemDetail", "IMAGE_URL");
            bookDescriptionService.resultDescriptionMap(result, librarySearch, "dsItemDetail", "contentsDetail");

            Map<String, Object> params = new HashMap<String, Object>();
            params.put("input", librarySearch.getSearch_text());
            params.put("isbn", librarySearch.getIsbn());

            String apiUrl = null;
            if (context_path.equals("yc")) {
                apiUrl = CommonAPI.YC_API_URL;
            } else if (context_path.equals("yy")) {
                apiUrl = CommonAPI.YY_API_URL;
            }
            Map<String, Object> aiResasonResult = CommonAPI.sendAiAPI("recommendation/reason", params, apiUrl);

            if (aiResasonResult != null) {
                String reason = aiResasonResult.get("recommend_reason").toString();
                result.put("reason", reason);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("detail", result);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + type + "/aiDetail";
    }

}
