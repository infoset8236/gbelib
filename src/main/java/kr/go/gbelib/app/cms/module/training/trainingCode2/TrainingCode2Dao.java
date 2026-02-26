package kr.go.gbelib.app.cms.module.training.trainingCode2;

import java.util.List;

public interface TrainingCode2Dao  {

	public int getCategoryListCnt(TrainingCode2 cate);
	
	public List<TrainingCode2> getCategoryList(TrainingCode2 cate);
	
	public List<TrainingCode2> getCategoryWithCntList(TrainingCode2 cate);
	
	public TrainingCode2 getCategoryInfo(TrainingCode2 cate);
	
	public List<TrainingCode2> getSubcategories(TrainingCode2 cate);
	
	public int subCategoryCheck(TrainingCode2 cate);
	
	public int nameDupCheck(TrainingCode2 cate);
	
	public Integer getDepth(TrainingCode2 cate);
	
	public int getMaxDisplaySeq(TrainingCode2 cate);
	
	public int addCategory(TrainingCode2 cate);
	
	public int modifyCategory(TrainingCode2 cate);
	
	public int deleteCategory(TrainingCode2 cate);
	
	public int forceDeleteCategory(TrainingCode2 cate);
	
	public int modifyDisplaySeq(TrainingCode2 cate);
	
}