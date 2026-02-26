package kr.go.gbelib.app.cms.module.excelDownLog;

import is.tagomor.woothee.Classifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import kr.co.whalesoft.framework.base.BaseService;
import kr.go.gbelib.app.cms.module.teach.student.Student;
import kr.go.gbelib.app.cms.module.teachBook.TeachBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExcelDownLogService extends BaseService {

    @Autowired
    private ExcelDownLogDao dao;

    public int addExcelDownLog(ExcelDownLog excelDownLog, Student student, HttpServletRequest request) {

        Map<String, String> r = Classifier.execParse(request.getHeader("User-Agent"));

        //	클라이언트 IP 확인
        String ip = request.getRemoteAddr();

        excelDownLog.setAdd_id(student.getMember_id());
        excelDownLog.setOs(r.get("os") + " " + r.get("os_version"));
        excelDownLog.setBrowser(r.get("name") + " " + r.get("version"));
        excelDownLog.setIp(ip);
        excelDownLog.setTeach_idx(student.getTeach_idx());
        excelDownLog.setType("1");
        excelDownLog.setSite_id(student.getHomepage_id());
        return dao.addExcelDownLog(excelDownLog);
    }

    public int addExcelDownLog(ExcelDownLog excelDownLog, TeachBook teachBook, HttpServletRequest request) {

        Map<String, String> r = Classifier.execParse(request.getHeader("User-Agent"));

        excelDownLog.setAdd_id(teachBook.getMember_id());
        excelDownLog.setOs(r.get("os") + " " + r.get("os_version"));
        excelDownLog.setBrowser(r.get("name") + " " + r.get("version"));
        excelDownLog.setIp(request.getRemoteAddr());
        excelDownLog.setTeach_idx(teachBook.getTeach_idx());
        excelDownLog.setType("2");
        excelDownLog.setSite_id(teachBook.getHomepage_id());
        return dao.addExcelDownLog(excelDownLog);
    }

    public List<ExcelDownLog> getUserExcelDownLog(ExcelDownLog excelDownLog) {
        return dao.getUserExcelDownLog(excelDownLog);
    }

    public List<ExcelDownLog> getAttendExcelDownLog(ExcelDownLog excelDownLog) {
        return dao.getAttendExcelDownLog(excelDownLog);
    }

    public List<ExcelDownLog> getAllExcelDownLog(ExcelDownLog excelDownLog) {
        return dao.getAllExcelDownLog(excelDownLog);
    }

    public int getAllExcelDownLogCount(ExcelDownLog excelDownLog) {
        return dao.getAllExcelDownLogCount(excelDownLog);
    }

    public List<ExcelDownLog> getAllExcelDownLog_excel(ExcelDownLog excelDownLog) {
        return dao.getAllExcelDownLog_excel(excelDownLog);
    }

    public int addExcelDownLogReason(ExcelDownLog excelDownLog) {
        return dao.addExcelDownLogReason(excelDownLog);
    }

    public int getExcelDownLogReasonCount(ExcelDownLog excelDownLog) {
        return dao.getExcelDownLogReasonCount(excelDownLog);
    }

    public List<ExcelDownLog> getExcelDownLogReasonList(ExcelDownLog excelDownLog) {
        return dao.getExcelDownLogReasonList(excelDownLog);
    }

    public List<ExcelDownLog> getAllExcelDownLogReasonList(ExcelDownLog excelDownLog) {
        List<ExcelDownLog> list = new ArrayList<ExcelDownLog>();
        if (excelDownLog.getExcel_idx_arr() != null && !excelDownLog.getExcel_idx_arr().isEmpty()) {
            for (Integer excel_idx : excelDownLog.getExcel_idx_arr()) {
                excelDownLog.setIdx(excel_idx);
                list.add(dao.getExcelDownLogReason(excelDownLog));
            }
            return list;
        }
        return dao.getAllExcelDownLogReasonList(excelDownLog);
    }

    public ExcelDownLog getExcelDownLogReason(ExcelDownLog excelDownLog) {
        return dao.getExcelDownLogReason(excelDownLog);
    }
}
