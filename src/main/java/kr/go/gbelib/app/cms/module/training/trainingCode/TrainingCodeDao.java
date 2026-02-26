package kr.go.gbelib.app.cms.module.training.trainingCode;

import java.util.List;

public interface TrainingCodeDao {

	public List<TrainingCode> getLargeCodeList();

	public List<TrainingCode> getMidCodeList(TrainingCode trainingCode);

	public List<TrainingCode> getSmallCodeList(TrainingCode trainingCode);

	public int addTrainingCode(TrainingCode trainingCode);

	public int modifyTrainingCode(TrainingCode trainingCode);

	public int deleteTrainingCode(TrainingCode trainingCode);

	public int modifyPrintSeq(TrainingCode code);

	public int getCodeInfo(TrainingCode trainingCode);
	
}
