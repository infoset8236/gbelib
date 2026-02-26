package kr.go.gbelib.app.ict;

import kr.co.whalesoft.app.board.BoardService;
import kr.co.whalesoft.app.cms.boardManage.BoardManage;
import kr.co.whalesoft.app.cms.boardManage.BoardManageService;
import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.framework.base.BaseController;
import kr.go.gbelib.app.common.api.CommonAPI;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.bookImage.BookImageService;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = {"/{context_path}/ict/media"})
public class MediaController extends BaseController {

    public final static String ICT_TYPE = "/ict/type";
    public final static String PATH = "/media/";

    private String basePath (HttpServletRequest request) {
        Homepage homepage = (Homepage) request.getAttribute("homepage");

        return ICT_TYPE + homepage.getMediawall_type() + PATH;
    }

    @Autowired
    private BoardService boardService;

    @Autowired
    private BoardManageService boardManageService;

    @Autowired
    private BookImageService bookImageService;

    @RequestMapping(value = {"/etiquette{num}.*"})
    public String etiquette (@PathVariable String context_path, @PathVariable("num") int num, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
        returnDate(model, librarySearch, request);

        return basePath(request) + "etiquette" + num;
    }

    @RequestMapping(value = {"/newBook{num}.*"})
    public String newBook (@PathVariable String context_path, @PathVariable("num") int num, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
        returnDate(model, librarySearch, request);

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

            Iterator<Map<String, Object>> iterator = newBookList.iterator();

            while (iterator.hasNext()) {
                Map<String, Object> map = iterator.next();
                Object coverUrl = map.get("COVER_SMALLURL");

                if (coverUrl == null || coverUrl.toString().trim().isEmpty()) {
                    iterator.remove();
                }
            }

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


        return basePath(request) + "newBook" + num;
    }

    @RequestMapping(value = {"/news.*"})
    public String news (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "news";
    }

    @RequestMapping(value = {"/notice{num}.*"})
    public String notice (@PathVariable String context_path, @PathVariable("num") int num, LibrarySearch librarySearch, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        returnDate(model, librarySearch, request);

        Homepage homepage = (Homepage) request.getAttribute("homepage");

        setBoardListToModel(homepage.getHomepage_id(), model);

        return basePath(request) + "notice" + num;
    }

    @RequestMapping(value = {"/return.*"})
    public String mediaReturn (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "return";
    }

    @RequestMapping(value = {"/stairs2.*"})
    public String stairs2 (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //그림
//        String domesticPath = request.getServletContext()
//                .getRealPath("/resources/ict/dglib/media/img/stairs/gallery");

//        File domesticDir = new File(domesticPath);
//
//        String[] domesticFiles = (domesticDir.exists())
//                ? domesticDir.list((dir, name) ->
//                name.toLowerCase().endsWith(".jpg") ||
//                        name.toLowerCase().endsWith(".png") ||
//                        name.toLowerCase().endsWith(".webp"))
//                : new String[0];

//        if (domesticFiles != null) Arrays.sort(domesticFiles);
//
//        int totalCount = (domesticFiles != null ? domesticFiles.length : 0);

//        if (totalCount == 0) {
//            model.addAttribute("domesticFiles", new String[0]);
//            model.addAttribute("currentIndex", 0);
//            model.addAttribute("totalCount", 0);
//            model.addAttribute("elapsedMillis", 0L);
//            return basePath(request) + "index";
//        }
//
//        LocalDateTime now = LocalDateTime.now();
//        long totalMillis = now.toInstant(java.time.ZoneOffset.ofHours(9)).toEpochMilli();
//        int currentIndex = (int)((totalMillis / 10000) % totalCount); // Now safe
//
//        long elapsedMillisInCurrentSlot = totalMillis % 10000;
//
//        model.addAttribute("domesticFiles", domesticFiles);
//        model.addAttribute("currentIndex", currentIndex);
//        model.addAttribute("totalCount", totalCount);
//        model.addAttribute("elapsedMillis", elapsedMillisInCurrentSlot);

        return basePath(request) + "stairs2";
    }

    @RequestMapping(value = {"/stairs3.*"})
    public String stairs3 (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //강좌
        return basePath(request) + "stairs3";
    }

    @RequestMapping(value = {"/stairs4.*"})
    public String stairs4 (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //행사
        return basePath(request) + "stairs4";
    }

    @RequestMapping(value = {"/stairs6.*"})
    public String stairs6 (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //신착도서
        return basePath(request) + "stairs6";
    }

    @RequestMapping(value = {"/stairs{num}.*"})
    public String stairs (@PathVariable String context_path, @PathVariable("num") int num, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "stairs" + num;
    }

    @RequestMapping(value = {"/weather.*"})
    public String weather (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "weather";
    }

    @RequestMapping(value = {"/chEtiquette{num}.*"})
    public String chEtiquette (@PathVariable String context_path, @PathVariable("num") int num, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
        returnDate(model, librarySearch, request);

        return basePath(request) + "chEtiquette" + num;
    }

    @RequestMapping(value = {"/loanReturn.*"})
    public String loanReturn (@PathVariable String context_path, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
        returnDate(model, librarySearch, request);

        return basePath(request) + "loanReturn";
    }

    @RequestMapping(value = {"/temp2.*"})
    public String temp2 (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "temp2";
    }
    @RequestMapping(value = {"/temp3.*"})
    public String temp3 (@PathVariable String context_path, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return basePath(request) + "temp3";
    }

    @RequestMapping(value = {"/liveInfo{num}.*"})
    public String liveInfo (@PathVariable String context_path, @PathVariable("num") int num, Model model, LibrarySearch librarySearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
        returnDate(model, librarySearch, request);

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

                    SimpleDateFormat originalFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss", Locale.ENGLISH);
                    Date date = originalFormat.parse(pubDate);

                    SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    pubDate = targetFormat.format(date);

                    itemData.put("pubDate", pubDate);

                    items.add(itemData);
                }
            }

            model.addAttribute("livingInfoList", items);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return basePath(request) + "liveInfo" + num;
    }

    public void returnDate(Model model, LibrarySearch librarySearch, HttpServletRequest request) throws ParseException {
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

        try {
            String result = LibSearchAPI.getReturnDay(librarySearch);

            SimpleDateFormat returnPlanDateFormat = new SimpleDateFormat("yyyyMMdd");
            Date date = returnPlanDateFormat.parse(result);

            Calendar returnCalendar = Calendar.getInstance();
            returnCalendar.setTime(date);

            String returnDate = returnCalendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.KOREAN);

            String rMonth = result.substring(4,6);
            String rDay = result.substring(6,8);

            model.addAttribute("returnDay", rDay);
            model.addAttribute("returnMonth", rMonth);
            model.addAttribute("returnDate", returnDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
        } catch (MissingResourceException ex) {
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
