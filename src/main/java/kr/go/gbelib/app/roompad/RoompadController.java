package kr.go.gbelib.app.roompad;

import kr.co.whalesoft.framework.base.BaseController;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping(value = {"/{context_path}/roompad"})
public class RoompadController extends BaseController {

    @RequestMapping(value = {"/index.*"})
    public String index(@PathVariable String context_path, RoomPad roomPad, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat isoFormatter = new SimpleDateFormat("yyyy-MM-dd");

        if (roomPad.getRoom_day() == null || roomPad.getRoom_day().isEmpty()) {
            today = Calendar.getInstance();
        } else {
            today.setTime(isoFormatter.parse(roomPad.getRoom_day()));
        }

        if ("minus".equals(roomPad.getCal())) {
            today.add(Calendar.DAY_OF_MONTH, -1);
        } else if ("plus".equals(roomPad.getCal())) {
            today.add(Calendar.DAY_OF_MONTH, 1);
        }

        roomPad.setRoom_day(isoFormatter.format(today.getTime()));

        SimpleDateFormat koreanDateFormatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
        String formattedDate = koreanDateFormatter.format(today.getTime());

        int dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
        String formattedDayOfWeek = getKoreanDayOfWeek(dayOfWeek);

        String finalDate = formattedDate + "." + formattedDayOfWeek;
        int dayOfMonth = today.get(Calendar.DAY_OF_MONTH);

        model.addAttribute("todayDate", finalDate);
        model.addAttribute("dayOfMonth", dayOfMonth);

        SimpleDateFormat dateFormatter2 = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
        String now_date = dateFormatter2.format(today.getTime());
        String room_id = request.getParameter("room_id");

        Map<String, Object> param = new HashMap<String, Object>();
        param.put("room_id", room_id);
        param.put("reserve_date", now_date);

        HttpURLConnection connection = null;
        BufferedReader br = null;

        try {
            String apiUrl = "http://lib.gumi.go.kr:81/api/facility/bookinglist";
            List<String> paramList = new ArrayList<String>();

            if (param != null) {
                for (Map.Entry<String, Object> entry : param.entrySet()) {
                    paramList.add(String.format("%s=%s", entry.getKey(), entry.getValue()));
                }
                log.error("@@@@@@@@@@@@@@@@@@ BOOKING_API_URL : " + apiUrl + "?" + StringUtils.join(paramList, "&"));
            }

            connection = initConn(apiUrl + "?" + StringUtils.join(paramList, "&"));
            connection.setRequestMethod("GET");
            int responseCode = connection.getResponseCode();

            String contentType = connection.getContentType();
            String charset = "UTF-8";
            if (contentType != null && contentType.contains("charset=")) {
                charset = contentType.split("charset=")[1];
            }

            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(connection.getInputStream(), charset));
                String inputLine;
                StringBuilder rsp = new StringBuilder();

                // 응답 데이터 읽기
                while ((inputLine = br.readLine()) != null) {
                    rsp.append(inputLine).append("\n");
                }

                // XML 파싱
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();
                Document doc = builder.parse(new ByteArrayInputStream(rsp.toString().getBytes(charset)));

                String roomKrName = doc.getElementsByTagName("ROOM_NAME_KR").item(0).getTextContent();
                String roomEgName = doc.getElementsByTagName("ROOM_NAME_EG").item(0).getTextContent();
                String reserveCount = doc.getElementsByTagName("RESERVE_COUNT").item(0).getTextContent();

                model.addAttribute("roomKrName", roomKrName);
                model.addAttribute("roomEgName", roomEgName);

                NodeList reserveList = doc.getElementsByTagName("ITEM");
                List<RoomPad> bookingList = new ArrayList<RoomPad>();

                if (reserveList.getLength() > 0) {
                    for (int i = 0; i < reserveList.getLength(); i++) {
                        Element item = (Element) reserveList.item(i);
                        RoomPad reservation = new RoomPad();
                        reservation.setSubject(item.getElementsByTagName("SUBJECT").item(0).getTextContent());
                        reservation.setReserveStime(item.getElementsByTagName("RESERVE_STIME").item(0).getTextContent());
                        reservation.setReserveEtime(item.getElementsByTagName("RESERVE_ETIME").item(0).getTextContent());
                        reservation.setMasterName(item.getElementsByTagName("MASTER_NAME").item(0).getTextContent());
                        reservation.setMemberCount(item.getElementsByTagName("MEMBER_COUNT").item(0).getTextContent());

                        bookingList.add(reservation);
                    }
                }

                model.addAttribute("bookingList", bookingList);
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(connection.getErrorStream(), charset));
                StringBuilder errorRsp = new StringBuilder();
                String errorLine;

                while ((errorLine = br.readLine()) != null) {
                    errorRsp.append(errorLine).append("\n");
                }
                log.error("API Error Response: " + errorRsp.toString());
            }

        } catch (Exception e) {
            log.error("BOOKING API ERROR", e);
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    log.error("BufferedReader close error", e);
                }
            }
            if (connection != null) {
                connection.disconnect();
            }
        }

        model.addAttribute("roomPad", roomPad);

        return "/roompad/index";
    }

    public static HttpURLConnection initConn(String urlStr) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Accept-Charset", "euc-kr");
        connection.setRequestProperty("Accept-Language", "euc-kr,ko;q=0.8,en-us;q=0.5,en;q=0.3");
        connection.setDoOutput(true);
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);
        return connection;
    }

    private String getKoreanDayOfWeek(int dayOfWeek) {
        switch (dayOfWeek) {
            case Calendar.MONDAY: return "월요일";
            case Calendar.TUESDAY: return "화요일";
            case Calendar.WEDNESDAY: return "수요일";
            case Calendar.THURSDAY: return "목요일";
            case Calendar.FRIDAY: return "금요일";
            case Calendar.SATURDAY: return "토요일";
            case Calendar.SUNDAY: return "일요일";
            default: return "";
        }
    }
}
