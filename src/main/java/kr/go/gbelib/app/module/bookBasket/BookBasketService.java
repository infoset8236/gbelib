/**
 *
 */
package kr.go.gbelib.app.module.bookBasket;

import kr.co.whalesoft.framework.base.BaseService;
import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author whaleesoft YONGJU 2020. 4. 3.
 *
 */
@Service
public class BookBasketService extends BaseService {

	@Autowired
	private BookBasketDao dao;

	/**
	 * 보관함 목록을 위한 카운트
	 *
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 * @return
	 */
	public int getBookBasketCount(BookBasket bookBasket) {
		return dao.getBookBasketCount(bookBasket);
	}

	/**
	 * 보관함 목록
	 *
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 * @return
	 */
	public List<BookBasket> getBookBasketList(BookBasket bookBasket) {
		return dao.getBookBasketList(bookBasket);
	}

	/**
	 * 보관함 등록 KLAS에서 상세 정보를 가져와 등록한다.
	 *
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 * @param librarySearch
	 * @return
	 */
	public int addBookBasket(BookBasket bookBasket) {

		LibrarySearch l = new LibrarySearch();
//		l.setManageCode(bookBasket.getManage_code());
//		l.setRegNo(bookBasket.getReg_no());
		Map<String, Object> bookMap = new HashMap<String, Object>();
		bookMap = null;
//				LibSearchAPI.getBookInfo(l);
		List<Map<String, Object>> list = null; 
//				LibSearchAPI.getListData(bookMap);
//		Map<String, Object> map = list.get(0);

//		bookBasket.setManage_code(String.valueOf(map.get("MANAGE_CODE")));// 도서관
//		bookBasket.setLib_name(String.valueOf(map.get("LIB_NAME")));// 도서관
//		bookBasket.setTitle(String.valueOf(map.get("TITLE_INFO")));// 제목
//		bookBasket.setMedia_name(String.valueOf(map.get("MEDIA_NAME")));// 매체구분
//		bookBasket.setReg_no(String.valueOf(map.get("REG_NO")));// 등록번호
//		bookBasket.setCall_no(String.valueOf(map.get("CALL_NO")));// 청구기호

		return dao.addBookBasket(bookBasket);
	}

	/**
	 * 보관함 삭제
	 *
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 */
	public int deleteBookBasket(BookBasket bookBasket) {
		return dao.deleteBookBasket(bookBasket);
	}
	
	/**
	 * @author whalesoft 정쥰 2021. 12. 02.
	 * @param bookBasket
	 * @return
	 */
	public int getBookCheck(BookBasket bookBasket) {
		return dao.getBookCheck(bookBasket);
	}
}
