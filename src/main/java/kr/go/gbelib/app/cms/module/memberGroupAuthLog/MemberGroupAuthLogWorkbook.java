package kr.go.gbelib.app.cms.module.memberGroupAuthLog;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MemberGroupAuthLogWorkbook {
	
	protected WritableWorkbook workbookForm(WritableWorkbook workbook, List<MemberGroupAuthLog> memberGroupAuthLogList, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sheetName = "그룹 권한 추가 및 삭제 리스트";	//시트이름
		workbook.createSheet(sheetName, 0);	//시트설정
		
		// 헤더 스타일
		WritableCellFormat format = new WritableCellFormat();
		format.setAlignment( Alignment.CENTRE );
		format.setBackground( Colour.LIGHT_GREEN );

		//중앙정렬
		WritableCellFormat format1 = new WritableCellFormat();		
		format1.setAlignment(Alignment.CENTRE);
		format1.setWrap(true);

		//테두리선,중앙정렬
		WritableCellFormat format2 = new WritableCellFormat();		
		format2.setBorder(Border.ALL,BorderLineStyle.MEDIUM);
		
		//중앙정렬,배경색,테두리 색
		WritableCellFormat format3 = new WritableCellFormat();
		format3.setAlignment( Alignment.CENTRE );
		format3.setBackground( Colour.LIGHT_GREEN );
		format3.setBorder(Border.ALL,BorderLineStyle.MEDIUM);
		
		// 컬럼 폭 지정
		workbook.getSheet(0).setColumnView( 0,  10 );
		workbook.getSheet(0).setColumnView( 1,  25 );
		workbook.getSheet(0).setColumnView( 2,  30 );
		workbook.getSheet(0).setColumnView( 3,  20 );
		workbook.getSheet(0).setColumnView( 4,  25 );
		workbook.getSheet(0).setColumnView( 5,  100 );
		workbook.getSheet(0).setColumnView( 6,  100 );

		workbook.getSheet(0).addCell( new Label( 0, 0, "순번", format ) );
		workbook.getSheet(0).addCell( new Label( 1, 0, "권한 변경 대상", format ) );
		workbook.getSheet(0).addCell( new Label( 2, 0, "권한 수정 일시", format ) );
		workbook.getSheet(0).addCell( new Label( 3, 0, "권한 수정 IP", format ) );
		workbook.getSheet(0).addCell( new Label( 4, 0, "권한 수정자 ID", format ) );
		workbook.getSheet(0).addCell( new Label( 5, 0, "추가 권한", format ) );
		workbook.getSheet(0).addCell( new Label( 6, 0, "삭제 권한", format ) );

		int row = 1;
		for ( MemberGroupAuthLog one : memberGroupAuthLogList ) {
			workbook.getSheet(0).addCell( new Label( 0,  row, String.valueOf(one.getMember_group_auth_log_idx())));
			workbook.getSheet(0).addCell( new Label( 1,  row, one.getMember_id(), format1 ) );
			workbook.getSheet(0).addCell( new Label( 2,  row, one.getAdd_date(), format1 ) );
			workbook.getSheet(0).addCell( new Label( 3,  row, one.getAdd_ip(), format1 ) );
			workbook.getSheet(0).addCell( new Label( 4,  row, one.getMod_id(), format1 ) );
			workbook.getSheet(0).addCell( new Label( 5,  row, one.getAdded_auth(), format1 ) );
			workbook.getSheet(0).addCell( new Label( 6,  row, one.getRemoved_auth(), format1 ) );

			row++;
		}

		return workbook;
	}

}
