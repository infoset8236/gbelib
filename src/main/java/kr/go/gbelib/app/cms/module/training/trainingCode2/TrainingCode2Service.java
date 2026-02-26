package kr.go.gbelib.app.cms.module.training.trainingCode2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.whalesoft.framework.base.BaseService;

@Service
public class TrainingCode2Service extends BaseService {
	
	@Autowired
	private TrainingCode2Dao dao;
	
	public int getCategoryListCnt(TrainingCode2 cate) {
		return dao.getCategoryListCnt(cate);
	}
	
	public List<TrainingCode2> getCategoryList(TrainingCode2 cate) {
		return dao.getCategoryList(cate);
	}
	
	public List<TrainingCode2> getCategoryWithCntList(TrainingCode2 cate) {
		return dao.getCategoryWithCntList(cate);
	}
	
	public TrainingCode2 getCategoryInfo(TrainingCode2 cate) {
		return dao.getCategoryInfo(cate);
	}
	
	public List<TrainingCode2> getSubcategories(TrainingCode2 cate) {
		return dao.getSubcategories(cate);
	}
	
	public int subCategoryCheck(TrainingCode2 cate) {
		return dao.subCategoryCheck(cate);
	}
	
	public int nameDupCheck(TrainingCode2 cate) {
		return dao.nameDupCheck(cate);
	}
	
	@Transactional
	public int addCategory(TrainingCode2 cate) {
		
		if(nameDupCheck(cate) > 0) {
			return 0;
		}
		
//		Integer depth = dao.getDepth(cate);
		
//		cate.setDepth(depth == null ? 0 : depth);
		cate.setDisplay_seq(dao.getMaxDisplaySeq(cate));
		
		return dao.addCategory(cate);
	}
	
	@Transactional
	public int modifyCategory(TrainingCode2 cate) {

		if(nameDupCheck(cate) > 0) {
			return 0;
		}
		
		return dao.modifyCategory(cate);
	}
	
	@Transactional
	public int deleteCategory(TrainingCode2 cate) {
		
		if(dao.subCategoryCheck(cate) > 0) {
			return 0;
		}
		
		if(getCategoryInfo(cate) ==  null) {
			return 0;
		}
		
		return dao.deleteCategory(cate);
	}
	
	@Transactional
	public int forceDeleteCategory(TrainingCode2 cate) {
		
		if(getCategoryInfo(cate) ==  null) {
			return 0;
		}
		
		return dao.forceDeleteCategory(cate);
	}
	
	@Transactional
	public int saveCategoryList(TrainingCode2[] cateList) {
		
		int result = 0;
		
		for(TrainingCode2 cate: cateList) {
			if(getCategoryInfo(cate) == null) {
				throw new RuntimeException();
			}

			result += dao.modifyDisplaySeq(cate);
		}
		
		return result;
	}

	
}