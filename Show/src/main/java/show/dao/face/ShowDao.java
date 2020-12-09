package show.dao.face;

import java.util.List;

import show.dto.TB_BOOK;
import show.dto.TB_SEAT;
import show.dto.TB_SHOW;


public interface ShowDao {
	/**
	 * 공연 전제 조회
	 * @return
	 */
	public List<TB_SHOW> selectShowAll();
	
	/**
	 * 공연 상세 조회
	 * @param show_id 공연 id
	 * @return
	 */
	public TB_SHOW selectShowById(String show_id);

	/**
	 * 공연 잔여석 조회
	 * @param show_id
	 * @return
	 */
	public TB_SEAT selectSeatCnt(String show_id);

	/**
	 *  예매
	 * @param book
	 */
	public void insertBook(TB_BOOK book);

	/**
	 * book3 페이지에 띄울 예매 데이터 조회
	 * @param book
	 * @return
	 */
	public List<TB_BOOK> selectBookList(TB_BOOK book);

	/**
	 * book3 이전 단계, 선택된 예매 정보 지우기
	 * @param deleteInfo
	 */
	public void deleteBack(TB_BOOK deleteInfo);

}
