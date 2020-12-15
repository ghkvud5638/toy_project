package show.dao.face;

import java.util.List;

import show.dto.Member;
import show.dto.TB_BOOK;

public interface MyPageDao {

	/**
	 * 예매 리스트
	 * @param member_id
	 * @return
	 */
	public List<TB_BOOK> selectBookList(String member_id);

	public List<TB_BOOK> selectBookDetail(TB_BOOK book);

	public Member selectMember(String member_id);


}
