package kr.go.gbelib.app.cms.module.trainingCategoryTerms;

import java.util.List;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
public interface TrainingCategoryTermsDao {

	List<TrainingCategoryTerms> getTrainingCategoryTermsList(TrainingCategoryTerms trainingCategoryTerms);

	int getTrainingCategoryTermsCount(TrainingCategoryTerms trainingCategoryTerms);

	int modifyTrainingCategoryTerms(TrainingCategoryTerms trainingCategoryTerms);

	int addTrainingCategoryTerms(TrainingCategoryTerms trainingCategoryTerms);

	int deleteTrainingCategoryTerms(TrainingCategoryTerms trainingCategoryTerms);

}
