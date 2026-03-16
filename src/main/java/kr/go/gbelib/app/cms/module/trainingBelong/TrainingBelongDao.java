package kr.go.gbelib.app.cms.module.trainingBelong;

import kr.go.gbelib.app.cms.module.dept.Dept;

import java.util.List;

public interface TrainingBelongDao  {

	/**
	 * @author ttkaz 2022. 7. 26.
	 */
	int getTraingBelongListCount(TrainingBelong trainingBelong);

	List<TrainingBelong> getTrainingBelongList(TrainingBelong trainingBelong);

	TrainingBelong getTrainingBelongOne(TrainingBelong trainingBelong);

	int checkSameTrainingBelong(TrainingBelong trainingBelong);

	int addTrainingBelong(TrainingBelong trainingBelong);

	int modifyTrainingBelong(TrainingBelong trainingBelong);

	int deleteTrainingBelong(TrainingBelong trainingBelong);

	public int excelUploadSave(TrainingBelong trainingBelong);
	public int checkCode(TrainingBelong trainingBelong);

	int deleteAlltrainingBelong(TrainingBelong trainingBelong);

	int deleteEvery(TrainingBelong trainingBelong);
}