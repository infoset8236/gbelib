package kr.go.gbelib.app.cms.module.excelDownLog;

import static java.net.URLEncoder.encode;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;
import org.springframework.web.servlet.view.document.AbstractJExcelView;


public class ExcelDownLogSearchView extends AbstractJExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String sheetName = "액셀 다운로그"; // 시트이름
        workbook.createSheet(sheetName, 0); // 시트설정

        String fileName = "ExcelDownLog.xls";

        @SuppressWarnings("unchecked")
        List<ExcelDownLog> LogList = (List<ExcelDownLog>) model.get("LogList");
        //
        String header = request.getHeader("user-agent");
        String encodedFileName = null;

        if (header.contains("MSIE") || header.contains("Trident")) {
            encodedFileName = encode(fileName, "UTF-8").replaceAll("\\+", "%20");
        } else if (header.contains("Edge")) {
            encodedFileName = encode(fileName, "UTF-8");
        } else {
            encodedFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
        }

        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        response.setContentType("application/vnd.ms-excel");

        int column = 0;

        // 헤더 스타일
        WritableCellFormat format = new WritableCellFormat();
        format.setAlignment(Alignment.CENTRE);
        format.setBackground(Colour.LIGHT_GREEN);

        // 중앙정렬
        WritableCellFormat format1 = new WritableCellFormat();
        format1.setAlignment(Alignment.CENTRE);

        // 컬럼 폭 지정
        workbook.getSheet(0).setColumnView(0, 10);
        workbook.getSheet(0).setColumnView(1, 10);
        workbook.getSheet(0).setColumnView(2, 20);
        workbook.getSheet(0).setColumnView(3, 25);
        workbook.getSheet(0).setColumnView(4, 20);
        workbook.getSheet(0).setColumnView(5, 22);
        workbook.getSheet(0).setColumnView(6, 20);
        workbook.getSheet(0).setColumnView(7, 42);
        workbook.getSheet(0).setColumnView(8, 18);

        // 헤더 첫행
        workbook.getSheet(0).addCell(new Label(0, 0, "독서/문화 강좌 엑셀 다운기록", format1));
        workbook.getSheet(0).mergeCells(0, 0, 7, 0);

        // 헤더 컬럼 지정
        workbook.getSheet(0).addCell(new Label(column++, 1, "순번", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "도서관", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "다운로드 사용자 ID", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "OS", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "브라우저", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "IP", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "다운로드 일시", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "강좌명", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "다운로드 종류", format));

        int row = 2;

        for (ExcelDownLog i : LogList) {
            column = 0;
            workbook.getSheet(0).addCell(new Label(column++, row, String.valueOf((row - 1)), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getHomepage_name(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getAdd_id(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getOs(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getBrowser(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getIp(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getAdd_date(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getTeach_name(), format1));
            if (i.getType().equals("1")) {
                workbook.getSheet(0).addCell(new Label(column++, row, "수강생 리스트", format1));
            } else if (i.getType().equals("2")) {
                workbook.getSheet(0).addCell(new Label(column++, row, "출석부 리스트", format1));
            } else {
                workbook.getSheet(0).addCell(new Label(column++, row, "?", format1));
            }
            row++;
        }


    }
}
