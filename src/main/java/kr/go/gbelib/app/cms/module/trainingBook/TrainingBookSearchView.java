package kr.go.gbelib.app.cms.module.trainingBook;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractJExcelView;

import jxl.write.WritableWorkbook;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.student2.Student2;

public class TrainingBookSearchView extends AbstractJExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Training training = (Training) model.get("training");
		List<Student2> studentList = (List<Student2>) model.get("studentList");
		List<CalendarManage> calendar = (List<CalendarManage>) model.get("calendar");
		TrainingBook trainingBook = (TrainingBook) model.get("trainingBook");
		Map<Integer, Map<String, String>> trainingBookRepo = (Map<Integer, Map<String, String>>) model.get("trainingBookRepo");
//		
//		String sheetName = training.getTraining_name(); // 시트이름
//		workbook.createSheet(sheetName, 0); // 시트설정

		String fileName = "TrainingBook.xls";

		response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("Application/Msexcel");
		
		new TrainingBookWorkbook().buildExcelDocument(workbook, training, studentList, calendar, trainingBook, trainingBookRepo, request, response);
	}
}
