package kr.go.gbelib.app.cms.module.training.student2;

import java.util.List;

import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.trainingSetting.TrainingSetting;

public interface Student2Dao  {

	public List<Student2> getStudent2ListAll(Student2 student);
	
	public List<Student2> getStudent2List(Student2 student);
	
	public int getStudent2ListCount(Student2 student);
	
	public Student2 getStudent2One(Student2 student);
	
	public int addStudent2(Student2 student);
	
	public int modifyStudent2(Student2 student);
	
	public int deleteStudent2(Student2 student);
	
	public Student2 getCertificateInfo(Student2 student);
	
	public int checkStudent2(Student2 student);
	
	public int checkStudent2SameTraining(Student2 student);
	
	public int cancelStudent2(Student2 student);
	
	public List<Student2> getTrainingCertificateList(Student2 student);
	
	public Student2 getFirstBackupMember(Training training);
	
	public int updateJoinToBackupMember(Student2 student);
	
	public List<Student2> getCertificateListByDate(Student2 student);

	public int checkStudent2Setting(TrainingSetting ts);

	public int checkStudent2Setting2(Student2 student);

	public List<Student2> getBackupMemberList(Training training);
	
	public int modifyStudent2Status(Student2 student);

	public List<Student2> getCertificateListByDate2(Training training);

	public int checkStudent2Setting3(Student2 student);

	public List<Student2> sendSmsTrainingCancle(Student2 student);
	
}