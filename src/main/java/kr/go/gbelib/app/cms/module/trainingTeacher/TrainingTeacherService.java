package kr.go.gbelib.app.cms.module.trainingTeacher;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.whalesoft.framework.base.BaseService;
import kr.co.whalesoft.framework.file.FileStorage;
import net.sf.classifier4J.util.WFMultiPartPost;
import net.sf.classifier4J.util.WFMPPost;
import net.sf.jxls.transformer.XLSTransformer;

@Service
public class TrainingTeacherService extends BaseService {
	
	@Autowired
	private TrainingTeacherDao dao;
	
	@Autowired
	@Qualifier("trainingTeacherStorage")
	private FileStorage trainingTeacherStorage;
	
	public List<TrainingTeacher> getTeacherListAll(String homepage_id) {
		TrainingTeacher teacher = new TrainingTeacher();
		teacher.setHomepage_id(homepage_id);
		return dao.getTeacherListAll(teacher);
	}
	 
	public List<TrainingTeacher> getTeacherList(TrainingTeacher teacher) {
		return dao.getTeacherList(teacher);
	}
	
	public int getTeacherListCount(TrainingTeacher teacher) {
		return dao.getTeacherListCount(teacher);
	}
	
	public TrainingTeacher getTeacherOne(TrainingTeacher teacher) {
		return dao.getTeacherOne(teacher);
	}
	
	public TrainingTeacher checkTeacher(TrainingTeacher teacher) {
		return dao.checkTeacher(teacher);
	}

	public TrainingTeacher checkTeacher2(TrainingTeacher teacher) {
		return dao.checkTeacher2(teacher);
	}
	
	public Object addTeacher(TrainingTeacher teacher) {
		MultipartFile mFile = teacher.getFile();
		if ( mFile != null ) {
			String realFileName 	= Long.toString((System.currentTimeMillis()));
			String fileName 		= mFile.getOriginalFilename().substring(0, mFile.getOriginalFilename().lastIndexOf("."));
			String fileExtension 	= FilenameUtils.getExtension(mFile.getOriginalFilename());
			String filePath 		= "/" + teacher.getHomepage_id();
			
			File f = trainingTeacherStorage.addFile(mFile, realFileName, filePath);
			
			teacher.setReal_file_name(realFileName);
			teacher.setFile_name(fileName);
			teacher.setFile_extension(fileExtension);
			teacher.setFile_size(f.length());
			
			// webfilter
			String filterCheck = null;
			try {
				filterCheck = webFilterCheck(filePath, realFileName);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			if (filterCheck != null) {
				trainingTeacherStorage.deleteFile(realFileName, filePath);
				return filterCheck;
			}
		} else {
			teacher.setFile_name(null);
		}
		
		return dao.addTeacher(teacher);
	}
	
	public int modifyTeacher(TrainingTeacher teacher) {
		MultipartFile mFile = teacher.getFile();
		if ( mFile != null ) {
			String realFileName 	= Long.toString((System.currentTimeMillis()));
			String fileName 		= mFile.getOriginalFilename().substring(0, mFile.getOriginalFilename().lastIndexOf("."));
			String fileExtension 	= FilenameUtils.getExtension(mFile.getOriginalFilename());
			String filePath 		= "/" + teacher.getHomepage_id();
			
			File f = trainingTeacherStorage.addFile(mFile, realFileName, filePath);
			
			teacher.setReal_file_name(realFileName);
			teacher.setFile_name(fileName);
			teacher.setFile_extension(fileExtension);
			teacher.setFile_size(f.length()); 
		} else {
			teacher.setFile_name(null);
		}
		
		return dao.modifyTeacher(teacher);
	}
	
	public int deleteTeacher(TrainingTeacher teacher) {
		return dao.deleteTeacher(teacher);
	}
	
	public List<TrainingTeacher> getExcelList(TrainingTeacher teacher) {
		return dao.getExcelList(teacher);
	}
	
	public List<TrainingTeacher> getHistoryList(TrainingTeacher teacher) {
		return dao.getHistoryList(teacher);
	}
	
	public int confirmTeacher(TrainingTeacher teacher) {
		return dao.confirmTeacher(teacher);
	}
	
	public int getCertSeq() {
		return dao.getCertSeq();
	}

	public void writeExcelData(TrainingTeacher teacher, OutputStream outputStream, HttpServletRequest request) throws Exception {
		String sampleFilePath = request.getSession().getServletContext().getRealPath("/") + "/resources/module/teacher/teacherCert.xls";
		Workbook workbook = null;
		 
		teacher = dao.getTeacherOne(teacher);
		teacher.setCert_seq_num(dao.getCertSeq());
		List<TrainingTeacher> historyList = dao.getHistoryList(teacher);
		
		int limitRowCount = 13;
		if ( historyList.size() > limitRowCount ) {
			while ( historyList.size() != limitRowCount ) {
				historyList.remove(historyList.remove(0));
			}
		}
		else if ( historyList.size() < limitRowCount ) {
			while ( historyList.size() != limitRowCount ) {
				historyList.add(new TrainingTeacher());
			}
		}
		
		int sum_total_time = 0;
		for ( TrainingTeacher one : historyList ) {
			sum_total_time = sum_total_time + one.getTotal_time();
		}
		teacher.setSum_total_time(sum_total_time);
		
		SimpleDateFormat sfYear = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date();
		String[] nows = sfYear.format(now).split("-");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("curYear", nows[0]);
		dataMap.put("curMonth", nows[1]);
		dataMap.put("curDay", nows[2]);
		dataMap.put("teacher", teacher);
		dataMap.put("historyList", historyList);
		dataMap.put("homepageName", teacher.getHomepage_name());
		workbook = new XLSTransformer().transformXLS(new BufferedInputStream(new FileInputStream(new File(sampleFilePath))), dataMap);
		
		workbook.write(outputStream);
	}
	
	public int modifyManageHistory(TrainingTeacher teacher) {
		return dao.modifyManageHistory(teacher);
	}
	
	public String getRootPath() {
		return trainingTeacherStorage.getRootPath();
	}

	public TrainingTeacher getTeacherAgreeOne(TrainingTeacher teacher) {
		return dao.getTeacherAgreeOne(teacher);
	}

	public int addTeacherAgree(TrainingTeacher teacher) {
		return dao.addTeacherAgree(teacher);
	}

	public int deleteTeacherAgree(TrainingTeacher teacher) {
		return dao.deleteTeacherAgree(teacher);
	}
	
	private String webFilterCheck(String filePath, String fileName) throws Exception {
		/*
		 * WFMultiPartPost(웹서버도메인, 웹필터서버아이피, 웹필터서버포트)
		 */
		WFMPPost wfsend = new WFMPPost("http://www.gbelib.kr", "filter.gbelib.kr", 80, "utf8");

		/*
		 * WFMultiPartPost.sendWebFilter(작성자, 제목, 내용, 첨부파일경로)   - 첨부파일이 여러개 존재 시 , 로 구분하여 전송
		 * 웹필터서버 응답  : 	Y = 차단		 N = 등록			B = 바이패스
		 */
//		rootPath + "/" + filePath + File.separator + fileName 
		String fileList = trainingTeacherStorage.getRootPath()+filePath+File.separator+fileName;

		String wfResponse = wfsend.sendWebFilter("", "", "", fileList);
		if(wfResponse.equals("Y")){
			return wfsend.getDenyURL();
		} else if(wfResponse.equals("N")){

			return null;
		} else if(wfResponse.equals("B")){

			return null;
		}
		return null;
	}
	
}