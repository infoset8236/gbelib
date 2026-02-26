package kr.go.gbelib.app.cms.module.trainingCategory;

import java.util.List;

public interface TrainingCategoryDao  {

	public List<TrainingCategory> getCategoryList(TrainingCategory category);
	
	public List<TrainingCategory> getCategoryListAll(TrainingCategory category);
	
	public int getCategoryListCount(TrainingCategory category);
	
	public TrainingCategory getCategoryOne(TrainingCategory category);
	
	public int addCategory(TrainingCategory category);
	
	public int modifyCategory(TrainingCategory category);
	
	public int deleteCategory(TrainingCategory category);
	
	public List<TrainingCategory> getCategoryListByType(TrainingCategory category);
	
	public int getPrintMaxValue(TrainingCategory category);
	
	public int checkTrainingInCategory(TrainingCategory category);

	public TrainingCategory getReqLimitTotal(TrainingCategory category);
}