package kr.go.gbelib.app.cms.module.training.trainingBookManage;

import java.util.List;

public interface TrainingBookManageDao {

    public int addTrainingBookManage(TrainingBookManage trainingBookManage);

    public List<TrainingBookManage> getTrainingBookManage(TrainingBookManage trainingBookManage);

    public int getTrainingBookManageCount(TrainingBookManage trainingBookManage);

    public int checkTrainingBookManage(TrainingBookManage trainingBookManage);

    public TrainingBookManage checkTrainingStudent(TrainingBookManage trainingBookManage);

    public int checkTrainingStudentCount(TrainingBookManage trainingBookManage);

    public int modifyTrainingStudent(TrainingBookManage trainingBookManage);

    public int modifyTrainingStudentByIdx(TrainingBookManage trainingBookManage);

    public List<TrainingBookManage> getExcelTrainingBookManage(TrainingBookManage trainingBookManage);
}
