package kr.go.gbelib.app.cms.module.elib.lending;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;

public class LendingWorkbook2 {

	protected WritableWorkbook workbookForm(WritableWorkbook workbook, Lending lending, List<Lending> lendingList, String menuName, String isReserve, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String type = lending.getType();
		String typeName = "전체";
		
		if("EBK".equals(type)) {
			typeName = "전자책";
		} else if("WEB".equals(type)) {
			typeName = "온라인강좌";
		} else if("ADO".equals(type)) {
			typeName = "오디오북";
		}
		
		String sheetName = menuName;	//시트이름
		workbook.createSheet(sheetName, 0);	//시트설정
		
		// 헤더 스타일
		WritableCellFormat format = new WritableCellFormat();
		format.setAlignment( Alignment.CENTRE );
		format.setBackground( Colour.LIGHT_GREEN );

		//중앙정렬
		WritableCellFormat format1 = new WritableCellFormat();		
		format1.setAlignment(Alignment.CENTRE);

		//테두리선,중앙정렬
		WritableCellFormat format2 = new WritableCellFormat();		
		format2.setBorder(Border.ALL,BorderLineStyle.MEDIUM);
		
		//중앙정렬,배경색,테두리 색
		WritableCellFormat format3 = new WritableCellFormat();
		format3.setAlignment( Alignment.CENTRE );
		format3.setBackground( Colour.LIGHT_GREEN );
		format3.setBorder(Border.ALL,BorderLineStyle.MEDIUM);
		
		int i=0;
		// 컬럼 폭 지정
		workbook.getSheet(0).setColumnView( i++, 10 );
		workbook.getSheet(0).setColumnView( i++, 10 );
		workbook.getSheet(0).setColumnView( i++, 20 );
		workbook.getSheet(0).setColumnView( i++, 20 );
		workbook.getSheet(0).setColumnView( i++, 20 );
		workbook.getSheet(0).setColumnView( i++, 20 );
//		workbook.getSheet(0).setColumnView( i++, 15 );
		workbook.getSheet(0).setColumnView( i++, 30 );
		workbook.getSheet(0).setColumnView( i++, 50 );
		workbook.getSheet(0).setColumnView( i++, 50 );
		workbook.getSheet(0).setColumnView( i++, 15 );
		workbook.getSheet(0).setColumnView( i++, 15 );
		
		String categoryName1 = lending.getParent_name() == null ? "전체": lending.getParent_name();
		String categoryName2 = lending.getCate_name() == null ? "전체": lending.getCate_name();
		String search_sdt = lending.getSearch_sdt() == null ? "": lending.getSearch_sdt();
		String search_edt = lending.getSearch_edt() == null ? "": lending.getSearch_edt();
		String comp_name = StringUtils.defaultString(lending.getComp_name());
		String library_name = StringUtils.defaultString(lending.getLibrary_name());
		
		workbook.getSheet(0).addCell(new Label( 0, 0,
				String.format("%s [ 유형: %s, 공급사: %s, 1차 카테고리: %s, 2차 카테고리: %s, 도서관: %s, 조회기간: %s ~ %s ]", menuName, typeName, comp_name, categoryName1, categoryName2, library_name, search_sdt, search_edt)));
		workbook.getSheet(0).mergeCells(0, 0, 4, 0);
		
		i=0;
		// 헤더 컬럼 지정
		workbook.getSheet(0).addCell( new Label( i++, 1, "번호", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "기기", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "회원ID", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "소속도서관", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "연령대", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "유형", format ) );
//		workbook.getSheet(0).addCell( new Label( i++, 1, "회원명", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "카테고리", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "도서명", format ) );
		if (typeName.equals("전자책") || typeName.equals("오디오북")) {
			workbook.getSheet(0).addCell( new Label( i++, 1, "북코드", format ) );
		}
		workbook.getSheet(0).addCell( new Label( i++, 1, "저자", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "도서등록일", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 1, "이용일자", format ) );
		
		int row = 2;
		for ( Lending org : lendingList ) {
			i=0;
			workbook.getSheet(0).addCell( new Label( i++, row, String.valueOf(org.getLend_idx()), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getDevice(), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getMember_id(), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getMember_library_name(), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getAge_group(), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getType_name(), format1 ) );
//			workbook.getSheet(0).addCell( new Label( i++, row, org.getUser_name(), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getCate_name(), format1) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getBook_name(), format1 ) );
			if (typeName.equals("전자책") || typeName.equals("오디오북")) {
				workbook.getSheet(0).addCell( new Label( i++, row, org.getBook_code(), format1 ) );
			}
			workbook.getSheet(0).addCell( new Label( i++, row, org.getAuthor_name(), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getBook_regdt(), format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getLend_dt(), format1 ) );
			row++;
		}
		
		return workbook;
	}

}
