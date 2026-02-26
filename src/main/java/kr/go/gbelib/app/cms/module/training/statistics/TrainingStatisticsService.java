package kr.go.gbelib.app.cms.module.training.statistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;

@Service
public class TrainingStatisticsService extends BaseService {
	
	@Autowired
	private TrainingStatisticsDao dao;
	
	public List<TrainingStatistics> getTrainingStatistics(TrainingStatistics trainingStatistics) {
		return dao.getTrainingStatistics(trainingStatistics);
	}
	
}
