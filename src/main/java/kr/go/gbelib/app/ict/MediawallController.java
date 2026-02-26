package kr.go.gbelib.app.ict;

import kr.co.whalesoft.app.board.Board;
import kr.co.whalesoft.app.board.BoardService;
import kr.co.whalesoft.app.cms.boardManage.BoardManage;
import kr.co.whalesoft.app.cms.boardManage.BoardManageService;
import kr.co.whalesoft.app.cms.boardWordFilter.BoardWordFilter;
import kr.co.whalesoft.app.cms.boardWordFilter.BoardWordFilterService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.co.whalesoft.framework.utils.WebFilterCheckUtils;
import kr.go.gbelib.app.cms.module.teach.Teach;
import kr.go.gbelib.app.cms.module.teach.TeachService;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.bookImage.BookImageService;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import kr.go.gbelib.app.intro.search.LibrarySearchService;
import net.sf.classifier4J.util.WFMPPost;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FilenameFilter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = {"/{context_path}/ict/mediawall"})
public class MediawallController extends BaseController {
    @Autowired
    private LibrarySearchService service;

    @Autowired
    private BoardService boardService;

    @Autowired
    private BoardManageService boardManageService;

    @Autowired
    private BookImageService bookImageService;

    @Autowired
    private CalendarManageService calendarManageService;

    @Autowired
	private BoardWordFilterService boardWordFilterService;

    @Autowired
    private TeachService teachService;

    public final static String ICT_TYPE = "/ict/type";
    public final static String MEDIAWALL = "/mediawall/";

    private String basePath (HttpServletRequest request) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        return ICT_TYPE + homepage.getMediawall_type() + MEDIAWALL;
    }

    private static final long SLIDE_INTERVAL_MS = 10000L; // 10초

    private static final long EPOCH_START_MS = 1735660800000L;

    private long getCurrentMillis() {
        return System.currentTimeMillis();
    }

    private String[] getFiles(String realPath) {
        File dir = new File(realPath);
        if (!dir.exists()) return new String[0];

        String[] files = dir.list(new FilenameFilter() {
            public boolean accept(File d, String name) {
                String lower = name.toLowerCase();
                return lower.endsWith(".jpg") ||
                       lower.endsWith(".png") ||
                       lower.endsWith(".webp") ||
                       lower.endsWith(".gif");
            }
        });

        if (files == null) return new String[0];
        Arrays.sort(files);
        return files;
    }

    @RequestMapping(value = {"/index.*"})
    public String index (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "index";
    }

    @RequestMapping(value = {"/notice.*"})
    public String notice (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        setBoardListToModel(homepage.getHomepage_id(), model);

        return basePath(request) + "notice";
    }

    @RequestMapping(value = {"/event.*"})
    public String event (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
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

        return basePath(request) + "event";
    }

    @RequestMapping(value = {"/bookInfo.*"})
    public String bookInfo (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        if (StringUtils.isEmpty(librarySearch.getvLoca())) {
            librarySearch.setvLoca(homepage.getHomepage_code());
        }

        Map<String, Object> result = LibSearchAPI.getNewBookList(librarySearch, null);

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

        model.addAttribute("newBookList", result);
        model.addAttribute("bestBookList", bestBookResult);

        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "bookInfo";
    }

    @RequestMapping(value = {"/closeDay.*"})
    public String closeDay (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        /*librarySearch.setManageCode(homepage.getManage_code());

        Map<String, Object> result = LibSearchAPI.getCloseDay(librarySearch);

        List<String> closeDayList = (List<String>) result.get("day_of_holidays");

        model.addAttribute("closeDayList", closeDayList);*/

        return basePath(request) + "closeDay";
    }

    @RequestMapping(value = {"/loanDay.*"})
    public String loanDay(@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Calendar calendar = Calendar.getInstance();

        SimpleDateFormat monthFormat = new SimpleDateFormat("MM");
        SimpleDateFormat dayFormat = new SimpleDateFormat("dd");

        String month = monthFormat.format(calendar.getTime());
        String day = dayFormat.format(calendar.getTime());

        model.addAttribute("day", day);
        model.addAttribute("month", month);

        return basePath(request) + "loanDay";
    }

    @RequestMapping(value = {"/loanReturn.*"})
    public String loanReturn (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
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

        return basePath(request) + "loanReturn";
    }

    @RequestMapping(value = {"/returnDay.*"})
    public String returnDay (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        /*librarySearch.setManageCode(homepage.getManage_code());

        Map<String, Object> result = LibSearchAPI.getReturnDay(librarySearch);

        String returnPlanDate = result.get("returnPlanDate").toString();
        String returnMonth = returnPlanDate.substring(5,7);
        String returnDay = returnPlanDate.substring(8,returnPlanDate.length());*/

        /*model.addAttribute("returnDay", returnDay);
        model.addAttribute("returnMonth", returnMonth);*/

        return basePath(request) + "returnDay";
    }

    @RequestMapping(value = {"/closedDay.*"})
    public String closedDay (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");
        String[] libCodes = homepage.getHomepage_codeList();
        boolean isHoliday = false;
        if (libCodes != null && libCodes.length > 0) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String today = sdf.format(new Date());
            Map<String, Object> map = LibSearchAPI.getHolidays(libCodes[0], today, today);
            if (map != null) {
                List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("dsHoliday");
                if (list != null && !list.isEmpty()) {
                    model.addAttribute("holiday", list.get(0));
                    isHoliday = true;
                }
            }
        }
        model.addAttribute("isHoliday", isHoliday);
        return basePath(request) + "closedDay";
    }

    @RequestMapping(value = {"/lineOfBook.*"})
    public String lineOfBook (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "lineOfBook";
    }

    @RequestMapping(value = {"/promotion.*"})
    public String promotion (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "promotion";
    }

    @RequestMapping(value = {"/returnDate.*"})
    public String returnDate (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
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

        return basePath(request) + "returnDate";
    }

    @RequestMapping(value = {"/bookDetail.*"})
    public String bookDetail (@PathVariable String context_path, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        if ( StringUtils.isEmpty(librarySearch.getSearch_start_date()) ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            librarySearch.setSearch_start_date(sf.format(DateUtils.addDays(new Date(), -30)));
            librarySearch.setSearch_end_date(sf.format(new Date()));
        }

        if (StringUtils.isEmpty(librarySearch.getvLoca())) {
            librarySearch.setvLoca(homepage.getHomepage_code());
        }

        Map<String, Object> result = LibSearchAPI.getNewBookList(librarySearch, null);

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

        model.addAttribute("newBookList", result);
        model.addAttribute("bestBookList", bestBookResult);

        model.addAttribute("librarySearch", librarySearch);

        return basePath(request) + "bookDetail";
    }

    @RequestMapping(value = {"/gallery.*"})
    public String gallery (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String mode = request.getParameter("mode");
        if (mode == null || mode.trim().isEmpty()) {
            mode = "three";
        }
        mode = mode.toLowerCase();

        String baseFolder = "/resources/ict/typeD/gallery/img/";
        String targetPath = request.getSession().getServletContext().getRealPath(baseFolder + mode);

        String[] files = getFiles(targetPath);
        int totalCount = files.length;

        model.addAttribute("files", files);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("mode", mode);

        return basePath(request) + "gallery";
    }

    @RequestMapping(value = {"/galleryAll.*"})
    public String gallery1 (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String mode = request.getParameter("mode");

        if (mode == null || mode.trim().isEmpty()) {
            mode = "hor";
        }
        mode = mode.toLowerCase();

        String baseFolder = "/resources/ict/typeD/gallery/img/";
        String targetPath = request.getSession().getServletContext().getRealPath(baseFolder + mode);

        String[] files = getFiles(targetPath);
        int totalCount = files.length;

        if (totalCount == 0) {
            model.addAttribute("files", new String[0]);
            model.addAttribute("currentIndex", 0);
            model.addAttribute("totalCount", 0);
            model.addAttribute("elapsedMillis", 0L);
            model.addAttribute("mode", mode);
            return basePath(request) + "galleryAll";
        }

        long currentMillis = getCurrentMillis();
        long elapsedSinceEpoch = currentMillis - EPOCH_START_MS;

        long fullCycleMs = SLIDE_INTERVAL_MS * totalCount;

        long positionInCycle = elapsedSinceEpoch % fullCycleMs;

        int currentIndex = (int) (positionInCycle / SLIDE_INTERVAL_MS);

        long elapsedMillis = positionInCycle % SLIDE_INTERVAL_MS;

        model.addAttribute("files", files);
        model.addAttribute("currentIndex", currentIndex);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("elapsedMillis", elapsedMillis);
        model.addAttribute("mode", mode);

        return basePath(request) + "galleryAll";
    }

    @RequestMapping(value = {"/guestbook.*"})
    public String guestbook (@PathVariable String context_path, Board board, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        board.setHomepage_id(homepage.getHomepage_id());
        List<Board> guestbookList = boardService.getGuestbookList(board);

        model.addAttribute("guestbookList", guestbookList);

        return basePath(request) + "guestbook";
    }

    @RequestMapping(value = {"/createGuestbook.*"})
    public String createGuestbook (@PathVariable String context_path, Board board, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "createGuestbook";
    }

    @RequestMapping(value = {"/guestbookSave.*"}, method = RequestMethod.POST)
	public @ResponseBody JsonResponse guestbookSave(Model model, Board board, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        board.setHomepage_id(homepage.getHomepage_id());

        BoardWordFilter boardWordFilter = boardWordFilterService.getBoardWordFilterOne();

        JsonResponse res = new JsonResponse(request);

        if (boardService.getOneGuestbookByUserName(board) > 0) {
            res.setValid(false);
            res.setMessage("하루에 한번만 전자방명록 등록이 가능합니다.");
            return res;
        }

        if (StringUtils.isNotEmpty(boardWordFilter.getWord())) {
            StringTokenizer st = new StringTokenizer(boardWordFilter.getWord(), ",");
            while(st.hasMoreTokens()) {
                String wordFilter = st.nextToken().trim();

                if(board.getUser_name().indexOf(wordFilter) > -1) {
                    res.setValid(false);
                    res.setMessage(wordFilter + "는(은) 사용할 수 없는 단어입니다.");

                    return res;
                }
                if(board.getContent().indexOf(wordFilter) > -1) {
                    res.setValid(false);
                    res.setMessage(wordFilter + "는(은) 사용할 수 없는 단어입니다.");

                    return res;
                }
            }
        }

        if(!result.hasErrors()) {
            StringBuilder sb = new StringBuilder();
            sb.append(board.getUser_name() + "\n");
            sb.append(board.getContent() + "\n");

            String checkFilter = WebFilterCheckUtils.webFilterCheck("전자방명록 작성자", "전자방명록", sb.toString());
			if (checkFilter != null) {
				res.setValid(false);
                res.setMessage("개인정보는 방명록에 등록하실수 없습니다.");

				return res;
			}

            int addCount = boardService.addGuestbook(board);

            if (addCount > 0) {
                res.setValid(true);
				res.setMessage("방명록에 새 글이 등록 되었습니다.");
            } else {
                res.setValid(false);
                res.setMessage("방명록 작성에 실패하였습니다. 관리자에게 문의해 주세요.");
            }
        } else {
            res.setValid(false);
			res.setMessage("방명록 작성에 실패하였습니다. 관리자에게 문의해 주세요.");
        }

        return res;
    }

    @RequestMapping(value = {"/star{num}.*"})
    public String star (@PathVariable String context_path, @PathVariable("num") int num, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "star" + num;
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

}
