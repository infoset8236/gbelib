package kr.go.gbelib.app.cms.module.trainingCategoryTerms.trainingTerms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.app.cms.terms.Terms;
import kr.co.whalesoft.framework.base.BaseService;
import kr.co.whalesoft.framework.utils.PagingUtils;
import kr.go.gbelib.app.cms.module.trainingCategoryTerms.TrainingCategoryTermsDao;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
@Service
public class TrainingTermsService extends BaseService{

	@Autowired
	private TrainingTermsDao dao;

	public int getTrainingTermsListCount(TrainingTerms trainingTerms) {
		return dao.getTrainingTermsListCount(trainingTerms);
	}
	
	public List<TrainingTerms> getTrainingTermsList(TrainingTerms trainingTerms) {
		return dao.getTrainingTermsList(trainingTerms);
	}

	public TrainingTerms getTrainingTermsOne(TrainingTerms trainingTerms) {
		return dao.getTrainingTermsOne(trainingTerms);
	}
	
	public int addTrainingTerms(TrainingTerms trainingTerms) {
		return dao.addTrainingTerms(trainingTerms);
	}

	public int modifyTrainingTerms(TrainingTerms trainingTerms) {
		return dao.modifyTrainingTerms(trainingTerms);
	}

	public int deleteTrainingTerms(TrainingTerms trainingTerms) {
		return dao.deleteTrainingTerms(trainingTerms);
	}
	
}
