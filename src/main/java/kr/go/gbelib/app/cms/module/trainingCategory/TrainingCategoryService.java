package kr.go.gbelib.app.cms.module.trainingCategory;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;

@Service
public class TrainingCategoryService extends BaseService {
	
	@Autowired
	private TrainingCategoryDao categoryDao;
	
	public List<TrainingCategory> getCategoryListAll(TrainingCategory category) {
		return categoryDao.getCategoryListAll(category);
	}
	 
	public List<TrainingCategory> getCategoryList(TrainingCategory category) {
		return categoryDao.getCategoryList(category);
	}
	
	public int getCategoryListCount(TrainingCategory category) {
		return categoryDao.getCategoryListCount(category);
	}
	
	public TrainingCategory getCategoryOne(TrainingCategory category) {
		return categoryDao.getCategoryOne(category);
	}

	
	public int addCategory(TrainingCategory category) {
		if (StringUtils.equals(category.getReq_limit_yn(), "N")) {
			category.setReq_limit_count(0);
			category.setReq_limit_type("1");
		}
		return categoryDao.addCategory(category);
	}
	
	public int modifyCategory(TrainingCategory category) {
		if (StringUtils.equals(category.getReq_limit_yn(), "N")) {
			category.setReq_limit_count(0);
			category.setReq_limit_type("1");
		}
		return categoryDao.modifyCategory(category);
	}
	
	public int deleteCategory(TrainingCategory category) {
		return categoryDao.deleteCategory(category);
	}
	
	public int getPrintMaxValue(TrainingCategory category) {
		return categoryDao.getPrintMaxValue(category);
	}
	
	public int checkTrainingInCategory(TrainingCategory category) {
		return categoryDao.checkTrainingInCategory(category);
	}

	public TrainingCategory getReqLimitTotal(TrainingCategory category) {
		return categoryDao.getReqLimitTotal(category);
	}
}