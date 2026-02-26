package kr.go.gbelib.app.ict;

import kr.co.whalesoft.app.board.Board;
import kr.co.whalesoft.app.board.BoardService;
import kr.co.whalesoft.app.cms.boardManage.BoardManage;
import kr.co.whalesoft.app.cms.boardManage.BoardManageService;
import kr.co.whalesoft.app.cms.code.CodeService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.login.LoginService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.app.cms.terms.TermsService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = {"/{context_path}/ict/info"})
public class InfoController extends BaseController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private BoardManageService boardManageService;

    @Autowired
    private BookImageService bookImageService;

    @Autowired
    private CalendarManageService calendarManageService;

    @Autowired
    private TeachService teachService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryGroupService categoryGroupService;

    @Autowired
    private BookDescriptionService bookDescriptionService;

    public final static String ICT_TYPE = "/ict/type";
    public final static String INFO = "/info/";

    private String basePath (HttpServletRequest request) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        return ICT_TYPE + homepage.getBoard_type() + INFO;
    }

    @RequestMapping(value = {"/{type}/main.*"})
    public String main (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + type + "/main";
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

    @RequestMapping(value = {"/{type}/event.*"})
    public String event (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM");

        CalendarManage cm = new CalendarManage();

        if (StringUtils.isEmpty(cm.getPlan_date())) {
            cm = new CalendarManage(sf.format(Calendar.getInstance().getTime()));
        }
        cm.setHomepage_id(homepage.getHomepage_id());
        List<CalendarManage> eventList = null;
        if (homepage.getHomepage_id().equals("h17") || homepage.getHomepage_id().equals("h23")) {
            eventList = calendarManageService.getToDayEvent(cm);
            sf = new SimpleDateFormat("yyyy-MM-dd");
            String planDate = sf.format(Calendar.getInstance().getTime());
            List<Teach> teachList = teachService.getTeachListForCalendar(cm);
            for (int i = 0; i< teachList.size(); i++) {
                Teach teach = teachList.get(i);
                String start_date = teach.getStart_date();
                String end_date = teach.getEnd_date();
                Calendar cal = Calendar.getInstance(); // 서버 로컬 타임존 기준
                int dayCode = cal.get(Calendar.DAY_OF_WEEK);
                for (String day : teach.getTeach_day_arr()) {
                    if ( dayCode == Integer.parseInt(day) ) {
                        if (start_date.compareTo(planDate) <= 0 && end_date.compareTo(planDate) >= 0) {
                            boolean isHoliday = false;
                            if (teach.getHolidays() != null && !teach.getHolidays().isEmpty()) {
                                for ( String holiday : teach.getHolidays() ) {
                                    if (StringUtils.equals(planDate, holiday)) {
                                        isHoliday = true;
                                    }
                                }
                            }
                            // 휴관일이 아닌경우
                            if (!isHoliday) {
                                CalendarManage calendarManage = new CalendarManage();
                                calendarManage.setTitle("[강좌]"+teach.getTeach_name());
                                calendarManage.setStart_time(teach.getStart_time());
                                calendarManage.setEnd_time(teach.getEnd_time());
                                calendarManage.setContents(teach.getTeach_stage());
                                eventList.add(calendarManage);
                            }
                        }

                    }
                }
            }

        } else {
            eventList = calendarManageService.getEvent(cm);
        }

        model.addAttribute("eventList", eventList);

        return basePath(request) + type + "/event";
    }

    @RequestMapping(value = {"/{type}/librarianRecom.*"})
    public String librarianRecom (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        setBoardListToModelIct(homepage.getHomepage_id(), model);

        return basePath(request) + type + "/librarianRecom";
    }

    @RequestMapping(value = {"/{type}/loanReturn.*"})
    public String loanReturn (@PathVariable String context_path, @PathVariable String type, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Homepage homepage = (Homepage) request.getAttribute("homepage");
        if (StringUtils.isEmpty(librarySearch.getvLoca())) {
            librarySearch.setvLoca(homepage.getHomepage_code());
        }

        Calendar calendar = Calendar.getInstance();

        SimpleDateFormat monthFormat = new SimpleDateFormat("MM");
        SimpleDateFormat dayFormat = new SimpleDateFormat("dd");

        String month = monthFormat.format(calendar.getTime());
        String day = dayFormat.format(calendar.getTime());

        String loanDate = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.KOREAN);

        model.addAttribute("day", day);
        model.addAttribute("month", month);
        model.addAttribute("loanDate", loanDate);

        String result = LibSearchAPI.getReturnDay(librarySearch);

        String returnPlanDate = result;

        int calReturnMonth = Integer.parseInt(returnPlanDate.substring(4,6));
        int calReturnDay = Integer.parseInt(returnPlanDate.substring(6,8));

        SimpleDateFormat returnPlanDateFormat = new SimpleDateFormat("yyyyMMdd");
        Date date = returnPlanDateFormat.parse(returnPlanDate);

        Calendar returnCalendar = Calendar.getInstance();
        returnCalendar.setTime(date);

        String returnDate = returnCalendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.KOREAN);

        String rMonth = returnPlanDate.substring(4,6);
        String rDay = returnPlanDate.substring(6,8);

        model.addAttribute("returnDay", rDay);
        model.addAttribute("returnMonth", rMonth);
        model.addAttribute("returnDate", returnDate);

        return basePath(request) + type + "/loanReturn";
    }

    @RequestMapping(value = {"/{type}/newBook.*"})
    public String newBook (@PathVariable String context_path, @PathVariable String type, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
            bookDescriptionService.resultDescriptionMap(result, librarySearch, "dsNewBookList", "contentsDetail");

//            List<Map<String, Object>> newBookList = (List<Map<String, Object>>) result.get("dsNewBookList");
//
//            String content = "";
//
//            if (newBookList != null && newBookList.size() > 0) {
//                for (Map<String, Object> map : newBookList) {
//                    if(StringUtils.isNotEmpty(map.get("ISBN").toString())) {
//                        librarySearch.setSearch_type("isbn");
//                        librarySearch.setSearch_text(map.get("ISBN").toString());
//                        Map<String, Object> kakaoMap = LibSearchAPI.getKaKaoList(librarySearch);
//
//                        List<Map<String, Object>> itemList = (List<Map<String, Object>>) kakaoMap.get("list");
//
//                        if (itemList != null && itemList.size() > 0) {
//                            for (Map<String, Object> map3 : itemList) {
//                                content = String.valueOf(map3.get("contents"));
//                            }
//
//                            map.put("contentsDetail", content);
//                        }
//                    }
//                }
//            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("newBookList", result);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + type + "/newBook";
    }

    @RequestMapping(value = {"/{type}/livingInfo.*"})
    public String livingInfo (@PathVariable String context_path, @PathVariable String type, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String result = CommonAPI.getNews();

        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            String rssData = result;

            InputSource is = new InputSource(new StringReader(rssData));
            Document doc = builder.parse(is);

            NodeList itemList = doc.getElementsByTagName("item");
            List<Map<String, String>> items = new ArrayList<Map<String, String>>();

            for (int i = 0; i < itemList.getLength(); i++) {
                Node itemNode = itemList.item(i);
                if (itemNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element itemElement = (Element) itemNode;

                    Map<String, String> itemData = new HashMap<String, String>();
                    itemData.put("title", getElementValue(itemElement, "title"));
                    itemData.put("link", getElementValue(itemElement, "link"));
                    itemData.put("category", getElementValue(itemElement, "category"));
                    itemData.put("description", getElementValue(itemElement, "description"));
                    String pubDate = getElementValue(itemElement, "pubDate");
                    if (pubDate != null && pubDate.indexOf("+") > -1) {
                        pubDate = pubDate.substring(0, pubDate.lastIndexOf("+")).trim();
                    }
                    itemData.put("pubDate", pubDate);

                    items.add(itemData);
                }
            }

            model.addAttribute("livingInfoList", items);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return basePath(request) + type + "/livingInfo";
    }

    @RequestMapping(value = {"/{type}/bestBook.*"})
    public String bestBook (@PathVariable String context_path, @PathVariable String type, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("bestBookList", bestBookResult);
        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + type + "/bestBook";
    }

    @RequestMapping(value = {"/{type}/teach.*"})
    public String teach (@PathVariable String context_path, @PathVariable String type, Model model, Teach teach, HttpServletRequest request, HttpServletResponse response) throws Exception {
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

    private static String getElementValue(Element parent, String tagName) {
        NodeList nodeList = parent.getElementsByTagName(tagName);
        if (nodeList.getLength() > 0) {
            return nodeList.item(0).getTextContent().trim();
        }
        return null;
    }
}
