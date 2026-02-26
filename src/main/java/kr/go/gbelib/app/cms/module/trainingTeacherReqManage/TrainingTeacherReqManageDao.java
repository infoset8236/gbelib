package kr.go.gbelib.app.cms.module.trainingTeacherReqManage;

import java.util.List;

import kr.go.gbelib.app.cms.module.teacher.Teacher;
import kr.go.gbelib.app.cms.module.trainingTeacher.TrainingTeacher;

public interface TrainingTeacherReqManageDao  {

	public List<TrainingTeacherReqManage> getTeacherList(TrainingTeacherReqManage teacherReqManage);
	
	public List<TrainingTeacherReqManage> getTeacherApplyList(TrainingTeacherReqManage teacherReqManage);
	
	public List<TrainingTeacherReqManage> getTeacherListAll(TrainingTeacherReqManage teacherReqManage);
	
	public int getTeacherListCount(TrainingTeacherReqManage teacherReqManage);
	
	public int getTeacherApplyListCount(TrainingTeacherReqManage teacherReqManage);
	
	public TrainingTeacherReqManage getTeacherOne(TrainingTeacherReqManage teacherReqManage);
	
	public TrainingTeacherReqManage getTeacherApplyOne(TrainingTeacherReqManage teacherReqManage);
	
	public int addTeacher(TrainingTeacherReqManage teacherReqManage);
	
	public int modifyTeacher(TrainingTeacherReqManage teacherReqManage);
	
	public int deleteTeacher(TrainingTeacherReqManage teacherReqManage);
	
	// teacher_idx 반환.
	public TrainingTeacherReqManage checkTeacher(TrainingTeacherReqManage teacherReqManage);

	public List<TrainingTeacherReqManage> getHistoryList(TrainingTeacherReqManage teacherReqManage);
	
	public int confirmTeacher(TrainingTeacherReqManage teacherReqManage);
	
	public int modifyManageHistory(TrainingTeacher teacher);
}