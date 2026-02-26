/**
 *
 */
package kr.go.gbelib.app.module.bookBasket;

import java.util.List;

/**
 * @author whaleesoft YONGJU 2020. 4. 3.
 *
 */
public interface BookBasketDao {


	/**
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 * @return
	 */
	public int getBookBasketCount(BookBasket bookBasket);

	/**
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 * @return
	 */
	public List<BookBasket> getBookBasketList(BookBasket bookBasket);

	/**
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 * @return
	 */
	public int addBookBasket(BookBasket bookBasket);

	/**
	 * @author whalesoft YONGJU 2020. 4. 3.
	 * @param bookBasket
	 * @return
	 */
	public int deleteBookBasket(BookBasket bookBasket);
	
	/**
	 * @author whalesoft 정쥰 2021. 12. 02.
	 * @param bookBasket
	 * @return
	 */
	public int getBookCheck(BookBasket bookBasket);
}
