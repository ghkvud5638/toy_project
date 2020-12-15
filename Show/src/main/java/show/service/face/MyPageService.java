package show.service.face;

import java.util.List;

import show.dto.Member;
import show.dto.TB_BOOK;

public interface MyPageService {

	/**
	 * 예매 리스트
	 * @param string
	 * @return show_id, book_date를 중복없이 조회
	 */
	public List<TB_BOOK> getBookList(String member_id);

	
	public List<TB_BOOK> getBookDetail(TB_BOOK book);


	public Member getMember(String member_id);

	
	


}
