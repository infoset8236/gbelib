package kr.go.gbelib.app.cms.module.training.trainingBookManage;

import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrainingBookManageService extends BaseService {

    @Autowired
    private TrainingBookManageDao trainingBookManageDao;

    public int addTrainingBookManage(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.addTrainingBookManage(trainingBookManage);
    }

    public List<TrainingBookManage> getTrainingBookManage(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.getTrainingBookManage(trainingBookManage);
    }

    public int getTrainingBookManageCount(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.getTrainingBookManageCount(trainingBookManage);
    }

    public TrainingBookManage checkTrainingStudent(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.checkTrainingStudent(trainingBookManage);
    }

    public int checkTrainingStudentCount(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.checkTrainingStudentCount(trainingBookManage);
    }

    public int modifyTrainingStudent(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.modifyTrainingStudent(trainingBookManage);
    }

    public int modifyTrainingStudentByIdx(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.modifyTrainingStudentByIdx(trainingBookManage);
    }

    public List<TrainingBookManage> getExcelTrainingBookManage(TrainingBookManage trainingBookManage) {
        return trainingBookManageDao.getExcelTrainingBookManage(trainingBookManage);
    }
}
