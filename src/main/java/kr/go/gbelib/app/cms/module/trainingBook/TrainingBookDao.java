package kr.go.gbelib.app.cms.module.trainingBook;

import java.util.List;


public interface TrainingBookDao  {

	public List<TrainingBook> getTrainingBookDateList(TrainingBook trainingBook);
	
	public List<TrainingBook> getTrainingBookDetailByDate(TrainingBook trainingBook);
	
	public int addTrainingBookTime(TrainingBook trainingBook);
	
	public int deleteTrainingBookTime(int training_book_time_idx);
	
	public int deleteTrainingBookDetail(TrainingBook trainingBook);
	
	public int addTrainingBookDetail(TrainingBook trainingBook);
	
	public List<TrainingBook> getTrainingBookViewInfo(TrainingBook trainingBook);

	public List<TrainingBook> getTrainingBookList(TrainingBook trainingBook);
	
	public int addTrainingBook(TrainingBook trainingBook);
	
	public int checkTrainingBookStudentByDate(TrainingBook trainingBook);
	
	public int modifyTrainingBook(TrainingBook trainingBook);
	
	public int mergeTrainingBook(TrainingBook trainingBook);

	public int deleteTrainingBook(TrainingBook trainingBook);

	public int modifyStudentPay(TrainingBook trainingBook);
}