package kr.go.gbelib.app.cms.module.trainingBelong;

import java.io.IOException;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import kr.go.gbelib.app.cms.module.dept.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;
import kr.co.whalesoft.framework.file.FileStorage;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class TrainingBelongService extends BaseService {
	
	@Autowired
	private TrainingBelongDao dao;
	
	@Autowired
	@Qualifier("trainingTeacherStorage")
	private FileStorage trainingTeacherStorage;

	/**
	 * @author ttkaz 2022. 7. 26.
	 */
	public int getTraingBelongListCount(TrainingBelong trainingBelong) {
		return dao.getTraingBelongListCount(trainingBelong);
	}

	public List<TrainingBelong> getTrainingBelongList(TrainingBelong trainingBelong) {
		return dao.getTrainingBelongList(trainingBelong);
	}

	public TrainingBelong getTrainingBelongOne(TrainingBelong trainingBelong) {
		return dao.getTrainingBelongOne(trainingBelong);
	}

	public int checkSameTrainingBelong(TrainingBelong trainingBelong) {
		return dao.checkSameTrainingBelong(trainingBelong);
	}

	public int addTrainingBelong(TrainingBelong trainingBelong) {
		return dao.addTrainingBelong(trainingBelong);
		
	}

	public int modifyTrainingBelong(TrainingBelong trainingBelong) {
		return dao.modifyTrainingBelong(trainingBelong);
		
	}

	public int deleteTrainingBelong(TrainingBelong trainingBelong) {
		return dao.deleteTrainingBelong(trainingBelong);
		
	}

	@Transactional
	public int excelUploadSave(MultipartFile mfile,TrainingBelong trainingBelong) throws BiffException, IOException {
		try {
			Workbook workbook = Workbook.getWorkbook(mfile.getInputStream());
			Sheet sheet = workbook.getSheet(0);

			int rowCount = sheet.getRows();

			for(int i = 1; i < rowCount; i++) {
				String name = (sheet.getCell(0, i).getContents().trim());
				String groupName = (sheet.getCell(1, i).getContents().trim());
				String zipcode = (sheet.getCell(2, i).getContents().trim());
				String addr = (sheet.getCell(3, i).getContents().trim());
				String useYN = (sheet.getCell(4, i).getContents().trim());
				String manageName = (sheet.getCell(5, i).getContents().trim());
				String managePhone = (sheet.getCell(6, i).getContents().trim());

				TrainingBelong t = new TrainingBelong();

				t.setAdd_id(trainingBelong.getAdd_id());
				t.setHomepage_id(trainingBelong.getHomepage_id());
				t.setBelong_name(name);
				t.setGroup_name(groupName);
				t.setZip_code(zipcode);
				t.setAddress(addr);
				t.setManager_name(manageName);
				t.setManager_phone(managePhone);
				t.setUse_yn(useYN);

				if(dao.checkSameTrainingBelong(t) > 0) {
					return 2;
				}

				dao.excelUploadSave(t);
			}

			workbook.close();

			return 1;
		} catch (Exception e) {
			log.error("엑셀다운로드 에러");
		}

		return 0;
	}

	public int deleteAlltrainingBelong(TrainingBelong trainingBelong) {
		return dao.deleteAlltrainingBelong(trainingBelong);
	}

    public int deleteEvery(TrainingBelong trainingBelong) {
		return dao.deleteEvery(trainingBelong);
    }
}