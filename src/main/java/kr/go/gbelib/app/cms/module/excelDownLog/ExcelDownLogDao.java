package kr.go.gbelib.app.cms.module.excelDownLog;

import java.util.List;

public interface ExcelDownLogDao {

    public int addExcelDownLog(ExcelDownLog excelDownLog);

    public List<ExcelDownLog> getUserExcelDownLog(ExcelDownLog excelDownLog);

    public List<ExcelDownLog> getAttendExcelDownLog(ExcelDownLog excelDownLog);

    public List<ExcelDownLog> getAllExcelDownLog(ExcelDownLog excelDownLog);

    public int getAllExcelDownLogCount(ExcelDownLog excelDownLog);

    public List<ExcelDownLog> getAllExcelDownLog_excel(ExcelDownLog excelDownLog);

    public int addExcelDownLogReason(ExcelDownLog excelDownLog);

    public int getExcelDownLogReasonCount(ExcelDownLog excelDownLog);

    public List<ExcelDownLog> getExcelDownLogReasonList(ExcelDownLog excelDownLog);

    public List<ExcelDownLog> getAllExcelDownLogReasonList(ExcelDownLog excelDownLog);

    public ExcelDownLog getExcelDownLogReason(ExcelDownLog excelDownLog);
}
