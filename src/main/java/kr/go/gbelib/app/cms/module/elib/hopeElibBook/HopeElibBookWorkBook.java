package kr.go.gbelib.app.cms.module.elib.hopeElibBook;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;

public class HopeElibBookWorkBook {

    protected WritableWorkbook workbookForm(WritableWorkbook workbook, HopeElibBook book, List<HopeElibBook> bookList, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String sheetName = "신청 목록";    //시트이름
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
        workbook.getSheet(0).setColumnView(4, 50);
        workbook.getSheet(0).setColumnView(5, 40);
        workbook.getSheet(0).setColumnView(6, 20);
        workbook.getSheet(0).setColumnView(7, 20);
        workbook.getSheet(0).setColumnView(8, 10);
        workbook.getSheet(0).setColumnView(9, 30);
        workbook.getSheet(0).setColumnView(10, 20);
        workbook.getSheet(0).setColumnView(11, 20);
        workbook.getSheet(0).setColumnView(12, 20);

        String countName = "EBK".equals(book.getType()) ? "대출횟수" : "이용횟수";

        // 헤더 컬럼 지정
        workbook.getSheet(0).addCell(new Label(0, 0, "내부등록번호", format));
        workbook.getSheet(0).addCell(new Label(1, 0, "카테고리", format));
        workbook.getSheet(0).addCell(new Label(2, 0, "책제목", format));
        workbook.getSheet(0).addCell(new Label(3, 0, "저자", format));
        workbook.getSheet(0).addCell(new Label(4, 0, "출판사", format));
        workbook.getSheet(0).addCell(new Label(5, 0, "ISBN", format));
        workbook.getSheet(0).addCell(new Label(6, 0, "포맷", format));
        workbook.getSheet(0).addCell(new Label(7, 0, "공급사", format));
        workbook.getSheet(0).addCell(new Label(8, 0, "신청ID", format));
        workbook.getSheet(0).addCell(new Label(9, 0, "신청자", format));
        workbook.getSheet(0).addCell(new Label(10, 0, "상태", format));
        workbook.getSheet(0).addCell(new Label(11, 0, "신청일", format));
        workbook.getSheet(0).addCell(new Label(12, 0, "승인일", format));
        workbook.getSheet(0).addCell(new Label(13, 0, "취소일", format));
        workbook.getSheet(0).addCell(new Label(13, 0, "취소일", format));

        int row = 1;
        for (HopeElibBook org : bookList) {
            workbook.getSheet(0).addCell(new Label(0, row, String.valueOf(org.getBook_idx()), format1));
            workbook.getSheet(0).addCell(new Label(1, row, org.getCate_name(), format1));
            workbook.getSheet(0).addCell(new Label(2, row, org.getBook_name(), format1));
            workbook.getSheet(0).addCell(new Label(3, row, org.getAuthor_name(), format1));
            workbook.getSheet(0).addCell(new Label(4, row, org.getBook_pubname(), format1));
            workbook.getSheet(0).addCell(new Label(5, row, org.getIsbn13(), format1));
            workbook.getSheet(0).addCell(new Label(6, row, org.getFormat(), format1));
            workbook.getSheet(0).addCell(new Label(7, row, org.getComp_name(), format1));
            workbook.getSheet(0).addCell(new Label(8, row, org.getApplication_user_id(), format1));
            workbook.getSheet(0).addCell(new Label(9, row, org.getApplication_user_name(), format1));
            if (org.getApplication_status().equals("1")) {
                workbook.getSheet(0).addCell(new Label(10, row, "신청", format1));
            } else if (org.getApplication_status().equals("2")) {
                workbook.getSheet(0).addCell(new Label(10, row, "처리", format1));
            } else if (org.getApplication_status().equals("3")) {
                workbook.getSheet(0).addCell(new Label(10, row, "구입", format1));
            } else if (org.getApplication_status().equals("4")) {
                workbook.getSheet(0).addCell(new Label(10, row, "이용자취소", format1));
            } else {
                workbook.getSheet(0).addCell(new Label(10, row, "관리자취소", format1));
            }

            workbook.getSheet(0).addCell(new Label(11, row, conversionDateToString(org.getApplication_add_date()), format1));
            if (org.getApplication_approval_date() != null) {
                workbook.getSheet(0).addCell(new Label(12, row, conversionDateToString(org.getApplication_approval_date()), format1));
            }
            if (org.getApplication_cancel_date() != null) {
                workbook.getSheet(0).addCell(new Label(12, row, conversionDateToString(org.getApplication_cancel_date()), format1));
            }
            workbook.getSheet(0).addCell(new Label(13, row, org.getApplication_remarks(), format1));

            row++;
        }

        return workbook;
    }

    public String conversionDateToString(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
        return dateFormat.format(date);
    }
}
