package kr.go.gbelib.app.cms.module.api;

import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import kr.co.whalesoft.app.board.BoardService;
import kr.co.whalesoft.app.cms.boardManage.BoardManage;
import kr.co.whalesoft.app.cms.boardManage.BoardManageService;
import kr.co.whalesoft.app.cms.boardWordFilter.BoardWordFilter;
import kr.co.whalesoft.app.cms.boardWordFilter.BoardWordFilterService;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.framework.utils.WebFilterCheckUtils;
import kr.go.gbelib.app.cms.module.teach.Teach;
import kr.go.gbelib.app.cms.module.teach.TeachService;
import kr.go.gbelib.app.common.api.CommonAPI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.whalesoft.app.board.Board;
import kr.co.whalesoft.framework.base.BaseController;
import kr.go.gbelib.app.cms.module.elib.book.Book;
import kr.go.gbelib.app.cms.module.elib.lending.Lending;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Controller
@RequestMapping(value = {"/api/"})
public class ApiController extends BaseController {

	@Autowired
	private ElibApiService elibApiService;
	
	@Autowired
	private BoardApiService boardApiService;
	
	@Autowired
	private SSOApiService ssoApiService;
	
	@Autowired
	private ElibApiService2 elibApiService2;

	@Autowired
	private TeachApiService teachApiService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardManageService boardManageService;

	@Autowired
	private TeachService teachService;

	@Autowired
	private CalendarManageService calendarManageService;

	@Autowired
	private BoardWordFilterService boardWordFilterService;
	
	private static final String LOGIN_PAGE = "/elib/intro/login/index.do?menu_idx=43";
	
	@RequestMapping(value = {"/board.*"})
	public @ResponseBody Map<String, Object> index(Board board, HttpServletRequest request, HttpServletResponse response) {
		return boardApiService.getData(board, request, response);
	}
	
	@RequestMapping(value = {"/elib.*"})
	public @ResponseBody Map<String, Object> index(Book book, HttpServletRequest request, HttpServletResponse response) {
		return elibApiService.getData(book, request, response);
	}
	
	/**
	 * 전자도서관 공급사 앱에서 대출, 반납 등 API 호출 시
	 * @param lending
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"/elib2.*"})
	public @ResponseBody ElibXmlResult index(Lending lending, HttpServletRequest request, HttpServletResponse response) {
		return elibApiService2.doApi(lending, request, response);
	}
	
	@RequestMapping(value = {"/sso.*"})
	public String index(SSO sso, HttpServletRequest request, HttpServletResponse response) {
		try {
			return ssoApiService.getData(sso, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:" + LOGIN_PAGE;
		}
	}

	@RequestMapping(value = {"/teach.*"})
	public @ResponseBody Map<String, Object> index(Teach teach, HttpServletRequest request, HttpServletResponse response) {
		return teachApiService.getData(teach, request, response);
	}

	@RequestMapping(value = {"/recomBook.*"})
	public @ResponseBody Map<String, Object> recomBookList(Board board, HttpServletRequest request, HttpServletResponse response) {

		return boardApiService.getRecomBookList(board, request, response);
	}

	@RequestMapping(value = {"/boardList.*"})
	public @ResponseBody Map<String, Object> boardList(String homepage_id, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
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
					List<Map<String, Object>> listData = new ArrayList<Map<String,Object>>();

					for (Board b : boardList) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.put("imsi_v_8", b.getImsi_v_8());
						m.put("title", b.getTitle());
						m.put("imsi_v_3", b.getImsi_v_3());
						m.put("imsi_v_5", b.getImsi_v_5());
						m.put("preview_img", b.getPreview_img());
						listData.add(m);
					}

					resultMap.put(key, listData);
				}
			}
		} catch (MissingResourceException ex) {
			log.debug("MissingResourceException : " + ex);
		}
        return resultMap;
	}

	@RequestMapping(value = "/noticeList.*")
	public @ResponseBody Map<String, Object> noticeList(String homepage_id, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try{
			String[] boardInfoList = ResourceBundle.getBundle("board").getString(homepage_id).split(",");
			for (String oneStr : boardInfoList) {
				if (!org.apache.commons.lang.StringUtils.isEmpty(oneStr)) {
					String[] boardInfo = oneStr.split("/");
					String key = boardInfo[0];
					int manage_idx = Integer.parseInt(boardInfo[1]);
					int count = 20;
					BoardManage boardManage = boardManageService.getBoardManageOne(new BoardManage(homepage_id, manage_idx));
					List<Board> boardList = boardService.getBoardByMainKiosk(manage_idx, count, boardManage);
					List<Map<String, Object>> listData = new ArrayList<Map<String,Object>>();

					for (Board b : boardList) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.put("title", b.getTitle());
						m.put("manage_idx", b.getManage_idx());
						m.put("board_idx", b.getBoard_idx());
						m.put("preview_img", b.getPreview_img());
						listData.add(m);
					}

					resultMap.put(key, listData);
				}
			}
		}catch (MissingResourceException ex) {
			log.debug("MissingResourceException : "+ex);
		}
		return resultMap;
	}

	@RequestMapping(value = "/eventList.*")
	public @ResponseBody Map<String, Object> eventList(String homepage_id, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM");

		CalendarManage cm = new CalendarManage();

		if (org.apache.commons.lang.StringUtils.isEmpty(cm.getPlan_date())) {
			cm = new CalendarManage(sf.format(Calendar.getInstance().getTime()));
		}
		cm.setHomepage_id(homepage_id);

		List<CalendarManage> eventList = null;
		if (homepage_id.equals("h17") || homepage_id.equals("h23")) {
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
									if (org.apache.commons.lang.StringUtils.equals(planDate, holiday)) {
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

		List<Map<String, Object>> listData = new ArrayList<Map<String,Object>>();

		for (CalendarManage calendarManage : eventList) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("title", calendarManage.getTitle());
			m.put("start_time", calendarManage.getStart_time());
			m.put("end_time", calendarManage.getEnd_time());
			m.put("contents", calendarManage.getContents());
			listData.add(m);
		}

		resultMap.put("eventList", listData);

		return resultMap;
	}

	@RequestMapping(value = "/guestbook.*")
	public @ResponseBody Map<String, Object> guestbook(String homepage_id, Board board, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

        board.setHomepage_id(homepage_id);
        List<Board> guestbookList = boardService.getGuestbookList(board);

		List<Map<String, Object>> listData = new ArrayList<Map<String,Object>>();
		for (Board b : guestbookList) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("user_name", b.getUser_name());
			m.put("content", b.getContent());
			listData.add(m);
		}

		resultMap.put("guestbookList", listData);

		return resultMap;
	}

	@RequestMapping(value = "/guestbookSave.*")
	public @ResponseBody Map<String, Object> guestbookSave(String homepage_id, Board board, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		board.setHomepage_id(homepage_id);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		BoardWordFilter boardWordFilter = boardWordFilterService.getBoardWordFilterOne();

		if (boardService.getOneGuestbookByUserName(board) > 0) {
			resultMap.put("valid", false);
			resultMap.put("message", "하루에 한번만 전자방명록 등록이 가능합니다.");
			return resultMap;
		}

		if (org.apache.commons.lang.StringUtils.isNotEmpty(boardWordFilter.getWord())) {
			StringTokenizer st = new StringTokenizer(boardWordFilter.getWord(), ",");
			while(st.hasMoreTokens()) {
				String wordFilter = st.nextToken().trim();

				if(board.getUser_name().indexOf(wordFilter) > -1) {
					resultMap.put("valid", false);
					resultMap.put("message", wordFilter + "는(은) 사용할 수 없는 단어입니다.");
					return resultMap;
				}
				if(board.getContent().indexOf(wordFilter) > -1) {
					resultMap.put("valid", false);
					resultMap.put("message", wordFilter + "는(은) 사용할 수 없는 단어입니다.");
					return resultMap;
				}
			}
		}

		if(!result.hasErrors()) {
			StringBuilder sb = new StringBuilder();
			sb.append(board.getUser_name() + "\n");
			sb.append(board.getContent() + "\n");

			String checkFilter = WebFilterCheckUtils.webFilterCheck("전자방명록 작성자", "전자방명록", sb.toString());
			if (checkFilter != null) {
				resultMap.put("valid", false);
				resultMap.put("message", "개인정보는 방명록에 등록하실수 없습니다.");
				return resultMap;
			}

			int addCount = boardService.addGuestbook(board);

			if (addCount > 0) {
				resultMap.put("valid", true);
				resultMap.put("message", "방명록에 새 글이 등록 되었습니다.");
			} else {
				resultMap.put("valid", false);
				resultMap.put("message", "방명록 작성에 실패하였습니다. 관리자에게 문의해 주세요.");
			}
		} else {
			resultMap.put("valid", false);
			resultMap.put("message", "방명록 작성에 실패하였습니다. 관리자에게 문의해 주세요.");
		}

		return resultMap;
	}

	@RequestMapping(value = "/news.*")
	public @ResponseBody Map<String, Object> news() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
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

			resultMap.put("livingInfoList", items);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	public static Map<String, Object> modeError() {
		return error("-1", "잘못된 유형입니다.");
	}
	
	public static Map<String, Object> error(String code, String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("msg", msg);
		map.put("rowCount", 0);
		map.put("viewPage", 0);
		map.put("totalDataCount", 0);
		map.put("totalPageCount", 0);
		map.put("data", new ArrayList<Map<String, Object>>());
		
		return map;
	}

	private static String getElementValue(Element parent, String tagName) {
		NodeList nodeList = parent.getElementsByTagName(tagName);
		if (nodeList.getLength() > 0) {
			return nodeList.item(0).getTextContent().trim();
		}
		return null;
	}
	
}
