package kr.go.gbelib.app.cms.module.trainingCategoryTerms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;
import kr.go.gbelib.app.cms.module.category.Category;
import kr.go.gbelib.app.cms.module.category.CategoryService;
import kr.go.gbelib.app.cms.module.category.group.CategoryGroup;
import kr.go.gbelib.app.cms.module.category.group.CategoryGroupService;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategory;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategoryService;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;

/**
 * @author ttkaz
 * 2022. 10. 25.
 *
 */
@Service
public class TrainingCategoryTermsService extends BaseService{

	@Autowired
	private TrainingCategoryTermsDao dao;
	
	@Autowired
	private TrainingCode2Service code2Service;
	
	@Autowired
	private TrainingCategoryGroupService trainingCategoryGroupService;
	
	@Autowired
	private TrainingCategoryService trainingCategoryService;
	
	public List<String> getCategoryList(TrainingCode2 cate){ 
		List<TrainingCode2> largeCodeList = new ArrayList<TrainingCode2>();				
		TrainingCategoryGroup categoryGroup = new TrainingCategoryGroup();		
		TrainingCategory category = new TrainingCategory();
		List<String> codeList = new ArrayList<String>();
		largeCodeList = code2Service.getSubcategories(cate); //대분류 가져오기				 				
		String cateCode = "";
		String cateCode1 = "";
		String cateCode2 = "";
		
		List<TrainingCategoryGroup> groupIdxList = new ArrayList<TrainingCategoryGroup>();
		List<TrainingCategory> categoryList = new ArrayList<TrainingCategory>();
		categoryGroup.setHomepage_id(cate.getHomepage_id());
		category.setHomepage_id(cate.getHomepage_id());
		for(int j = 0; j < largeCodeList.size(); j++) { //대분류 카운트 만큼 중분류 찾기
			cateCode = "";
			cateCode1 = "";
			cateCode2 = "";
			categoryGroup.setLarge_category_idx(largeCodeList.get(j).getTraining_code());
			groupIdxList =  trainingCategoryGroupService.getCategoryGroupListAll(categoryGroup);			 
			cateCode = Integer.toString(largeCodeList.get(j).getTraining_code())+":"+largeCodeList.get(j).getCode_name();
//			codeList.add(cateCode);
			for(int k = 0; k < groupIdxList.size(); k++) { //중분류 카운트 만큼 소분류 찾기
				cateCode1 = cateCode;
				cateCode1 = cateCode + "//" + Integer.toString(groupIdxList.get(k).getGroup_idx())+":"+groupIdxList.get(k).getGroup_name();				
				codeList.add(cateCode1);
				category.setLarge_category_idx(groupIdxList.get(k).getLarge_category_idx());
				category.setGroup_idx(groupIdxList.get(k).getGroup_idx());
				categoryList =  trainingCategoryService.getCategoryList(category);
				for(int i = 0 ; i < categoryList.size(); i++) {					
					cateCode2 = cateCode1;
					cateCode2 = cateCode2 + "//" +Integer.toString(categoryList.get(i).getCategory_idx())+":"+categoryList.get(i).getCategory_name();					
					codeList.add(cateCode2);
				}
			}
		
		}		
		return codeList;
	}

	public List<TrainingCategoryTerms> getTrainingCategoryTermsList(TrainingCategoryTerms trainingCategoryTerms) {
		return dao.getTrainingCategoryTermsList(trainingCategoryTerms);
	}

	public int getTrainingCategoryTermsCount(TrainingCategoryTerms trainingCategoryTerms) {
		return dao.getTrainingCategoryTermsCount(trainingCategoryTerms);
	}

	public int modifyTrainingCategoryTerms(TrainingCategoryTerms trainingCategoryTerms) {
		return dao.modifyTrainingCategoryTerms(trainingCategoryTerms);
	}

	public int addTrainingCategoryTerms(TrainingCategoryTerms trainingCategoryTerms) {
		return dao.addTrainingCategoryTerms(trainingCategoryTerms);
		
	}

	public int deleteTrainingCategoryTerms(TrainingCategoryTerms trainingCategoryTerms) {
		return dao.deleteTrainingCategoryTerms(trainingCategoryTerms);
	}
		
		
}
	
