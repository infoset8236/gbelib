package kr.co.whalesoft.app.cms.libSvcStatistics;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import kr.co.whalesoft.app.cms.code.Code;

public class LibSvcStatisticsWorkbook {
	
	protected WritableWorkbook workbookForm(WritableWorkbook workbook, List<Map<String, Object>> listMap, List<Code> codeList, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sheetName = "도서관 서비스 통계";	//시트이름
		workbook.createSheet(sheetName, 0);	//시트설정
		
		WritableSheet sheet = workbook.getSheet(0); 
		
		int size = codeList.size();
		
		//header
		sheet.addCell(new Label(0, 0, "구분"));
		sheet.mergeCells(0, 0, 0, 2);
		
		sheet.addCell(new Label(1, 0, "프로젝트사이트"));
		sheet.mergeCells(1, 0, size * 4, 0);
		
		for(int i = 0; i < size; i++) {
			sheet.addCell(new Label(1 + (i * 4), 1, codeList.get(i).getCode_name()));
			sheet.mergeCells(1 + (i * 4), 1, 4 + (i * 4), 1);
		}
		
		for(int i = 0; i < size; i++) {
			sheet.addCell(new Label(1 + (i * 4), 2, "요청"));
			sheet.addCell(new Label(2 + (i * 4), 2, "접수"));
			sheet.addCell(new Label(3 + (i * 4), 2, "진행중"));
			sheet.addCell(new Label(4 + (i * 4) , 2, "완료"));
			sheet.addCell(new Label(5 + (i * 4) , 2, "합계"));
		}
		
		sheet.addCell(new Label(17, 0, "구분"));
		sheet.mergeCells(17, 0, size*4+7, 0);
		
		sheet.addCell(new Label(size*4+1, 1, "통합회원수"));
		sheet.addCell(new Label(size*4+2, 1, "자관회원수"));
		sheet.addCell(new Label(size*4+3, 1, "준회원수"));
		sheet.addCell(new Label(size*4+4, 1, "탈퇴회원수"));
		sheet.addCell(new Label(size*4+5, 1, "반입회원"));
		sheet.addCell(new Label(size*4+6, 1, "전환회원"));
		sheet.addCell(new Label(size*4+7, 1, "대출권수"));
		
		sheet.mergeCells(size*4+1, 1, size*4+1, 2);
		sheet.mergeCells(size*4+2, 1, size*4+2, 2);
		sheet.mergeCells(size*4+3, 1, size*4+3, 2);
		sheet.mergeCells(size*4+4, 1, size*4+4, 2);
		sheet.mergeCells(size*4+5, 1, size*4+5, 2);
		sheet.mergeCells(size*4+6, 1, size*4+6, 2);
		sheet.mergeCells(size*4+7, 1, size*4+7, 2);
		
		for(int i = 0; i < listMap.size(); i++) {
			Map<String, Object> map = listMap.get(i);
			sheet.addCell(new Label(0, 3 + i, (String)map.get("homepage_name")));
			
			String[] keys = {"I", "C", "D", "E"};
			int j = 0;
			for(String key : keys) {
				LibSvcStatistics o = (LibSvcStatistics)map.get(key);
				
				sheet.addCell(new Number(1 + (j*4), 3 + i, o.getReq_cnt()));
				sheet.addCell(new Number(2 + (j*4), 3 + i, o.getReg_cnt()));
				sheet.addCell(new Number(3 + (j*4), 3 + i, o.getCmp_cnt()));
				sheet.addCell(new Number(3 + (j*4), 3 + i, o.getIng_cnt()));
				sheet.addCell(new Number(4 + (j*4), 3 + i, o.getSum_cnt()));
				j++;
			}
			
			LibSvcStatistics memberCnt = (LibSvcStatistics)map.get("memberCnt");
			
			sheet.addCell(new Number(17, 3 + i, memberCnt.getAll_member_cnt()));
			sheet.addCell(new Number(18, 3 + i, memberCnt.getA_member_cnt()));
			sheet.addCell(new Number(19, 3 + i, memberCnt.getB_member_cnt()));
			sheet.addCell(new Number(20, 3 + i, memberCnt.getC_member_cnt()));
			sheet.addCell(new Number(21, 3 + i, memberCnt.getD_member_cnt()));
			sheet.addCell(new Number(22, 3 + i, memberCnt.getE_member_cnt()));
			sheet.addCell(new Number(23, 3 + i, memberCnt.getLoan_cnt()));
		}
		
		return workbook;
	}

}