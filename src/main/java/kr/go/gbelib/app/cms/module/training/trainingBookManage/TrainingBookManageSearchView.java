package kr.go.gbelib.app.cms.module.training.trainingBookManage;

import jxl.write.WritableWorkbook;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class TrainingBookManageSearchView extends AbstractJExcelView {
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<TrainingBookManage> trainingManageList = (List<TrainingBookManage>) model.get("trainingBookManageList");
		
		String fileName = "연수 출석부.xls";
		
		response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("Application/Msexcel");
		
		new TrainingBookManageWorkbook().workbookForm(workbook, trainingManageList, request, response);
	}
}
