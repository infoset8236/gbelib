package kr.go.gbelib.app.cms.module.training;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.homepage.HomepageService;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.framework.base.BaseService;
import kr.co.whalesoft.framework.file.FileStorage;
import kr.go.gbelib.app.cms.module.training.student2.Student2;
import kr.go.gbelib.app.cms.module.training.student2.Student2Dao;
import kr.go.gbelib.app.common.api.MemberAPI;
import kr.go.gbelib.app.common.api.PushAPI;

@Service
public class TrainingService extends BaseService {
	
	@Autowired
	@Qualifier("trainingStorage")
	private FileStorage trainingStorage;
	
	@Autowired
	private TrainingDao trainingDao;
	
	@Autowired
	private Student2Dao studentDao;
	
	@Autowired
	private HomepageService homepageService;

	@Autowired
	private PushAPI pushAPI;

	public List<Training> getTrainingListAll(Training training) {
		return trainingDao.getTrainingListAll(training);
	}
	 
	public List<Training> getTrainingList(Training training) {
		List<Training> list = trainingDao.getTrainingList(training);
		
		for (Training trainingOne : list) {
			String training_day = trainingOne.getTraining_day();
			trainingOne.setTraining_day_arr(training_day.split("\\,"));
			trainingOne.setHolidays(trainingDao.getHolidays(trainingOne));
			if (StringUtils.isNotEmpty(trainingOne.getProgram_age_div())) {
				trainingOne.setProgram_age_div_arr(Arrays.asList(trainingOne.getProgram_age_div().split(",")));
			}
		}
		return list; 
	}
	
	public int getTrainingListCount(Training training) {
		return trainingDao.getTrainingListCount(training);
	}
	
	public Training getTrainingOne(Training training) {
		Training result = trainingDao.getTrainingOne(training);
		if (result != null) {
			if (StringUtils.isNotEmpty(result.getProgram_age_div())) {
				result.setProgram_age_div_arr(Arrays.asList(result.getProgram_age_div().split(",")));
			}
			result.setTraining_day_arr(result.getTraining_day().split("\\,"));
			result.setHolidays(trainingDao.getHolidays(result)); 
		}
		
		return result;
	}
	
	@Transactional
	public int addTraining(Training training) {
		MultipartFile mFile = training.getPlan_file();
		
		if ( mFile != null ) {
			String realFileName 	= Long.toString((System.currentTimeMillis()));
			String fileName 		= mFile.getOriginalFilename().substring(0, mFile.getOriginalFilename().lastIndexOf("."));
			String fileExtension 	= FilenameUtils.getExtension(mFile.getOriginalFilename());
			String filePath 		= "/" + training.getHomepage_id();
			
			File f = trainingStorage.addFile(mFile, realFileName, filePath);
			
			training.setReal_file_name(realFileName);
			training.setPlan_file_name(fileName);
			training.setFile_extension(fileExtension);
			training.setFile_size(f.length()); 
		}
		
		mFile = training.getImage_plan_file();
		
		if ( mFile != null ) {
			String realFileName 	= Long.toString((System.currentTimeMillis()));
			String fileName 		= mFile.getOriginalFilename().substring(0, mFile.getOriginalFilename().lastIndexOf("."));
			String fileExtension 	= FilenameUtils.getExtension(mFile.getOriginalFilename());
			String filePath 		= "/" + training.getHomepage_id()+"/img";
			
			File f = trainingStorage.addFile(mFile, realFileName, filePath);
			
			training.setImage_real_file_name(realFileName);
			training.setImage_plan_file_name(fileName);
			training.setImage_file_extension(fileExtension);
			training.setImage_file_size(f.length()); 
		} 

		training.setTraining_idx(trainingDao.getNextTrainingIdx(training));
		if (training.getHolidays() != null && training.getHolidays().size() > 0) {
			for ( String str : training.getHolidays() ) {
				training.setHoliday(str);
				trainingDao.addTrainingHolidays(training);
			}
		}
		
		if (training.getProgram_age_div_arr() != null && training.getProgram_age_div_arr().size() > 0) {
			training.setProgram_age_div(StringUtils.join(training.getProgram_age_div_arr(), ","));
		}
		
		return trainingDao.addTraining(training);
	}
	
	@Transactional
	public int modifyTraining(Training training) {
		MultipartFile mFile = training.getPlan_file();
		
		if ( mFile != null ) {
			String realFileName 	= Long.toString((System.currentTimeMillis()));
			String fileName 		= mFile.getOriginalFilename().substring(0, mFile.getOriginalFilename().lastIndexOf("."));
			String fileExtension 	= FilenameUtils.getExtension(mFile.getOriginalFilename());
			String filePath 		= "/" + training.getHomepage_id();
			
			File f = trainingStorage.addFile(mFile, realFileName, filePath);
			
			training.setReal_file_name(realFileName);
			training.setPlan_file_name(fileName);
			training.setFile_extension(fileExtension);
			training.setFile_size(f.length()); 
		} 
		
		mFile = training.getImage_plan_file();
		if ( mFile != null ) {
			String realFileName 	= Long.toString((System.currentTimeMillis()));
			String fileName 		= mFile.getOriginalFilename().substring(0, mFile.getOriginalFilename().lastIndexOf("."));
			String fileExtension 	= FilenameUtils.getExtension(mFile.getOriginalFilename());
			String filePath 		= "/" + training.getHomepage_id()+"/img";
			
			File f = trainingStorage.addFile(mFile, realFileName, filePath);
			
			training.setImage_real_file_name(realFileName);
			training.setImage_plan_file_name(fileName);
			training.setImage_file_extension(fileExtension);
			training.setImage_file_size(f.length()); 
		} 
		
		Training beforeTraining 		= trainingDao.getTrainingOne(training);
		int beforeLimitCount 	= beforeTraining.getTraining_limit_count();
		int afterLimitCount 	= training.getTraining_limit_count();
		
		if (training.getHolidays() != null && training.getHolidays().size() > 0) {
			trainingDao.deleteTrainingHolidays(training);
			for ( String str : training.getHolidays() ) {
				training.setHoliday(str);
				trainingDao.addTrainingHolidays(training);
			}
		}
		
		if (training.getProgram_age_div_arr() != null && training.getProgram_age_div_arr().size() > 0) {
			training.setProgram_age_div(StringUtils.join(training.getProgram_age_div_arr(), ","));
		}
		
		int result 				= trainingDao.modifyTraining(training);

		
		if ( result > 0 ) {
			if ( afterLimitCount > beforeLimitCount ) {
				List<Student2> backupStudentList = studentDao.getBackupMemberList(training);
				for ( int i = 0; i < (afterLimitCount - beforeLimitCount); i ++ ) {
					if ( i < backupStudentList.size() ) {
						Student2 backupStudent = backupStudentList.get(i);
						backupStudent.setApply_status("1");
						studentDao.modifyStudent2Status(backupStudent);
						
						Homepage homepage = homepageService.getHomepageOne(new Homepage(backupStudent.getHomepage_id()));
						pushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, backupStudent.getApplicant_cell_phone(), String.format("[%s] 정상 참여 되었습니다.", training.getTraining_name()), homepage.getHomepage_send_tell(), true);
						
					}
				}
					
			}	
		}
		
		return result;
	}
	
	@Transactional
	public int deleteTraining(Training training) {
		int result = trainingDao.deleteTraining(training);
		if ( result > 0) {
			if (studentDao.deleteStudent2(new Student2(training.getHomepage_id(), training.getGroup_idx(), training.getCategory_idx(), training.getTraining_idx())) > 0) {
				trainingDao.deleteTrainingHolidays(training);
			}
		}
		
		return result;
	}
	
	public List<Training> getTrainingListForCalendar(CalendarManage calendarManage) {
		List<Training> list = trainingDao.getTrainingListForCalendar(calendarManage);
		for (Training training : list) {
			training.setTraining_day_arr(training.getTraining_day().split("\\,"));
			training.setHolidays(trainingDao.getHolidays(training));
		}
		return list;
	}
	
	private String numbersOnly(String s) {
		if(s == null) {
			return null;
		} else {
			return s.replaceAll("[^,0-9]", "");
		}
	}
	
	public List<Training> getTrainingListForUser(Training training) {
		training.setSearchCate1(numbersOnly(training.getSearchCate1()));
		training.setSearchCate2(numbersOnly(training.getSearchCate2()));
		training.setSearchCate3(numbersOnly(training.getSearchCate3()));
		training.setGroup_idx_list(numbersOnly(training.getGroup_idx_list()));
		
		List<Training> list = trainingDao.getTrainingListForUser(training);
		if (list != null && list.size() > 0) {
			for (Training result : list) {
				result.setTraining_day_arr(result.getTraining_day().split(","));
				result.setHolidays(trainingDao.getHolidays(result));
			}
		}
		return list;
	}
	
	public List<Training> getTrainingListForAllHomepage(Training training) {
		List<Training> list = trainingDao.getTrainingListForAllHomepage(training);
		if (list != null && list.size() > 0) {
			for (Training result : list) {
				result.setTraining_day_arr(result.getTraining_day().split(","));
				result.setHolidays(trainingDao.getHolidays(result));
				if (StringUtils.isNotEmpty(result.getProgram_age_div())) {
					result.setProgram_age_div_arr(Arrays.asList(result.getProgram_age_div().split(",")));
				}
			}
		}
		return list;
	}
	
	private String sanitizeLogicFunction(String logicFunction) {
		if(StringUtils.equals(logicFunction, "AND")) {
			return logicFunction;
		} else if(StringUtils.equals(logicFunction, "OR")) {
			return logicFunction;
		} else if(StringUtils.equals(logicFunction, "NOT")) {
			return logicFunction;
		} else {
			return null;
		}
	}
	
	public int getTrainingListForAllHomepageCount(Training training) {
		training.setLogicFunction1(sanitizeLogicFunction(training.getLogicFunction1()));
		training.setLogicFunction2(sanitizeLogicFunction(training.getLogicFunction2()));
		training.setLogicFunction3(sanitizeLogicFunction(training.getLogicFunction3()));
		training.setLogicFunction4(sanitizeLogicFunction(training.getLogicFunction4()));
		return trainingDao.getTrainingListForAllHomepageCount(training);
	}
	
	public Training getTrainingDetailForUser(Training training) {
		training = trainingDao.getTrainingDetailForUser(training);
		if ( training != null ) {
			training.setTraining_day_arr(training.getTraining_day().split(","));
			training.setHolidays(trainingDao.getHolidays(training));
			if (StringUtils.isNotEmpty(training.getProgram_age_div())) {
				training.setProgram_age_div_arr(Arrays.asList(training.getProgram_age_div().split(",")));
			}
		}
		
		return training;
	}
	
	public List<Training> getApplyList(Training training) {
		List<Training> list = trainingDao.getApplyList(training);
		if (list != null && list.size() > 0) {
			for (Training result : list) {
				result.setTraining_day_arr(result.getTraining_day().split(","));
				result.setHolidays(trainingDao.getHolidays(result));
				if (StringUtils.isNotEmpty(result.getProgram_age_div())) {
					result.setProgram_age_div_arr(Arrays.asList(result.getProgram_age_div().split(",")));
				}
				if(result.getTraining_status().equals("3") || result.getTraining_status().equals("4")) {
					try {
						result.setMember_key(training.getMember_key());
						result.setWait_num(trainingDao.getWaitingNumber(result));
					} catch(BindingException be) {
						result.setWait_num(0);
					}
				}
			}
		}
		return list;
	}
	
	public int getPrintMaxValue(Training training) {
		return trainingDao.getPrintMaxValue(training);
	}

	public String getRootPath() {
		return trainingStorage.getRootPath();
	}
	
	public List<Training> getSameTrainingByName(Training training) {
		return trainingDao.getSameTrainingByName(training);
	}
	
	public List<Training> getMainViewTrainingList(Training training) {
		return trainingDao.getMainViewTrainingList(training);
	}
	
	public List<Training> getMainViewTrainingListForAllHomepage(Training training) {
		return trainingDao.getMainViewTrainingListForAllHomepage(training);
	}
	
	public int deleteFile(Training training) {
		training = trainingDao.getTrainingOne(training);
		String fileName = training.getReal_file_name();
		String filePath = training.getHomepage_id();
		trainingStorage.deleteFile(fileName, filePath);
		return trainingDao.deleteFile(training);
		
	}
	
	public int deleteImage(Training training) {
		training = trainingDao.getTrainingOne(training);
		String fileName = training.getImage_real_file_name();
		String filePath = training.getHomepage_id();
		trainingStorage.deleteFile(fileName, filePath);
		return trainingDao.deleteImage(training);
	}
	
	public void sendSmsTrainingCancle() {
		
		// homewas2_homepage3 컨테이너에서만 실행
		if(StringUtils.equals(System.getProperty("whalesoft.container"), "homewas2_homepage3")) {
			List<Training> trainingList = trainingDao.getSchaduleTraining();
			
			if(trainingList != null) {
				for(Training training : trainingList) {
					
					Homepage homepage = homepageService.getHomepageOne(new Homepage(training.getHomepage_id()));
					String message = training.getCancle_guid();
					
					Student2 student = new Student2();
					student.setTraining_idx(training.getTraining_idx());
					List<Student2> studentList = studentDao.sendSmsTrainingCancle(student);
					
					for(Student2 one : studentList) {
						if (isSmsReceive2("WEBID", one.getMember_key()).equals("Y")) {
							pushAPI.sendMessage(homepage, PushAPI.SMS_TYPE_SMS, one.getApplicant_cell_phone(), message, homepage.getHomepage_send_tell(), true);
						}
					}
				}
			}
		}
		
	}
	
	public String isSmsReceive2(String mode, String member_key) {
		Member member = new Member();
		Map<String, String> map = null;
		String result = "X";
		
		member.setCheck_certify_type("SEQNO");
		member.setCheck_certify_data(member_key);
			
		map = MemberAPI.getMemberCertify("WEB", member);
		
		if(map != null) {
			if(StringUtils.equals(map.get("SMS_CHECK"), "Y")) {
				result = "Y";
			} else {
				result = "N";
			}
			return result;
		} else {
			return result;
		}		
	}

	public int modifyToken(Training training) {
		return trainingDao.modifyToken(training);
	}

	public Training getTrainingByQr(Training training) {
		return trainingDao.getTrainingByQr(training);
	}
	
}