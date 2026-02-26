package kr.go.gbelib.app.cms.module.trainingBook;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.whalesoft.framework.base.BaseService;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.student2.Student2;
import kr.go.gbelib.app.cms.module.training.student2.Student2Service;

@Service
public class TrainingBookService extends BaseService {
	
	@Autowired
	private TrainingBookDao dao;
	
	@Autowired
	private Student2Service studentService;

	public List<TrainingBook> getTrainingBookList(TrainingBook trainingBook) {
		return dao.getTrainingBookList(trainingBook);
	}
	
	public int addTrainingBook(TrainingBook trainingBook) {
		return dao.addTrainingBook(trainingBook);
	}
	
	public int checkTrainingBookStudentByDate(TrainingBook trainingBook) {
		return dao.checkTrainingBookStudentByDate(trainingBook);
	}
	
	public int modifyTrainingBook(TrainingBook trainingBook) {
		return dao.modifyTrainingBook(trainingBook);
	}
	
	public int mergeTrainingBook(TrainingBook trainingBook) {
		return dao.mergeTrainingBook(trainingBook);
	}
	
	
	
	
	
	
	public List<TrainingBook> getTrainingBookDateList(TrainingBook trainingBook) {
		return dao.getTrainingBookDateList(trainingBook);
	}
	
	public List<TrainingBook> getTrainingBookDetailByDate(TrainingBook trainingBook) {
		return dao.getTrainingBookDetailByDate(trainingBook);
	}
	
	public int addTrainingBookTime(TrainingBook trainingBook) {
		return dao.addTrainingBookTime(trainingBook);
	}
	
	public int deleteTrainingBookDetail(TrainingBook trainingBook) {
		return dao.deleteTrainingBookDetail(trainingBook);
	}
	
	@Transactional
	public int addTrainingBookDetail(TrainingBook trainingBook) {
		if (trainingBook.getStudentList() != null || trainingBook.getStudentList().length > 0) {
			int index = 0;
			for (String info : trainingBook.getStudentList()) {
				trainingBook.setStudent_idx(Integer.parseInt(info.split("//")[0]));
				trainingBook.setStatus(info.split("//")[1]);
				trainingBook.setPay1(trainingBook.getPay1List()[index]);
				trainingBook.setPay2(trainingBook.getPay2List()[index]);
				trainingBook.setPay3(trainingBook.getPay3List()[index]);
				dao.addTrainingBookDetail(trainingBook);
				index += 1;
			}
		}
		
		return 1;
	}
	
	@Transactional
	public int deleteTrainingBookTimeByTraining(Training training) {
		List<TrainingBook> trainingBookList = dao.getTrainingBookDateList(new TrainingBook(training.getHomepage_id(), training.getGroup_idx(), training.getCategory_idx(), training.getTraining_idx()));
		
		for (TrainingBook info : trainingBookList) {
			dao.deleteTrainingBookTime(info.getTraining_book_time_idx());	// 출석부 시간 삭제
			info.setStudent_idx(0);
			dao.deleteTrainingBookDetail(info); // 출석기록 삭제
		}
		
		return 1;
	}
	
	
	// 출석부 출력
	public List<List<String>> getTrainingBookViewInfo(TrainingBook trainingBook) {
		List<List<String>> list = new ArrayList<List<String>> ();
		
		List<Student2> studentList 		= studentService.getStudent2ListAll(new Student2(trainingBook.getHomepage_id(), trainingBook.getGroup_idx(), trainingBook.getCategory_idx(), trainingBook.getTraining_idx(), "1"));
		List<TrainingBook> dateList 		= dao.getTrainingBookDateList(trainingBook);
		List<TrainingBook> trainingBookInfo 	= dao.getTrainingBookViewInfo(trainingBook);
		
		Boolean isFirst = true;
		for (Student2 studentInfo : studentList) {
			if (isFirst) {
				List<String> firstList = new ArrayList<String>();
				firstList.add("이름");
				for (TrainingBook dateInfo : dateList) {
					firstList.add(dateInfo.getTraining_date());
				}
				list.add(firstList);
				isFirst = false;
			}
			
			int student_idx = studentInfo.getStudent_idx();
			List<String> attendInfoList = new ArrayList<String>();
			attendInfoList.add(studentInfo.getStudent_name());
			for (TrainingBook dateInfo : dateList) {
				int training_book_time_idx = dateInfo.getTraining_book_time_idx();
				String status = null;
				String pay1 = "";
				String pay2 = "";
				String pay3 = "";
				for (TrainingBook attendInfo : trainingBookInfo) {
					if (attendInfo.getStudent_idx() == student_idx && attendInfo.getTraining_book_time_idx() == training_book_time_idx) {
						status = attendInfo.getStatus();
						pay1 = attendInfo.getPay1();
						pay2 = attendInfo.getPay2();
						pay3 = attendInfo.getPay3();
						break;
					}
				}
				attendInfoList.add(status);
				attendInfoList.add(pay1);
				attendInfoList.add(pay2);
				attendInfoList.add(pay3);
			}
			list.add(attendInfoList);
		}
		
		return list;
	}
	
	public int deleteTrainingBook(TrainingBook trainingBook) {
		return dao.deleteTrainingBook(trainingBook);
	}

	public int modifyStudentPay(TrainingBook trainingBook) {
		return dao.modifyStudentPay(trainingBook);
	}
}