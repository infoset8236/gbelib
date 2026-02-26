package kr.go.gbelib.app.cms.module.excelDownLog;

import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

import static java.net.URLEncoder.encode;


public class ExcelDownLogReasonView extends AbstractJExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String sheetName = "excel,csv,file download log"; // 시트이름
        workbook.createSheet(sheetName, 0); // 시트설정

        String fileName = "excel,csv,file download log.xls";

        @SuppressWarnings("unchecked")
        List<ExcelDownLog> excelDownLogReasonList = (List<ExcelDownLog>) model.get("excelAllDownLogReasonList");
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
        workbook.getSheet(0).setColumnView(1, 25);
        workbook.getSheet(0).setColumnView(2, 50);
        workbook.getSheet(0).setColumnView(3, 60);
        workbook.getSheet(0).setColumnView(4, 25);
        workbook.getSheet(0).setColumnView(5, 35);
        workbook.getSheet(0).setColumnView(6, 35);
        workbook.getSheet(0).setColumnView(7, 20);

        // 헤더 첫행
        workbook.getSheet(0).addCell(new Label(0, 0, "액셀,csv, file 개인정보 다운로드 기록", format1));
        workbook.getSheet(0).mergeCells(0, 0, 7, 0);

        // 헤더 컬럼 지정
        workbook.getSheet(0).addCell(new Label(column++, 1, "번호", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "도서관명", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "메뉴경로", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "다운로드 사유", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "접근ID", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "일시", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "접근IP", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "다운로드 종류", format));

        int row = 2;

        for (ExcelDownLog i : excelDownLogReasonList) {
            column = 0;
            workbook.getSheet(0).addCell(new Label(column++, row, String.valueOf((row - 1)), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getHomepage_name(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getMenu_path(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getExcel_down_reason(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getAdd_id(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getAdd_date(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getAdd_ip(), format1));
            workbook.getSheet(0).addCell(new Label(column++, row, i.getType(), format1));

            row++;
        }


    }
}
