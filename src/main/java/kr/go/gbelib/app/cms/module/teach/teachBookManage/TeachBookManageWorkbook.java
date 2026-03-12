package kr.go.gbelib.app.cms.module.teach.teachBookManage;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import kr.go.gbelib.app.cms.module.training.Training;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

public class TeachBookManageWorkbook {
	
	protected WritableWorkbook workbookForm(WritableWorkbook workbook, Training training, List<TeachBookManage> trainingBookManageList, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<Integer, List<TeachBookManage>> qrCountMap = new LinkedHashMap<Integer, List<TeachBookManage>>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");

		String fileName = "연수 출석부.xls";

		response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("Application/Msexcel");

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

		int sheetIndex = 0;
		String sheetName = "출석부(전체)";
		WritableSheet sheet = workbook.createSheet(sheetName, sheetIndex++);

		sheet.setColumnView(0, 20);
		sheet.setColumnView(1, 20);
		sheet.setColumnView(2, 30);
		sheet.setColumnView(3, 30);
		sheet.setColumnView(4, 30);
		sheet.setColumnView(5, 20);
		sheet.setColumnView(6, 20);
		sheet.setColumnView(7, 20);
		sheet.setColumnView(8, 20);
		sheet.setColumnView(9, 50);

		sheet.addCell(new Label(0, 0, "이름", format));
		sheet.addCell(new Label(1, 0, "ID", format));
		sheet.addCell(new Label(2, 0, "생년월일", format));
		sheet.addCell(new Label(3, 0, "신청시 소속기관", format));
		sheet.addCell(new Label(4, 0, "휴대폰 번호", format));
		sheet.addCell(new Label(5, 0, "직급", format));
		sheet.addCell(new Label(6, 0, "회차", format));
		sheet.addCell(new Label(7, 0, "출석현황", format));
		sheet.addCell(new Label(8, 0, "출석방식", format));
		sheet.addCell(new Label(9, 0, "출석일시", format));

		int row = 1;
		for (TeachBookManage one : trainingBookManageList) {
			String trainingStatus = "";
			String trainingType = "";
			String trainingDate = "";

			sheet.addCell(new Label(0, row, one.getStudent_name(), format1));
			sheet.addCell(new Label(1, row, one.getWeb_id(), format1));
			sheet.addCell(new Label(2, row, one.getStudent_birth(), format1));
			sheet.addCell(new Label(4, row, one.getApplicant_cell_phone(), format1));

			if ("1".equals(one.getTeach_status())) {
				trainingStatus = "미출석";
			} else {
				trainingStatus = "출석";
			}
			sheet.addCell(new Label(7, row, trainingStatus, format1));

			if ("1".equals(one.getTeach_type())) {
				trainingType = "QR출석";
			} else {
				trainingType = "수동출석";
			}
			sheet.addCell(new Label(8, row, trainingType, format1));

			if (one.getTeach_date() != null) {
				trainingDate = sdf.format(one.getTeach_date());
			}
			sheet.addCell(new Label(9, row, trainingDate, format1));

			row++;
		}

		sheetName = "출석부(요약)";
		sheet = workbook.createSheet(sheetName, sheetIndex++);

		sheet.setColumnView(0, 20);
		sheet.setColumnView(1, 30);
		sheet.setColumnView(2, 20);
		sheet.setColumnView(3, 20);
		for (int i = 1; i <= training.getQr_check_count(); i++) {
			sheet.setColumnView(i + 3, 20);
		}

		sheet.addCell(new Label(0, 0, "이름", format));
		sheet.addCell(new Label(1, 0, "신청시 소속기관", format));
		sheet.addCell(new Label(2, 0, "직급", format));
		sheet.addCell(new Label(3, 0, "날짜", format));
		for (int i = 1; i <= training.getQr_check_count(); i++) {
			sheet.addCell(new Label(i + 3, 0, i + "회차", format));
		}

		row = 1;

		Map<String, Map<Integer, Boolean>> attendanceMap = new LinkedHashMap<String, Map<Integer, Boolean>>();
		Map<String, String[]> keyToBasicInfo = new HashMap<String, String[]>();

		return workbook;
	}
}
