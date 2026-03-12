package kr.go.gbelib.app.cms.module.teach.teachBookManage;

import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeachBookManageService extends BaseService {

    @Autowired
    private TeachBookManageDao trainingBookManageDao;

    public int addTeachBookManage(TeachBookManage teachBookManage) {
        return trainingBookManageDao.addTeachBookManage(teachBookManage);
    }

    public List<TeachBookManage> getTeachBookManage(TeachBookManage teachBookManage) {
        return trainingBookManageDao.getTeachBookManage(teachBookManage);
    }

    public int getTeachBookManageCount(TeachBookManage teachBookManage) {
        return trainingBookManageDao.getTeachBookManageCount(teachBookManage);
    }

    public TeachBookManage checkTeachStudent(TeachBookManage trainingBookManage) {
        return trainingBookManageDao.checkTeachStudent(trainingBookManage);
    }

    public int checkTeachStudentCount(TeachBookManage trainingBookManage) {
        return trainingBookManageDao.checkTeachStudentCount(trainingBookManage);
    }

    public int modifyTeachStudent(TeachBookManage trainingBookManage) {
        return trainingBookManageDao.modifyTeachStudent(trainingBookManage);
    }

    public int modifyTeachStudentByIdx(TeachBookManage teachBookManage) {
        return trainingBookManageDao.modifyTeachStudentByIdx(teachBookManage);
    }

    public List<TeachBookManage> getExcelTeachBookManage(TeachBookManage trainingBookManage) {
        return trainingBookManageDao.getExcelTeachBookManage(trainingBookManage);
    }
}
