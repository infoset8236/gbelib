package kr.go.gbelib.app.cms.module.excelDownLog;

import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;
import kr.co.whalesoft.app.cms.cmsAccessLog.CmsAccess;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class ExcelDownloadLogMemberAccess extends AbstractJExcelView {
    @Override
    protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String sheetName = "관리자 접근기록"; // 시트이름
        workbook.createSheet(sheetName, 0); // 시트설정

        String fileName = "관리자 접근기록.xls";

        @SuppressWarnings("unchecked")
        List<CmsAccess> excelDownloadMemberAccess = (List<CmsAccess>) model.get("excelDownloadLogMemberAccess");

        response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("Application/Msexcel");

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
        workbook.getSheet(0).setColumnView(1, 15);
        workbook.getSheet(0).setColumnView(2, 10);
        workbook.getSheet(0).setColumnView(3, 10);
        workbook.getSheet(0).setColumnView(4, 15);
        workbook.getSheet(0).setColumnView(5, 35);
        workbook.getSheet(0).setColumnView(6, 20);
        workbook.getSheet(0).setColumnView(7, 20);
        workbook.getSheet(0).setColumnView(8, 20);
        workbook.getSheet(0).setColumnView(9, 20);

        // 헤더 첫행
        workbook.getSheet(0).addCell(new Label(0, 0, "관리자 접근기록", format1));
        workbook.getSheet(0).mergeCells(0, 0, 9, 0);

        // 헤더 컬럼 지정
        workbook.getSheet(0).addCell(new Label(column++, 1, "순번", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "년", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "월", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "일", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "시", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "도서관", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "작업자", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "이름", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "메뉴", format));
        workbook.getSheet(0).addCell(new Label(column++, 1, "접근IP", format));

        int row = 2;
        int sheet = 0;

        for (CmsAccess i : excelDownloadMemberAccess) {
            column = 0;
            if ((row - 1) > 65534) {
                sheet++;
                workbook.createSheet(sheetName, sheet); // 시트설정
                row = 2;

                // 컬럼 폭 지정
                workbook.getSheet(sheet).setColumnView(0, 10);
                workbook.getSheet(sheet).setColumnView(1, 15);
                workbook.getSheet(sheet).setColumnView(2, 10);
                workbook.getSheet(sheet).setColumnView(3, 10);
                workbook.getSheet(sheet).setColumnView(4, 15);
                workbook.getSheet(sheet).setColumnView(5, 35);
                workbook.getSheet(sheet).setColumnView(6, 20);
                workbook.getSheet(sheet).setColumnView(7, 20);
                workbook.getSheet(sheet).setColumnView(8, 20);
                workbook.getSheet(sheet).setColumnView(9, 20);

                // 헤더 첫행
                workbook.getSheet(sheet).addCell(new Label(0, 0, "관리자 접근기록", format1));
                workbook.getSheet(sheet).mergeCells(0, 0, 8, 0);

                // 헤더 컬럼 지정
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "순번", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "년", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "월", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "일", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "시", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "도서관", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "작업자", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "이름", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "메뉴", format));
                workbook.getSheet(sheet).addCell(new Label(column++, 1, "접근IP", format));

                column = 0;

                workbook.getSheet(sheet).addCell(new Label(column++, row, String.valueOf((row - 1)), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getYear(), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getMonth(), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getDay(), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getTime().split("\\.")[0].substring(0, 2) + ":" + i.getTime().split("\\.")[0].substring(2, 4) + ":" + i.getTime().split("\\.")[0].substring(4, 6), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getHomepage_name(), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getWorker_id(), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getMember_name(), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getMenu_id(), format1));
                workbook.getSheet(sheet).addCell(new Label(column++, row, i.getAccess_ip(), format1));
                row++;
                continue;
            }
            workbook.getSheet(sheet).addCell(new Label(column++, row, String.valueOf((row - 1)), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getYear(), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getMonth(), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getDay(), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getTime().split("\\.")[0].substring(0, 2) + ":" + i.getTime().split("\\.")[0].substring(2, 4) + ":" + i.getTime().split("\\.")[0].substring(4, 6), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getHomepage_name(), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getWorker_id(), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getMember_name(), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getMenu_id(), format1));
            workbook.getSheet(sheet).addCell(new Label(column++, row, i.getAccess_ip(), format1));

            row++;
        }
    }
}
