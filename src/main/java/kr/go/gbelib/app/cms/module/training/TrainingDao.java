package kr.go.gbelib.app.cms.module.training;

import java.util.List;

import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.go.gbelib.app.cms.module.training.student2.Student2;

public interface TrainingDao  {

	public List<Training> getTrainingList(Training training);
	
	public List<Training> getTrainingListAll(Training training);
	
	public int getTrainingListCount(Training training);
	
	public Training getTrainingOne(Training training);
	
	public int addTraining(Training training);
	
	public int modifyTraining(Training training);
	
	public int deleteTraining(Training training);
	
	public List<Training> getTrainingListForCalendar(CalendarManage calendarManage);
	
	public List<Training> getTrainingListForUser(Training training);
	
	public List<Training> getTrainingListForAllHomepage(Training training);
	
	public Training getTrainingDetailForUser(Training training);
	
	public int changeTrainingStatus(Training training);
	
	public int mergeBackupMember(Training training);
	
	public List<Training> getApplyList(Training training);
	
	public int getPrintMaxValue(Training training);
	
	public List<Training> getTrainingListOfStudent(Student2 student);

	public List<Training> getSameTrainingByName(Training training);
	
	public List<Training> getMainViewTrainingList(Training training);

	public List<Training> getMainViewTrainingListForAllHomepage(Training training);
	
	public int deleteFile(Training training);

	public int getTrainingListForAllHomepageCount(Training training);

	public int addTrainingHolidays(Training training);

	public int getNextTrainingIdx(Training training);

	public int deleteTrainingHolidays(Training training);

	public List<String> getHolidays(Training training);

	public int deleteImage(Training training);

	public List<Training> getSchaduleTraining();

	public int modifySmsFlag(Training training);

	public int getWaitingNumber(Training result);

	public int modifyToken(Training training);

	public Training getTrainingByQr(Training training);
}