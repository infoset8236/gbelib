package kr.go.gbelib.app.cms.module.elib.hopeElibBook;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class HopeElibBookRankWorkBook {

    protected WritableWorkbook workbookForm(WritableWorkbook workbook, HopeElibBook book, List<HopeElibBook> bookList, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String sheetName = "신청순위 목록";    //시트이름
        workbook.createSheet(sheetName, 0);    //시트설정

        // 헤더 스타일
        WritableCellFormat format = new WritableCellFormat();
        format.setAlignment(Alignment.CENTRE);
        format.setBackground(Colour.LIGHT_GREEN);

        //중앙정렬
        WritableCellFormat format1 = new WritableCellFormat();
        format1.setAlignment(Alignment.CENTRE);

        //중앙정렬, 숫자
        WritableCellFormat format4 = new WritableCellFormat(NumberFormats.INTEGER);
        format1.setAlignment(Alignment.CENTRE);

        //테두리선,중앙정렬
        WritableCellFormat format2 = new WritableCellFormat();
        format2.setBorder(Border.ALL, BorderLineStyle.MEDIUM);

        //중앙정렬,배경색,테두리 색
        WritableCellFormat format3 = new WritableCellFormat();
        format3.setAlignment(Alignment.CENTRE);
        format3.setBackground(Colour.LIGHT_GREEN);
        format3.setBorder(Border.ALL, BorderLineStyle.MEDIUM);

        // 컬럼 폭 지정
        workbook.getSheet(0).setColumnView(0, 20);
        workbook.getSheet(0).setColumnView(1, 20);
        workbook.getSheet(0).setColumnView(2, 20);
        workbook.getSheet(0).setColumnView(3, 10);

        // 헤더 컬럼 지정
        workbook.getSheet(0).addCell(new Label(0, 0, "도서명", format));
        workbook.getSheet(0).addCell(new Label(1, 0, "저자명", format));
        workbook.getSheet(0).addCell(new Label(2, 0, "출판사", format));
        workbook.getSheet(0).addCell(new Label(3, 0, "신청횟수", format));

        int row = 1;
        for (HopeElibBook org : bookList) {
            workbook.getSheet(0).addCell(new Label(0, row, org.getBook_name(), format1));
            workbook.getSheet(0).addCell(new Label(1, row, org.getAuthor_name(), format1));
            workbook.getSheet(0).addCell(new Label(2, row, org.getBook_pubname(), format1));
            workbook.getSheet(0).addCell(new Label(3, row, String.valueOf(org.getCnt()), format1));

            row++;
        }

        return workbook;
    }
}
