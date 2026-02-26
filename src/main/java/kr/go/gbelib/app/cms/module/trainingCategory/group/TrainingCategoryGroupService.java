package kr.go.gbelib.app.cms.module.trainingCategory.group;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;

@Service
public class TrainingCategoryGroupService extends BaseService {
	
	@Autowired
	private TrainingCategoryGroupDao categoryGroupDao;
	
	public List<TrainingCategoryGroup> getCategoryGroupListAll(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.getCategoryGroupListAll(categoryGroup);
	}
	 
	public List<TrainingCategoryGroup> getCategoryGroupList(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.getCategoryGroupList(categoryGroup);
	}
	
	public int getCategoryGroupListCount(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.getCategoryGroupListCount(categoryGroup);
	}
	
	public TrainingCategoryGroup getCategoryGroupOne(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.getCategoryGroupOne(categoryGroup);
	}
	
	public int addCategoryGroup(TrainingCategoryGroup categoryGroup) {
		if (StringUtils.equals(categoryGroup.getReq_limit_yn(), "N")) {
			categoryGroup.setReq_limit_count(0);
			categoryGroup.setReq_limit_type("1");
		}
		return categoryGroupDao.addCategoryGroup(categoryGroup);
	}
	
	public int modifyCategoryGroup(TrainingCategoryGroup categoryGroup) {
		if (StringUtils.equals(categoryGroup.getReq_limit_yn(), "N")) {
			categoryGroup.setReq_limit_count(0);
			categoryGroup.setReq_limit_type("1");
		}
		return categoryGroupDao.modifyCategoryGroup(categoryGroup);
	}
	
	public int deleteCategoryGroup(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.deleteCategoryGroup(categoryGroup);
	}
	
	public int getPrintMaxValue(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.getPrintMaxValue(categoryGroup);
	}
	
	public int checkCategoryInGroup(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.checkCategoryInGroup(categoryGroup);
	}

	public TrainingCategoryGroup getReqLimitTotal(TrainingCategoryGroup categoryGroup) {
		return categoryGroupDao.getReqLimitTotal(categoryGroup);
	}
}