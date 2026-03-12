package kr.go.gbelib.app.cms.module.teach.teachBookManage;

import java.util.List;

public interface TeachBookManageDao {

    public int addTeachBookManage(TeachBookManage teachBookManage);

    public List<TeachBookManage> getTeachBookManage(TeachBookManage teachBookManage);

    public int getTeachBookManageCount(TeachBookManage teachBookManage);

    public int checkTeachBookManage(TeachBookManage teachBookManage);

    public TeachBookManage checkTeachStudent(TeachBookManage teachBookManage);

    public int checkTeachStudentCount(TeachBookManage teachBookManage);

    public int modifyTeachStudent(TeachBookManage teachBookManage);

    public int modifyTeachStudentByIdx(TeachBookManage teachBookManage);

    public List<TeachBookManage> getExcelTeachBookManage(TeachBookManage teachBookManage);
}
