package kr.go.gbelib.app.ict;

import com.google.gson.Gson;
import kr.co.whalesoft.app.board.Board;
import kr.co.whalesoft.app.board.BoardService;
import kr.co.whalesoft.app.cms.boardManage.BoardManage;
import kr.co.whalesoft.app.cms.boardManage.BoardManageService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.login.LoginService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.cms.module.elib.book.Book;
import kr.go.gbelib.app.common.api.CommonAPI;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.common.api.LoginAPI;
import kr.go.gbelib.app.intro.bookDescription.BookDescriptionService;
import kr.go.gbelib.app.intro.bookImage.BookImageService;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import kr.go.gbelib.app.intro.search.LibrarySearchService;
import kr.go.gbelib.app.module.bookKeyword.BookKeyword;
import kr.go.gbelib.app.module.bookKeyword.BookKeywordService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = {"/{context_path}/ict/smartBook"})
public class SmartBookController extends BaseController {
    @Autowired
    private LoginService loginService;

    @Autowired
    private LibrarySearchService service;

    @Autowired
    private BookKeywordService bookKeywordService;

    @Autowired
    private BookImageService bookImageService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private BoardManageService boardManageService;

    @Autowired
    private BookDescriptionService bookDescriptionService;

    public final static String ICT_TYPE = "/ict/type";
    public final static String SMART_BOOK = "/smartBook/";

    private String basePath (HttpServletRequest request) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        return ICT_TYPE + homepage.getSmartbook_type() + SMART_BOOK;
    }

    @RequestMapping(value = {"/main.*"})
    public String mainIndex (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "main";
    }

    @RequestMapping(value = {"/index.*"})
    public String index (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "index";
    }

    @RequestMapping(value = {"/search.*"})
    public String search (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if (librarySearch.getSortField().equals("KWRD")) {
            librarySearch.setSearch_type("KWRD");
        }

        if (StringUtils.isEmpty(librarySearch.getSearch_type())) {
            librarySearch.setSearch_type("L_TITLEAUTHOR");
        }

        librarySearch.setSortField("DISP01");

        Map<String, Object> result = null;

        if ( librarySearch.getLibraryCodes() == null ) {
            List<String> libraryCodes = new ArrayList<String>();
            if ( StringUtils.isEmpty(homepage.getHomepage_code()) || homepage.getHomepage_code().equals("98889888") ) {
                libraryCodes.add("ALL");
            }
            else {

                if (StringUtils.isNotEmpty(homepage.getHomepage_code())) {
                    String[] homepage_codes = homepage.getHomepage_code().split(",");

                    for (String homepage_code : homepage_codes) {
                        libraryCodes.add(homepage_code);
                    }
                }
            }
            librarySearch.setLibraryCodes(libraryCodes);
        }

        if (StringUtils.isNotEmpty(librarySearch.getSearch_text())) {
            List<Map<String, Object>> getBookList = null;

            result = LibSearchAPI.getSearchIlus(librarySearch, librarySearch.getViewPage());

            try {
                result = bookImageService.resultImageMap(result, librarySearch, "dsResult", "IMAGE_URL");
            } catch (Exception e) {
                e.printStackTrace();
            }

            if ( result != null ) {
                if (!StringUtils.equals(result.get("code").toString(), "0000")) {
                    service.alertMessage(result.get("msg").toString(), request, response);
                    return null;
                }

                int totalCount = 0;
                if ( result.get("totalCnt") != null ) {
                    totalCount = Integer.parseInt(result.get("totalCnt").toString());
                }

                service.setPaging(model, totalCount, librarySearch); // 페이징 처리

                LibSearchAPI.addMarcUrls(result);

                model.addAttribute("result", result); // 검색한 결과
            }
        }

        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "search";
    }

    @RequestMapping(value = {"/searchDetail.*"})
    public String searchDetail(@PathVariable String context_path, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);
        model.addAttribute("detail", result);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "searchDetail";
    }

    @RequestMapping(value = {"/indexDetail.*"}, produces = "application/json; charset=UTF-8")
    public @ResponseBody String indexDetail(@PathVariable String context_path,@RequestParam("loca") String vLoca, @RequestParam("ctrl") String vCtrl, LibrarySearch librarySearch, HttpServletResponse response) {
        librarySearch.setvLoca(vLoca);
        librarySearch.setvCtrl(vCtrl);

        Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);

        Gson gson = new Gson();
        String json = gson.toJson(result);

        return json;
    }

    @RequestMapping(value = {"/detail{type}.*"})
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

        if (homepage.getHomepage_id().equals("h23")) {
            librarySearch.setvLoca("00147015");
        }
        librarySearch.setEndRowNum(10);

        Map<String, Object> newBookResult = bookImageService.resultImageMap(LibSearchAPI.getNewBookList(librarySearch, null),librarySearch, "dsNewBookList", "COVER_SMALLURL");
        bookDescriptionService.resultDescriptionMap(newBookResult, librarySearch, "dsNewBookList", "contentsDetail");

        model.addAttribute("newBookList", newBookResult);

        return basePath(request) + "detail" + type;
    }

    @RequestMapping(value = {"/aiDetail.*"})
    public String aiDetail (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
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

        return basePath(request) + "aiDetail";
    }


    @RequestMapping(value = {"/getDetailInfo.*"},method = RequestMethod.GET)
    public @ResponseBody Map<String,Object> getDetailInfo (LibrarySearch librarySearch) {
        Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);
        try {
            result = bookImageService.resultImageMap(result ,librarySearch, "dsItemDetail", "IMAGE_URL");
            bookDescriptionService.resultDescriptionMap(result, librarySearch, "dsItemDetail", "contentsDetail");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping(value = {"/newBook.*"})
    public String newBook (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if(StringUtils.isEmpty(librarySearch.getSearch_end_date())) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        if (StringUtils.isEmpty(librarySearch.getvLoca())) {
            librarySearch.setvLoca(homepage.getHomepage_code());
        }

        librarySearch.setEndRowNum(36);

        Map<String, Object> newBookResult = bookImageService.resultImageMap(LibSearchAPI.getNewBookList(librarySearch, null),librarySearch, "dsNewBookList", "COVER_SMALLURL");

        model.addAttribute("newBookList", newBookResult);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "newBook";
    }

    @RequestMapping(value = {"/bestBook.*"})
    public String bestBook (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        librarySearch.setvLoca(homepage.getHomepage_code());

        if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -3);
        Map<String, Object> result = LibSearchAPI.getBestBookList(librarySearch);

        try {
            result = bookImageService.resultImageMap(result ,librarySearch, "dsLoanBestList", "COVER_SMALLURL");
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("bestBookList", result);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "bestBook";
    }

    @RequestMapping(value = {"/myLibrary.*"})
    public String myLibrary (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage)request.getAttribute("homepage");
        Member member = getSessionMemberInfo(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        Date currentDate = new Date();

        if (isLogin(request)) {

            Map<String, Object> myLibraryList = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "LOAN", "0001");
            if (myLibraryList!= null && !myLibraryList.isEmpty()) {
                List<Map<String, Object>> dsMyLibraryList = (List<Map<String, Object>>) myLibraryList.get("dsMyLibraryList");

                for (Map<String, Object> getLibraryList : dsMyLibraryList) {
                    String returnPlanDateStr = (String) getLibraryList.get("RETURN_PLAN_DATE");
                    Date returnPlanDate = formatter.parse(returnPlanDateStr);

                    long diffInMillies = returnPlanDate.getTime() - currentDate.getTime();
                    long daysBetween = diffInMillies / (1000 * 60 * 60 * 24);

                    if (daysBetween <= 3 && daysBetween >= 0) {
                        getLibraryList.put("RETURN_CHECK", true);
                    } else {
                        getLibraryList.put("RETURN_CHECK", false);
                    }
                }
            }
            model.addAttribute("loanList", myLibraryList);
        }

        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "myLibrary/myLibrary";
    }

    @RequestMapping(value = {"/login.*"})
    public String login (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "login";
    }

    @RequestMapping(value = {"/rfidLogin.*"})
    public String rfidLogin (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "rfidLogin";
    }

    @RequestMapping(value = {"/loginProc.*"})
    public @ResponseBody JsonResponse loginProc (Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable String context_path) throws Exception {
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

    @RequestMapping(value = {"/rfidProc.*"})
    public @ResponseBody JsonResponse rfidProc (Model model, Member member, HttpServletRequest request, HttpServletResponse response, @PathVariable("context_path") String context_path) throws Exception {
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
        }

        return res;
    }

    @RequestMapping(value = "/logout.*")
    public String logout(@PathVariable String context_path, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        loginService.logout(request);

        return String.format("redirect:/%s/ict/smartBook/main.do", context_path);
    }

    @RequestMapping(value = {"/keywordRecom.*"})
    public String keywordRecom(@PathVariable String context_path, LibrarySearch librarySearch, BookKeyword bookKeyword, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //키워드 추천
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        Member member = getSessionMemberInfo(request);

        if(!isLogin(request) || StringUtils.isEmpty(member.getBirth_day())) {
            librarySearch.setSex(bookKeyword.getSex());
            librarySearch.setBook_keyword_age(bookKeyword.getAge());
        } else {
            librarySearch.setSex(member.getSex());
            librarySearch.setBirth_year(member.getBirth_day().split("-")[0]);

            bookKeyword.setSex(member.getSex());

            if (StringUtils.isNotEmpty(librarySearch.getBirth_year())) {
                LocalDate now = LocalDate.now();

                int year = now.getYear();
                String b_y = librarySearch.getBirth_year().replaceAll("[^0-9]", "");
                int birth_year = Integer.parseInt(b_y.substring(0,4));
                int age = year - birth_year + 1;

                if (age <= 4) {
                    bookKeyword.setAge("영유아");
                } else if (age >= 5 && age <= 7) {
                    bookKeyword.setAge("유아");
                } else if (age >= 8 && age <= 13) {
                    bookKeyword.setAge("초등");
                } else if (age >= 14 && age <= 19) {
                    bookKeyword.setAge("청소년");
                } else if (age >= 20 && age <= 29) {
                    bookKeyword.setAge("20대 이상");
                } else if (age >= 30 && age <= 39) {
                    bookKeyword.setAge("30대 이상");
                } else if (age >= 40 && age <= 49) {
                    bookKeyword.setAge("40대 이상");
                } else if (age >= 50 && age <= 59) {
                    bookKeyword.setAge("50대 이상");
                } else if (age >= 60) {
                    bookKeyword.setAge("60대 이상");
                } else {
                    bookKeyword.setAge("20대 이상");
                }
            }
        }

        List<BookKeyword> bookKeywordList = bookKeywordService.getBookKeywordList(bookKeyword);
        model.addAttribute("bookKeywordList", bookKeywordList);

        model.addAttribute("member", member);
        model.addAttribute("bookKeyword", bookKeyword);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "keywordRecom";
    }

    @RequestMapping (value = {"/keyword.*"})
    public String keyword(@PathVariable String context_path, Model model, BookKeyword bookKeyword, HttpServletRequest request) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        Member sessionMemberInfo = getSessionMemberInfo(request);

        model.addAttribute("member", sessionMemberInfo);
        model.addAttribute("bookKeyword", bookKeyword);

        List<BookKeyword> bookKeywordList = bookKeywordService.getBookKeywordList(bookKeyword);
        model.addAttribute("bookKeywordList", bookKeywordList);

        return basePath(request) + "keyword";
    }

    @RequestMapping (value = {"/getKeywordList.*"})
    public @ResponseBody Map<String,Object> getKeywordList(@PathVariable String context_path, Model model, BookKeyword bookKeyword, HttpServletRequest request) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        Map<String,Object> result = new HashMap<String,Object>();

        List<BookKeyword> bookKeywordList = bookKeywordService.getBookKeywordList(bookKeyword);
        model.addAttribute("bookKeywordList", bookKeywordList);
        result.put("bookKeywordList", bookKeywordList);
        return result;
    }

    @RequestMapping(value = {"/keywordRecomResult.*"})
    public String keywordRecomResult(@PathVariable String context_path, Model model, BookKeyword bookKeyword, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
        librarySearch.setKeyword(bookKeyword.getKeyword_name());

        List<Map<String, Object>> getKeywordBookList = null;

        if (context_path.equals("yy") || context_path.equals("yc")) {
            String apiUrl = apiUrl = context_path.equals("yy") ? CommonAPI.YY_API_URL : CommonAPI.YC_API_URL;
            getKeywordBookList = LibSearchAPI.getBookKeywordSearchList2(librarySearch,apiUrl);
        } else {
            getKeywordBookList = LibSearchAPI.getBookKeywordSearchList(librarySearch);
        }

        model.addAttribute("bookKeyword", bookKeyword);
        model.addAttribute("getKeywordBookList", getKeywordBookList);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "keywordRecomResult";
    }

    @RequestMapping(value = {"/aiResultList.*"})
    public @ResponseBody Map<String, Object>  aiResultList (LibrarySearch librarySearch,@PathVariable String context_path, @RequestParam("question") String question, @RequestParam("sourceType") String sourceType,HttpServletRequest request) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        librarySearch.setSearch_text(question);
        String apiUrl = null;
        if (homepage.getContext_path().equals("yc")) {
            apiUrl = CommonAPI.YC_API_URL;
        } else if (homepage.getContext_path().equals("yy")) {
            apiUrl = CommonAPI.YY_API_URL;
        }
        List<Map<String, Object>> result = LibSearchAPI.aiRecomendation(librarySearch, apiUrl);

        List<String> isbnList = new ArrayList<String>();
        Map<String,Map<String, Object>> resultMap = new HashMap<String, Map<String, Object>>();
        for (Map<String, Object> map : result) {
            String isbn = map.get("isbn").toString();
            isbnList.add(isbn);
            resultMap.put(isbn, map);
        }

        librarySearch.setSearch_type("L_ISBN");
        librarySearch.setSortField("DISP01");
        if ( librarySearch.getLibraryCodes() == null ) {
            List<String> libraryCodes = new ArrayList<String>();
            if ( StringUtils.isEmpty(homepage.getHomepage_code()) || homepage.getHomepage_code().equals("98889888") ) {
                libraryCodes.add("ALL");
            }
            else {
                if (StringUtils.isNotEmpty(homepage.getHomepage_code())) {
                    String[] homepage_codes = homepage.getHomepage_code().split(",");
                    libraryCodes.addAll(Arrays.asList(homepage_codes));
                }
            }
            librarySearch.setLibraryCodes(libraryCodes);
        }

        for (String isbn : isbnList) {
            librarySearch.setSearch_text(isbn);
            Map<String, Object> searchIlus = LibSearchAPI.getSearchIlus(librarySearch, 1);

            if (searchIlus != null && searchIlus.containsKey("dsResult")) {
                List<Object> dsResultList = (List<Object>) searchIlus.get("dsResult");
                Map<String,Object> dsResult = (Map<String, Object>) dsResultList.get(0);
                resultMap.get(isbn).put("detail", dsResult);
            } else {
                resultMap.remove(isbn);
            }
        }

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("searchText", question);
        map.put("bookList", resultMap.values());
        return map;
    }

    @RequestMapping(value = {"/aiLibraryagent.*"})
    public Map<String, Object> aiLibraryAgent(@PathVariable String context_path,LibrarySearch config) {
        Map<String, Object> params = new HashMap<String, Object>();
        Map<String, Object> result = new HashMap<String, Object>();

        if (StringUtils.isNotEmpty(config.getSearch_text())) {
            params.put("input", config.getSearch_text());
        }
        params.put("stream", "false");

        String apiUrl = null;
        if (context_path.equals("yc")) {
            apiUrl = CommonAPI.YC_API_URL;
        } else if (context_path.equals("yy")) {
            apiUrl = CommonAPI.YY_API_URL;
        }

        result = CommonAPI.sendAiAPI("chat/library_info", params, apiUrl);
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        if (result != null) {
            try {
                String status = (String) result.get("result");

                if ("success".equals(status)) {
                    return result;
                } else {
                    System.out.println("AI 추천 API 호출 결과 실패: result=" + status);
                }
            } catch (Exception e) {
                System.out.println("AI 추천 데이터 파싱 오류: " + e.getMessage());
            }
        }

        return result;
    }

    @RequestMapping(value = {"/smartBookRecom.*"})
    public String smartBookRecom(@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member member = getSessionMemberInfo(request);

        if (isLogin(request)) {
            if(!member.isAdmin()){
                librarySearch.setBirth_year(member.getBirth_day().split("-")[0]);

                librarySearch.setGender(member.getSex());

                if (StringUtils.isNotEmpty(librarySearch.getBirth_year())) {
                    LocalDate now = LocalDate.now();

                    int year = now.getYear();
                    String b_y = librarySearch.getBirth_year().replaceAll("[^0-9]", "");
                    int birth_year = Integer.parseInt(b_y.substring(0,4));
                    int age = year - birth_year + 1;

                    librarySearch.setPublicPopularAge(Integer.toString(age));
                }
            }
        }

        if (librarySearch.getStartDt() == null || librarySearch.getEndDt() == null) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            int beforeDays = -7;
            librarySearch.setStartDt(sf.format(DateUtils.addDays(new Date(), beforeDays)));
            librarySearch.setEndDt(sf.format(new Date()));
        }

        if (librarySearch.getKdc() == null) {
            String[] kdc = {""};
            librarySearch.setKdc(kdc);
        }

        if (librarySearch.getRegion() == null) {
            String[] region = {""};
            librarySearch.setRegion(region);
        }

        if (librarySearch.getLibCode() == null) {
            librarySearch.setLibCode("");
        }

        librarySearch.setRowCount(50);

        Map<String, Object> result = LibSearchAPI.getPopularBookList(librarySearch);
        Map<String, Object> resultMap = null;
        List<Map<String, Object>> list = null;

        if (result != null) {
            resultMap = (Map<String, Object>) result.get("response");
        }

        if (resultMap != null) {
            if (resultMap.get("docs") != null && !resultMap.get("docs").equals("")) {
                resultMap = (Map<String, Object>) resultMap.get("docs");
            }
        }

        if (result != null && !result.isEmpty() && resultMap != null) {
            list = (ArrayList<Map<String, Object>>) resultMap.get("doc");
        }

        model.addAttribute("popularBookList", list);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "smartBookRecom";
    }

    @RequestMapping(value = {"/librarianRecom.*"})
    public String librarianRecom(@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        setBoardListToModel(homepage.getHomepage_id(), model);

        return basePath(request) + "/librarianRecom";
    }

    @RequestMapping(value = {"/librarianDetail.*"})
    public String librarianDetail (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        librarySearch.setvLoca(homepage.getHomepage_code());

        if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -3);
        Map<String, Object> result = LibSearchAPI.getBestBookList(librarySearch);

        try {
            result = bookImageService.resultImageMap(result ,librarySearch, "dsLoanBestList", "COVER_SMALLURL");
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("bestBookList", result);
        if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        if (StringUtils.isEmpty(librarySearch.getvLoca())) {
            librarySearch.setvLoca(homepage.getHomepage_code());
        }

        Map<String, Object> newBookResult = LibSearchAPI.getNewBookList(librarySearch, null);
        List<Map<String, Object>> newBookList = (List<Map<String, Object>>) newBookResult.get("dsNewBookListCnt");
        Map<String, Object> newBookCnt = (Map<String, Object>) newBookList.get(0);
        int newBookCount = Integer.parseInt(String.valueOf(newBookCnt.get("CNT")));

        librarySearch.setTotalDataCount(newBookCount);
        newBookResult = bookImageService.resultImageMap(LibSearchAPI.getNewBookList(librarySearch, null),librarySearch, "dsNewBookList", "COVER_SMALLURL");

        model.addAttribute("newBookList", newBookResult);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "/librarianRecomDetail";
    }

    @RequestMapping(value = {"/bigDataRecom.*"})
    public String recomBook(@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //빅데이터 추천
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if (librarySearch.getStartDt() == null || librarySearch.getEndDt() == null) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            int beforeDays = -7;
            librarySearch.setStartDt(sf.format(DateUtils.addDays(new Date(), beforeDays)));
            librarySearch.setEndDt(sf.format(new Date()));
        }
        if (librarySearch.getGender() == null) {
            librarySearch.setGender("");
        }
        if (StringUtils.isEmpty(librarySearch.getPublicPopularAge())) {
            String publicPopularAge = "0";
            librarySearch.setPublicPopularAge(publicPopularAge);
        }
        if (librarySearch.getKdc() == null) {
            String[] kdc = {""};
            librarySearch.setKdc(kdc);
        }
        if (librarySearch.getRegion() == null) {
            String[] region = {""};
            librarySearch.setRegion(region);
        }
        if (librarySearch.getLibCode() == null) {
            librarySearch.setLibCode("");
        }

        librarySearch.setRowCount(50);

        Map<String, Object> result = LibSearchAPI.getPopularBookList(librarySearch);
        Map<String, Object> resultMap = null;
        List<Map<String, Object>> list = null;

        if (result != null) {
            resultMap = (Map<String, Object>) result.get("response");
        }

        if (resultMap != null) {
            if (resultMap.get("docs") != null && !resultMap.get("docs").equals("")) {
                resultMap = (Map<String, Object>) resultMap.get("docs");
            }
        }

        if (result != null && !result.isEmpty() && resultMap != null) {
            list = (ArrayList<Map<String, Object>>) resultMap.get("doc");
        }

        model.addAttribute("popularBookList", list);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "/bigDataRecom";
    }

    @RequestMapping(value = {"/bookLocationInfoSearchList.*"})
    public String bookLocationInfoSearchList(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "/bookLocationInfoSearchList";
    }

    @RequestMapping(value = {"/bookDetailResult.*"})
    public String bookDetailResult(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "/bookDetailResult";
    }

    @RequestMapping(value = {"/ai.*"})
    public String ai(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return basePath(request) + "ai";
    }

    @RequestMapping(value = {"/aiResult.*"})
    public String aiResult(LibrarySearch librarySearch, @PathVariable String context_path, Model model, @RequestParam(value = "question", required = false) String question, HttpServletRequest request) {
        if (question == null) {
            question = "";
        }
        librarySearch.setSearch_text(question);

        model.addAttribute("searchText", question);
        return basePath(request) + "aiResult";
    }

    @RequestMapping(value = {"/bigData.*"})
    public String bigData(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "bigData";
    }

    @RequestMapping(value = {"/chart.*"})
    public String chart(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "chart";
    }

    @RequestMapping(value = {"/custom.*"})
    public String custom(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "custom";
    }

    @RequestMapping(value = {"/detail.*"})
    public String detail(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "detail";
    }

    @RequestMapping(value = {"/librarian.*"})
    public String librarian(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "librarian";
    }

    @RequestMapping(value = {"/loanList.*"})
    public String loanList(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Date currentDate = new Date();

        Map<String, Object> myLibraryList = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "LOAN", "0001");
        if (myLibraryList!= null && !myLibraryList.isEmpty()) {
            List<Map<String, Object>> dsMyLibraryList = (List<Map<String, Object>>) myLibraryList.get("dsMyLibraryList");

            for (Map<String, Object> getLibraryList : dsMyLibraryList) {
                String returnPlanDateStr = (String) getLibraryList.get("RETURN_PLAN_DATE");
                Date returnPlanDate = formatter.parse(returnPlanDateStr);

                long diffInMillies = returnPlanDate.getTime() - currentDate.getTime();
                long daysBetween = diffInMillies / (1000 * 60 * 60 * 24);

                if (daysBetween <= 3 && daysBetween >= 0) {
                    getLibraryList.put("RETURN_CHECK", true);
                } else {
                    getLibraryList.put("RETURN_CHECK", false);
                }
            }
        }

        model.addAttribute("loanList", myLibraryList);

        return basePath(request) + "loanList";
    }

    @RequestMapping(value = {"/loanHistoryList.*"})
    public String loanHistoryList(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        model.addAttribute("loanHistoryList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "LOAN", null));

        return basePath(request) + "loanHistoryList";
    }

    @RequestMapping(value = {"/reserveList.*"})
    public String reserveList(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        model.addAttribute("reserveList", LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "RESVE", null));

        return basePath(request) + "reserveList";
    }

    @RequestMapping(value = {"/myPage.*"})
    public String myPage(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> myLibraryList = LibSearchAPI.getMyLibraryList("WEB", getSessionUserId(request), "LOAN", null);

		int loanCnt = 0;//소속도서관 대출건수
		int delayCnt = 0; //연체건수

		String memberLoca = getSessionMemberInfo(request).getLoca();

        if (myLibraryList != null && myLibraryList.containsKey("dsMyLibraryList")) {
			//전체 대출 내역을 가져온다.
			@SuppressWarnings ("unchecked")
			List<Map<String, String>> loanList = (List<Map<String, String>>) myLibraryList.get("dsMyLibraryList");

			if (loanList != null && loanList.size() > 0) {
				for ( Map<String, String> map : loanList ) {
					String mapLoca = map.get("LOCA");
					//점촌땜에 contains로 한다. equals하면 안됨.
					if (memberLoca.contains(mapLoca)) {
						//소속도서관 카운트 증가
						loanCnt++;
					}

					//대출중인 도서에 한해서 연체 수 증가
					if (org.apache.commons.lang3.StringUtils.equals(map.get("RETURN_TYPE"), "0001")) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
						String returnPlanDate = map.get("RETURN_PLAN_DATE");
						Date planDate = sdf.parse(returnPlanDate);
						String toDayStr = sdf.format(new Date());
						Date currentDate = sdf.parse(toDayStr);

						if (planDate.compareTo(currentDate) < 0) {
							//대출 도서관과 상관없이 연체수 증가
							delayCnt++;
						}
					}
				}
			}
		}

        model.addAttribute("loanCnt", loanCnt);
        model.addAttribute("delayCnt", delayCnt);

        return basePath(request) + "myPage";
    }

    @RequestMapping(value = {"/nav.*"})
    public String nav(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "nav";
    }

    @RequestMapping(value = {"/result.*"})
    public String result(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "result";
    }

    @RequestMapping(value = {"/rfid.*"})
    public String rfid(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "rfid";
    }

    private void setBoardListToModel(String homepage_id, Model model) {
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
}
