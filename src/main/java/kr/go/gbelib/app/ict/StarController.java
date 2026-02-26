package kr.go.gbelib.app.ict;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.login.LoginService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.bookDescription.BookDescriptionService;
import kr.go.gbelib.app.intro.bookImage.BookImageService;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import kr.go.gbelib.app.intro.search.LibrarySearchService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = {"/{context_path}/ict/star"})
public class StarController extends BaseController {
    @Autowired
    private LoginService loginService;

    @Autowired
    private BookImageService bookImageService;

    @Autowired
    private LibrarySearchService service;

    @Autowired
    private BookDescriptionService bookDescriptionService;

    public final static String ICT_TYPE = "/ict/type";
    public final static String STAR = "/star/";

    private String basePath (HttpServletRequest request) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        return ICT_TYPE + homepage.getSmartbook_type() + STAR;
    }

    // 스마트추천도서, 별자리 콘텐츠 분기 화면
    @RequestMapping(value = {"/hub.*"})
    public String hub (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return basePath(request) + "hub";
    }

    // 별자리 메인
    @RequestMapping(value = {"/main.*"})
    public String mainIndex (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "main";
    }

    // 별자리 정보 안내
    @RequestMapping(value = {"/guide.*"})
    public String guide (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "guide";
    }

    // 키워드가 별자리인 도서목록
    @RequestMapping(value = {"/search.*"})
    public String search (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        librarySearch.setSearch_text("별자리");
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

            try {
                result = LibSearchAPI.getSearchIlus(librarySearch, librarySearch.getViewPage());
                result = bookImageService.resultImageMap(result, librarySearch, "dsResult", "IMAGE_URL");

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

                    model.addAttribute("librarianRecommendList", result); // 검색한 결과
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "search";
    }

    // 키워드가 별자리인 도서 상세페이지
    @RequestMapping(value = {"/bookDetail.*"})
    public String detail (LibrarySearch librarySearch, @PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        try {
             Map<String, Object> result = LibSearchAPI.getBookDetail(librarySearch);

             result = bookImageService.resultImageMap(result ,librarySearch, "dsItemDetail", "IMAGE_URL");
             bookDescriptionService.resultDescriptionMap(result, librarySearch, "dsItemDetail", "contentsDetail");

             model.addAttribute("detail", result);
             model.addAttribute("librarySearch", librarySearch);

             if(StringUtils.isEmpty(librarySearch.getSearch_end_date())) {
                 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
                 librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
                 librarySearch.setSearch_end_date(sf.format(new Date()));
             }

             librarySearch.setEndRowNum(10);

             Map<String, Object> newBookResult = bookImageService.resultImageMap(LibSearchAPI.getNewBookList(librarySearch, null), librarySearch, "dsNewBookList", "COVER_SMALLURL");
             bookDescriptionService.resultDescriptionMap(newBookResult, librarySearch, "dsNewBookList", "contentsDetail");

             model.addAttribute("newBookList", newBookResult);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return basePath(request) + "bookDetail";
    }

    // 내 별자리 알아보기 페이지
    @RequestMapping(value = {"/myStar.*"})
    public String myStarInfo (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return basePath(request) + "myStar";
    }

    // 내 별자리 결과 페이지
    @RequestMapping(value = {"/result.*"})
    public String result (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return basePath(request) + "result";
    }

    @RequestMapping(value = "/logout.*")
    public String logout(@PathVariable String context_path, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        loginService.logout(request);

        return String.format("redirect:/%s/ict/smartBook/main.do", context_path);
    }
}
