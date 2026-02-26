package kr.go.gbelib.app.cms.module.training.trainingCategoryCode;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.co.whalesoft.framework.base.BaseService;

@Service
public class TrainingCategoryCodeService extends BaseService {

	@Autowired
	private TrainingCategoryCodeDao dao;
	
	/*** CODE_GROUP ***/
	public List<TrainingCategoryCode> getCodeGroup() {
		return dao.getCodeGroup();
	}
	
	public TrainingCategoryCode getCodeGroupOne(TrainingCategoryCode code) {
		return dao.getCodeGroupOne(code);
	}
	
	public int addCodeGroup(TrainingCategoryCode code) {
		return dao.addCodeGroup(code);
	}
	
	public int modifyCodeGroup(TrainingCategoryCode code) {
		return dao.modifyCodeGroup(code);
	}
	
	/*** CODE ***/
	public List<TrainingCategoryCode> getCodeUnion(String group_id) {
		return dao.getCodeUnion(group_id);
	}
	
	public List<TrainingCategoryCode> getCode(String group_id) {
		return dao.getCode(group_id);
	}
	
	public List<TrainingCategoryCode> getCode(String group_id, String code_id) {
		TrainingCategoryCode code = new TrainingCategoryCode();
		code.setTraining_group_id(group_id);
		code.setTraining_code_id(code_id);
		return dao.getCode(code);
	}
	
	public String getCodeToString(String group_id) {
		List<TrainingCategoryCode> codeList = dao.getCode(group_id);
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; i < codeList.size(); i++) {
			sb.append(codeList.get(i).getTraining_code_id());
			sb.append(":");
			sb.append(codeList.get(i).getTraining_code_name());
			if (i != codeList.size()-1) {
				sb.append(";");
			}
		}
		return sb.toString();
	}
	
	public List<TrainingCategoryCode> getCode(TrainingCategoryCode code) {
		return dao.getCode(code);
	}
	
	public TrainingCategoryCode getCodeOne(TrainingCategoryCode code) {
		return dao.getCodeOne(code);
	}
	
	@Transactional
	public int addCode(TrainingCategoryCode code) {
		return dao.addCode(code);
	}
	
	@Transactional
	public int modifyCode(TrainingCategoryCode code) {
		return dao.modifyCode(code);
	}
	
	public TrainingCategoryCode getRootGroupOne(TrainingCategoryCode code) {
		return dao.getRootGroupOne(code);
	}

	public int addRootGroupCode(TrainingCategoryCode code) {
		return dao.addRootGroupCode(code);
	}

	public int modifyRootGroupCode(TrainingCategoryCode code) {
		return dao.modifyRootGroupCode(code);
	}

	public List<TrainingCategoryCode> getRootGroup() {
		return dao.getRootGroup();
	}

	public List<TrainingCategoryCode> getMiddleGroup() {
		return dao.getMiddleGroup();
	}
	
	public TrainingCategoryCode getMiddleGroupOne(TrainingCategoryCode code) {
		return dao.getMiddleGroupOne(code);
	}
	
	public String getCodeName(String code_id) {
		return dao.getCodeName(code_id);
	}
}