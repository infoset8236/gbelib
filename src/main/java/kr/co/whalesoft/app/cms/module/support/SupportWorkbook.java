package kr.co.whalesoft.app.cms.module.support;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;

public class SupportWorkbook {

	protected WritableWorkbook workbookForm(WritableWorkbook workbook, List<Support> supportList, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sheetName = "현장지원 신청현황 리스트";	//시트이름
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
		
		// 컬럼 폭 지정
		int i=0;
		workbook.getSheet(0).setColumnView( i++, 10 );
		workbook.getSheet(0).setColumnView( i++, 30 );
		workbook.getSheet(0).setColumnView( i++, 20 );
		workbook.getSheet(0).setColumnView( i++, 40 );
		workbook.getSheet(0).setColumnView( i++, 40 );
		workbook.getSheet(0).setColumnView( i++, 40 );
		workbook.getSheet(0).setColumnView( i++, 40 );
		workbook.getSheet(0).setColumnView( i++, 40 );
		
		// 헤더 컬럼 지정
		i=0;
		workbook.getSheet(0).addCell( new Label( i++, 0, "번호", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 0, "기관명", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 0, "신청자", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 0, "휴대폰", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 0, "희망일자", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 0, "희망지원분야", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 0, "신청내용", format ) );
		workbook.getSheet(0).addCell( new Label( i++, 0, "진행상태", format ) );
		
		int row = 1;
		for ( Support org : supportList ) {
			
			String state = "";
			if(org.getProcess_state().equals("Y")) {
				state = "완료";
			} else {
				state = "접수";
			}
			
			StringBuilder sb = new StringBuilder();
			
			if(StringUtils.isNotEmpty(org.getCategories())) {
				Map<String, String> map = new HashMap<String, String>();
				
				try {
					ObjectMapper om = new ObjectMapper();
					om.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
					map = om.readValue(org.getCategories(), new TypeReference<Map<String, String>>(){});
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				List<String> keys = new ArrayList<String>();
				for(Map.Entry<String, String> entry: map.entrySet()) {
					String k = entry.getKey();
					keys.add(k);
				}
				
				Collections.sort(keys);
				
				for(String k: keys) {
					if("_field00".equals(k)) sb.append("학내 전산망\n");
					else if("_field01".equals(k)) sb.append("- 용도별 망 분리 확인 및 회선 속도 측정\n");
					else if("_field02".equals(k)) sb.append("- 주단자함과 중간단자함의 환경 정비\n");
					else if("_field03".equals(k)) sb.append("- 학내전산망 관련 현장자료 확인 및 컨설팅\n");
					else if("_field04".equals(k)) sb.append("정보화장비 불용처리\n");
					else if("_field05".equals(k)) sb.append("- PC " + map.get("_field06") +"대\n");
					else if("_field07".equals(k)) sb.append("- 모니터 " + map.get("_field08") +"대\n");
					else if("_field09".equals(k)) sb.append("- 프린터 " + map.get("_field10") +"대\n");
					else if("_field11".equals(k)) sb.append("컴퓨터실 PC OS 재설치 (윈도우7 PC는 지원불가)\n");
					else if("_field12".equals(k)) sb.append("- 윈도우8 PC " + map.get("_field13") +"대\n");
					else if("_field14".equals(k)) sb.append("- 윈도우10 PC " + map.get("_field15") +"대\n");
					else if("_field16".equals(k)) sb.append("내 PC지키미\n");
					else if("_field17".equals(k)) sb.append("- 관리자페이지 사용법\n");
					else if("_field18".equals(k)) sb.append("- 취약항목 조치 " + map.get("_field19") +"대\n");
					else if("_field20".equals(k)) sb.append("업무처리시스템 권한관리\n");
					else if("_field21".equals(k)) sb.append("- 나이스 교무업무 권한관리\n");
					else if("_field22".equals(k)) sb.append("- K-에듀파인 권한관리\n");
				}
			}
			
			i=0;
			workbook.getSheet(0).addCell( new Label( i++, row, String.valueOf(row)));
			workbook.getSheet(0).addCell( new Label( i++, row, org.getReq_name(),format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getRequer_name(),format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getRequer_tel(),format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getHope_req_dt(),format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, sb.toString(),format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, org.getReq_content(),format1 ) );
			workbook.getSheet(0).addCell( new Label( i++, row, state, format1) );
			row++;
		}
		
		return workbook;
	}

}

