package kr.go.gbelib.app.cms.module.teach.student;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.write.WritableWorkbook;
import kr.co.whalesoft.framework.utils.AttachmentUtils;
import kr.go.gbelib.app.cms.module.teach.Teach;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

public class TotalTeachStudentSearchView extends AbstractJExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {

        @SuppressWarnings("unchecked")
        List<Student> studentList = (List<Student>) model.get("studentResult");

        Student student = (Student) model.get("student");
        workbook.createSheet("검색 별 수강생 조회", 0); // 시트설정

        String fileName = "Student.xls";

        response.setHeader("Content-Disposition", AttachmentUtils.getContentDisposition(fileName, request.getHeader("user-agent")));
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("Application/Msexcel");

        new TotalTeachWorkBook().workbookForm(workbook, studentList, student, request, response);

    }
}
