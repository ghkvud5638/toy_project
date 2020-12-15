package show.dao.face;

import java.util.List;

import show.dto.TB_BOOK;
import show.dto.TB_SEAT;
import show.dto.TB_SHOW;
import show.util.Paging;
import show.util.ShowlistPaging;
import show.util.showPaging;


public interface ShowDao {
	
	public int selectCntAll(showPaging curPage);
	
	/**
	 * 공연 전제 조회
	 * @return
	 */
	public List<TB_SHOW> selectShowAll(showPaging paging);
	
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

	/**
	 * book2 화면 띄우며 이미 예매된 좌석번호 리스트 조회
	 * @param tbBook
	 * @return
	 */
	public List<String> selectSeatList(TB_BOOK tbBook);

	/**
	 * 결제 시 status 컬럼 업데이트 
	 * @param book
	 */
	public void updateBookStatus(TB_BOOK book);

	/**
	 * 결제 시  payment_date 업데이트
	 * @param book
	 */
	public void updateBookPaymentDate(TB_BOOK book);
	
	public int selectCntAllJH(ShowlistPaging curPage);

	public List<TB_SHOW> checklistMap(ShowlistPaging paging);


	

}
