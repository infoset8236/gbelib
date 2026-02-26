package kr.go.gbelib.app.cms.module.memberGroupAuthLog;

import jxl.write.WritableWorkbook;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class ExcelView extends AbstractJExcelView {
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<MemberGroupAuthLog> memberGroupAuthLogList = (List<MemberGroupAuthLog>) model.get("memberGroupAuthLogList");
		
		String fileName = "그룹 권한 추가 및 삭제 리스트.xls";
		
		response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("Application/Msexcel");
		
		new MemberGroupAuthLogWorkbook().workbookForm(workbook, memberGroupAuthLogList, request, response);
	}

}
