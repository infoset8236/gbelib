package kr.go.gbelib.app.cms.module.elib.hopeElibBook;

import static java.net.URLEncoder.encode;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.write.WritableWorkbook;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

public class HopeElibBookExcelView extends AbstractJExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        @SuppressWarnings("unchecked")
        HopeElibBook book = (HopeElibBook) model.get("hopeElibBook");
        List<HopeElibBook> bookList = (List<HopeElibBook>) model.get("bookList");

        String type = book.getType();
        String typeName = "미분류";

        if ("EBK".equals(type)) {
            typeName = "전자책";
        } else if ("WEB".equals(type)) {
            typeName = "온라인강좌";
        } else if ("ADO".equals(type)) {
            typeName = "오디오북";
        }

        String fileName = typeName + "_목록_" + new SimpleDateFormat("yyyyMMdd").format(new Date()) + ".xls";
        String header = request.getHeader("user-agent");
        String encodedFileName = null;

        if (header.contains("MSIE") || header.contains("Trident")) {
            encodedFileName = encode(fileName, "UTF-8").replaceAll("\\+", "%20");
        } else if (header.contains("Edge")) {
            encodedFileName = encode(fileName, "UTF-8");
        } else {
            encodedFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
        }

        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        response.setContentType("application/vnd.ms-excel");

        new HopeElibBookWorkBook().workbookForm(workbook, book, bookList, request, response);
    }

}
