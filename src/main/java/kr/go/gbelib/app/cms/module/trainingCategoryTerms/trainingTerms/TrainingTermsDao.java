package kr.go.gbelib.app.cms.module.trainingCategoryTerms.trainingTerms;

import java.util.List;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
public interface TrainingTermsDao {

	int getTrainingTermsListCount(TrainingTerms trainingTerms);

	List<TrainingTerms> getTrainingTermsList(TrainingTerms trainingTerms);

	TrainingTerms getTrainingTermsOne(TrainingTerms trainingTerms);

	int addTrainingTerms(TrainingTerms trainingTerms);

	int modifyTrainingTerms(TrainingTerms trainingTerms);

	int deleteTrainingTerms(TrainingTerms trainingTerms);

}
