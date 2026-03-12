package kr.go.gbelib.app.cms.module.training.trainingBookQrManage;

import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrainingBookQrManageService extends BaseService {

    @Autowired
    private TrainingBookQrManageDao trainingBookQrManageDao;

    public int addTrainingBookQrManage(TrainingBookQrManage trainingBookQrManage) {
        return trainingBookQrManageDao.addTrainingBookQrManage(trainingBookQrManage);
    }

    public TrainingBookQrManage getTrainingBookQrManage(TrainingBookQrManage trainingBookQrManage) {
        return trainingBookQrManageDao.getTrainingBookQrManage(trainingBookQrManage);
    }

    public int modifyTrainingBookQrManage(TrainingBookQrManage trainingBookQrManage) {
        return trainingBookQrManageDao.modifyTrainingBookQrManage(trainingBookQrManage);
    }
}
