package kr.go.gbelib.app.cms.module.trainingBook;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.WritableWorkbook;
import kr.co.whalesoft.app.cms.code.Code;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import kr.co.whalesoft.framework.utils.HangulEnDecoder;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.student2.Student2;

public class TrainingBookXlsToCsv {

	public TrainingBookXlsToCsv(List<Student2> studentList, List<Code> codeList, Training trainingOne, List<CalendarManage> calendar, TrainingBook trainingBook,
			Map<Integer, Map<String, String>> trainingBookRepo, String fileName, HttpServletRequest request, HttpServletResponse response) {
		try {
			OutputStream out = response.getOutputStream();
			WritableWorkbook workbook = Workbook.createWorkbook(out);
			workbook = new TrainingBookWorkbook().buildExcelDocument(workbook, trainingOne, studentList, calendar, trainingBook, trainingBookRepo, request, response);
			response.reset();

			response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "no-cache");
			response.setContentType("text/csv; charset=CP949");

			StringBuffer data = new StringBuffer();

			for(int rowNum = 0; rowNum < workbook.getSheet(0).getRows(); rowNum++) {
				for(int colNUm = 0; colNUm < workbook.getSheet(0).getColumns(); colNUm++) {
					jxl.Cell cell = workbook.getSheet(0).getCell(colNUm, rowNum);
					String cellStr = cell.getContents() == null ? "" : cell.getContents();
					data.append("\"" + cellStr + "\"");
					if(colNUm + 1 != workbook.getSheet(0).getColumns()) {
						data.append(",");
					}
				}
				data.append("\n");
			}

			HangulEnDecoder.encodeDataOutput(data, "UTF-8", "CP949", response);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
