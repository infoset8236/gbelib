package kr.go.gbelib.app.cms.module.trainingTeacher;

import java.util.List;

public interface TrainingTeacherDao  {

	public List<TrainingTeacher> getTeacherList(TrainingTeacher teacher);
	
	public List<TrainingTeacher> getTeacherListAll(TrainingTeacher teacher);
	
	public int getTeacherListCount(TrainingTeacher teacher);
	
	public TrainingTeacher getTeacherOne(TrainingTeacher teacher);
	
	public int addTeacher(TrainingTeacher teacher);
	
	public int modifyTeacher(TrainingTeacher teacher);
	
	public int deleteTeacher(TrainingTeacher teacher);
	
	// teacher_idx 반환.
	public TrainingTeacher checkTeacher(TrainingTeacher teacher);

	public List<TrainingTeacher> getExcelList(TrainingTeacher teacher);
	
	public List<TrainingTeacher> getHistoryList(TrainingTeacher teacher);
	
	public int getCertSeq();
	
	public int confirmTeacher(TrainingTeacher teacher);
	
	public int modifyManageHistory(TrainingTeacher teacher);

	public TrainingTeacher checkTeacher2(TrainingTeacher teacher);

	public TrainingTeacher getTeacherAgreeOne(TrainingTeacher teacher);

	public int addTeacherAgree(TrainingTeacher teacher);

	public int deleteTeacherAgree(TrainingTeacher teacher);
}