package kr.go.gbelib.app.cms.module.dept;

import java.io.IOException;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import kr.co.whalesoft.framework.utils.CalculateHashUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class DeptService extends BaseService {
	
	@Autowired
	private DeptDao dao;
	
	public List<Dept> getDept(Dept dept) {
		return dao.getDept(dept);
	}
	
	public int getDeptCount(Dept dept) {
		return dao.getDeptCount(dept);
	}
	
	public Dept getDeptOne(Dept dept) {
		return dao.getDeptOne(dept);
	}
	
	public int addDept(Dept dept) {
		return dao.addDept(dept);
	}
	
	public int updateDept(Dept dept) {
		return dao.updateDept(dept);
	}
	
	public String validCodeId(Dept dept) {
		return dao.validCodeId(dept);
	}

	@Transactional
	public int excelUploadSave(MultipartFile mfile) throws BiffException, IOException {
		try {
			Workbook workbook = Workbook.getWorkbook(mfile.getInputStream());
			Sheet sheet = workbook.getSheet(0);

			int rowCount = sheet.getRows();

			for(int i = 1; i < rowCount; i++) {
				String id = (sheet.getCell(0, i).getContents().trim());
				String name = (sheet.getCell(1, i).getContents().trim());
				String groupName = (sheet.getCell(2, i).getContents().trim());
				String zipcode = (sheet.getCell(3, i).getContents().trim());
				String addr = (sheet.getCell(4, i).getContents().trim());
				String useYN = (sheet.getCell(5, i).getContents().trim());
				String manageName = (sheet.getCell(6, i).getContents().trim());
				String managePhone = (sheet.getCell(7, i).getContents().trim());

				Dept dept = new Dept();


				dept.setCode_id(id);
				dept.setCode_name(name);
				dept.setGroup_name(groupName);
				dept.setZipcode(zipcode);
				dept.setAddress(addr);
				dept.setUse_yn(useYN);
				dept.setManager_name(manageName);
				dept.setManager_phone(managePhone);

				if(dao.checkCode(dept) > 0) {
					return 2;
				}

				dao.excelUploadSave(dept);
			}

			workbook.close();

			return 1;
		} catch (Exception e) {
			log.error("엑셀다운로드 에러");
		}

		return 0;
	}
}
