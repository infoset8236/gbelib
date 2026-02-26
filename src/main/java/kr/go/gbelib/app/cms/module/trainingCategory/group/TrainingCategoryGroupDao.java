package kr.go.gbelib.app.cms.module.trainingCategory.group;

import java.util.List;

public interface TrainingCategoryGroupDao  {

	public List<TrainingCategoryGroup> getCategoryGroupList(TrainingCategoryGroup categoryGroup);
	
	public List<TrainingCategoryGroup> getCategoryGroupListAll(TrainingCategoryGroup categoryGroup);
	
	public int getCategoryGroupListCount(TrainingCategoryGroup categoryGroup);
	
	public TrainingCategoryGroup getCategoryGroupOne(TrainingCategoryGroup categoryGroup);
	
	public int addCategoryGroup(TrainingCategoryGroup categoryGroup);
	
	public int modifyCategoryGroup(TrainingCategoryGroup categoryGroup);
	
	public int deleteCategoryGroup(TrainingCategoryGroup categoryGroup);
	
	public int getPrintMaxValue(TrainingCategoryGroup categoryGroup);
	
	public int checkCategoryInGroup(TrainingCategoryGroup categoryGroup);

	public TrainingCategoryGroup getReqLimitTotal(TrainingCategoryGroup categoryGroup);
}