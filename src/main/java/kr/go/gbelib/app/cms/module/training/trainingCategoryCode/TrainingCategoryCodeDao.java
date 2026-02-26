package kr.go.gbelib.app.cms.module.training.trainingCategoryCode;

import java.util.List;

public interface TrainingCategoryCodeDao {
	
	/*** CODE_GROUP ***/
	public List<TrainingCategoryCode> getCodeGroup();
	
	public TrainingCategoryCode getCodeGroupOne(TrainingCategoryCode code);
	
	public int addCodeGroup(TrainingCategoryCode code);

	public int modifyCodeGroup(TrainingCategoryCode code);
	
	/*** CODE ***/
	public List<TrainingCategoryCode> getCodeUnion(String group_id);
	
	public List<TrainingCategoryCode> getCode(String group_id);
	
	public List<TrainingCategoryCode> getCode(TrainingCategoryCode code);
	
	public TrainingCategoryCode getCodeOne(TrainingCategoryCode code);
	
	public int addCode(TrainingCategoryCode code);
	
	public int modifyCode(TrainingCategoryCode code);
	
	public String getCodeName(String code_id);

	public TrainingCategoryCode getRootGroupOne(TrainingCategoryCode code);

	public int addRootGroupCode(TrainingCategoryCode code);

	public int modifyRootGroupCode(TrainingCategoryCode code);

	public List<TrainingCategoryCode> getRootGroup();

	public List<TrainingCategoryCode> getMiddleGroup();

	public TrainingCategoryCode getMiddleGroupOne(TrainingCategoryCode code);

	public List<TrainingCategoryCode> getCode(String group_id, String code_id);

}
