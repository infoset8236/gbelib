package kr.go.gbelib.app.cms.module.elib.lending;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.WritableSheet;
import org.apache.commons.lang.StringUtils;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;

public class LendingWorkbook {

	protected WritableWorkbook workbookForm(WritableWorkbook workbook, Lending lending, List<Lending> lendingList, String menuName, String isReserve, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// =========================
		// XLS(JXL) 시트 행 제한
		// =========================
		final int XLS_MAX_ROWS = 65536;     // row index 0~65535
		final int HEADER_ROW_INDEX = 1;     // 헤더 행
		final int DATA_START_ROW = 2;       // 데이터 시작 행
		final int LAST_ROW_INDEX = XLS_MAX_ROWS - 1; // 65535

		String type = lending.getType();
		String typeName = "전체";
		
		if("EBK".equals(type)) {
			typeName = "전자책";
		} else if("WEB".equals(type)) {
			typeName = "온라인강좌";
		} else if("ADO".equals(type)) {
			typeName = "오디오북";
		}
		
		String sheetBaseName = menuName;	//시트이름
//		workbook.createSheet(sheetName, 0);	//시트설정
		
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

		String categoryName1 = lending.getParent_name() == null ? "전체": lending.getParent_name();
		String categoryName2 = lending.getCate_name() == null ? "전체": lending.getCate_name();
		String search_sdt = lending.getSearch_sdt() == null ? "": lending.getSearch_sdt();
		String search_edt = lending.getSearch_edt() == null ? "": lending.getSearch_edt();
		String comp_name = StringUtils.defaultString(lending.getComp_name());
		String library_name = StringUtils.defaultString(lending.getLibrary_name());

		int sheetNo = 0;
		WritableSheet sheet = workbook.createSheet(safeSheetName(sheetBaseName, sheetNo), sheetNo);

		applySheetLayoutAndHeader(sheet, menuName, typeName, comp_name, categoryName1, categoryName2, library_name, search_sdt, search_edt, isReserve, format);

		// =========================
		// 데이터 쓰기
		// =========================
		int row = DATA_START_ROW;

		for ( Lending org : lendingList ) {
			int i = 0;

			if (row > LAST_ROW_INDEX) {
				sheetNo++;
				sheet = workbook.createSheet(safeSheetName(sheetBaseName, sheetNo), sheetNo);

				applySheetLayoutAndHeader(sheet, menuName, typeName, comp_name, categoryName1, categoryName2, library_name, search_sdt, search_edt, isReserve, format);

				row = DATA_START_ROW; // 새 시트 데이터 시작 행으로 리셋
			}

			if(!"Y".equals(isReserve)) {
				sheet.addCell( new Label( i++, row, String.valueOf(org.getLend_idx()), format1 ) );
			} else {
				sheet.addCell( new Label( i++, row, String.valueOf(org.getReserve_idx()), format1 ) );
			}
			sheet.addCell( new Label( i++, row, org.getDevice(), format1 ) );
			sheet.addCell( new Label( i++, row, org.getMember_id(), format1 ) );
			sheet.addCell( new Label( i++, row, org.getMember_library_name(), format1 ) );
			sheet.addCell( new Label( i++, row, org.getAge_group(), format1 ) );
			sheet.addCell( new Label( i++, row, org.getType_name(), format1 ) );
//			sheet.addCell( new Label( i++, row, org.getUser_name(), format1 ) );
			sheet.addCell( new Label( i++, row, org.getCate_name(), format1) );
			sheet.addCell( new Label( i++, row, org.getBook_name(), format1 ) );
			if (typeName.equals("전자책") || typeName.equals("오디오북")) {
				sheet.addCell( new Label( i++, row, org.getBook_code(), format1 ) );
			}
			sheet.addCell( new Label( i++, row, org.getAuthor_name(), format1 ) );
			sheet.addCell( new Label( i++, row, org.getBook_regdt(), format1 ) );
			if(!"Y".equals(isReserve)) {
				sheet.addCell( new Label( i++, row, org.getLend_dt(), format1 ) );
				sheet.addCell( new Label( i++, row, org.getReturn_due_dt(), format1 ) );
				sheet.addCell( new Label( i++, row, org.getReturn_dt(), format1 ) );
			} else {
				sheet.addCell( new Label( i++, row, org.getReserve_dt(), format1 ) );
				sheet.addCell( new Label( i++, row, org.getLend_dt(), format1 ) );
			}
			sheet.addCell( new Label( i++, row, String.valueOf(org.getBook_reserve()), format1 ) );
			row++;
		}
		
		return workbook;
	}

	/**
	 * 시트 레이아웃(컬럼 폭) + 상단 요약(0행) + 헤더(1행) 작성
	 */
	private void applySheetLayoutAndHeader(WritableSheet sheet, String menuName, String typeName, String comp_name, String categoryName1, String categoryName2, String library_name, String search_sdt, String search_edt, String isReserve, WritableCellFormat headerFormat) throws Exception {
		// 컬럼 폭 지정
		sheet.setColumnView( 0, 10 );
		sheet.setColumnView( 1, 10 );
		sheet.setColumnView( 2, 20 );
		sheet.setColumnView( 3, 20 );
		sheet.setColumnView( 4, 20 );
//		sheet.setColumnView( 3, 15 );
		sheet.setColumnView( 5, 30 );
		sheet.setColumnView( 6, 50 );
		sheet.setColumnView( 7, 50 );
		sheet.setColumnView( 8, 15 );
		if(!"Y".equals(isReserve)) {
			sheet.setColumnView( 9, 15 );
			sheet.setColumnView( 10, 15 );
			sheet.setColumnView( 11, 15 );
		} else {
			sheet.setColumnView( 9, 15 );
			sheet.setColumnView( 10, 15 );
		}

		sheet.addCell(new Label( 0, 0,
				String.format("%s [ 유형: %s, 공급사: %s, 1차 카테고리: %s, 2차 카테고리: %s, 도서관: %s, 조회기간: %s ~ %s ]", menuName, typeName, comp_name, categoryName1, categoryName2, library_name, search_sdt, search_edt)));
		sheet.mergeCells(0, 0, 4, 0);

		int i=0;
		// 헤더 컬럼 지정
		sheet.addCell( new Label( i++, 1, "번호", headerFormat ) );
		sheet.addCell( new Label( i++, 1, "기기", headerFormat ) );
		sheet.addCell( new Label( i++, 1, "회원ID", headerFormat ) );
		sheet.addCell( new Label( i++, 1, "소속도서관", headerFormat ) );
		sheet.addCell( new Label( i++, 1, "연령대", headerFormat ) );
		sheet.addCell( new Label( i++, 1, "유형", headerFormat ) );
//		sheet.addCell( new Label( i++, 1, "회원명", format ) );
		sheet.addCell( new Label( i++, 1, "카테고리", headerFormat ) );
		sheet.addCell( new Label( i++, 1, "도서명", headerFormat ) );
		if (typeName.equals("전자책") || typeName.equals("오디오북")) {
			sheet.addCell( new Label( i++, 1, "북코드", headerFormat ) );
		}
		sheet.addCell( new Label( i++, 1, "저자", headerFormat ) );
		sheet.addCell( new Label( i++, 1, "도서등록일", headerFormat ) );
		if(!"Y".equals(isReserve)) {
			sheet.addCell( new Label( i++, 1, "대출일자", headerFormat ) );
			sheet.addCell( new Label( i++, 1, "만료일자", headerFormat ) );
			sheet.addCell( new Label( i++, 1, "반납일자", headerFormat ) );
		} else {
			sheet.addCell( new Label( i++, 1, "예약일자", headerFormat ) );
			sheet.addCell( new Label( i++, 1, "대출일자", headerFormat ) );
		}
		sheet.addCell( new Label( i++, 1, "예약자수", headerFormat ) );

	}
	/**
	 * 엑셀 시트명 안전 처리:
	 * - 길이 31자 제한
	 * - 특수문자 제한(간단 제거)
	 * - sheetNo에 따라 _2, _3... 붙임
	 */
	private String safeSheetName(String base, int sheetNo) {
		String name = (base == null || base.trim().length() == 0) ? "Sheet" : base.trim();

		// 엑셀 시트명에서 금지 문자 제거: \ / ? * [ ] :
		name = name.replace("\\", "")
				.replace("/", "")
				.replace("?", "")
				.replace("*", "")
				.replace("[", "")
				.replace("]", "")
				.replace(":", "");

		// 두번째 시트부터 번호 suffix
		if (sheetNo > 0) {
			name = name + "_" + (sheetNo + 1);
		}

		// 31자 제한
		if (name.length() > 31) {
			name = name.substring(0, 31);
		}

		return name;
	}
}
