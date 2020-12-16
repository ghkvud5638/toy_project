package show.service.face;

import java.util.HashMap;
import java.util.List;



import show.dto.TB_BOOK;
import show.dto.TB_SEAT;
import show.dto.TB_SHOW;
import show.util.ShowlistPaging;
import show.util.showPaging;

public interface ShowService {

	
	
	
	
	public showPaging getPaging(showPaging curPage);
	
	
	public ShowlistPaging getPagingJH(ShowlistPaging curPage);

	
	public List<TB_SHOW> checklist(ShowlistPaging paging);
	
	/**
	* 공연 전체 리스트 조회
	 * @return
	 */
	public List<TB_SHOW> getShowList(showPaging paging);

	/**
	 * 공연 상세 정보 조회 
	 * @param show_id 공연 id
	 * @return	
	 */
	public TB_SHOW getShowDetail(String show_id);

	/**
	 * 좌석수 구하기
	 * @param show_id
	 * @return
	 */
	public TB_SEAT getSeatCnt(String show_id);

	/**
	 * 예매
	 * @param book 선택한 예약 정보
	 */
	public void book(TB_BOOK book);

	/**
	 * book2에서 다음버튼을 누르면 db에 저장되고 일단 그것들을 다시 조회. (뒤로 갈 경우 delete 해주기) 
	 * @param book
	 */
	public List<TB_BOOK> selectBook(TB_BOOK book);
	
	/**
	 * book3 이전 단계 가기
	 * @param deleteInfo
	 */
	public void delete(TB_BOOK deleteInfo);

	/**
	 * book2 페이지 로드하면서 이미 예약된 좌석번호 리스트 조회
	 * @param tbBook
	 * @return
	 */
	public List<String> getUnavaliableSeatList(TB_BOOK tbBook);

	/**
	 * 결제 시 status 컬럼 Y
	 */
	public void payComplete(TB_BOOK book);

	/**
	 * 결제 시 payment_date 업데이트 
	 * @param book
	 */
	public void paymentDateComplete(TB_BOOK book);


	public void memberPointUpdate(HashMap<String, Object> pointUpdate);





}
