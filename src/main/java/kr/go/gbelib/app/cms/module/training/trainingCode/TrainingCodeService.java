package kr.go.gbelib.app.cms.module.training.trainingCode;

import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.co.whalesoft.framework.base.BaseService;

@Service
public class TrainingCodeService extends BaseService {

	@Autowired
	private TrainingCodeDao dao;

	public List<TrainingCode> getLargeCodeList() {
		return dao.getLargeCodeList();
	}
	
	public List<TrainingCode> getMidCodeList(TrainingCode trainingCode) {
		return dao.getMidCodeList(trainingCode);
	}
	
	public List<TrainingCode> getSmallCodeList(TrainingCode trainingCode) {
		return dao.getSmallCodeList(trainingCode);
	}

	public int getCodeInfo(TrainingCode trainingCode) {
		return dao.getCodeInfo(trainingCode);
	}
	public int addTrainingCode(TrainingCode trainingCode) {
		if (StringUtils.equals(trainingCode.getLarge_code(), "0")) {
			trainingCode.setLarge_code(trainingCode.getTempCode());
			trainingCode.setMid_code("--");
			trainingCode.setSmall_code("--");
		} else if (StringUtils.equals(trainingCode.getMid_code(), "0")) {
			trainingCode.setMid_code(trainingCode.getTempCode());
			trainingCode.setSmall_code("--");
		} else if (StringUtils.equals(trainingCode.getSmall_code(), "0")) {
			trainingCode.setSmall_code(trainingCode.getTempCode());
		}
		
		return dao.addTrainingCode(trainingCode);
			
	}

	public int modifyTrainingCode(TrainingCode trainingCode) {
		return dao.modifyTrainingCode(trainingCode);
	}

	public int deleteTrainingCode(TrainingCode trainingCode) {
		return dao.deleteTrainingCode(trainingCode);
	}

	@Transactional
	public int saveCodeList(TrainingCode[] codeList, String cud_id) {
		int result = 0;
		
		for(TrainingCode code: codeList) {
//			if(getCategoryInfo(code) == null) {
//				throw new RuntimeException();
//			}
			code.setCud_id(cud_id);
			result += dao.modifyPrintSeq(code);
		}
		
		return result;		
	}
	
}
