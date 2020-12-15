package show.dao.face;

import java.util.HashMap;
import java.util.List;

import show.dto.Admin;
import show.dto.Member;
import show.dto.TB_ATTRACTION;
import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.util.AdminMemberPaging;

public interface AdminDao {
	
	/**
	 * 로그인 아이디, 패스워드 가 일치하는 사용자의 수 구하기
	 * 
	 * @param admin - 로그인 아이디, 패스워드
	 * @return int - 일치하는 유저 수
	 */
	public int selectAdminCnt(Admin admin);
	
	/**
	 * 주어진 id를 이용해 회원정보 조회
	 * 
	 * @param adminid - 조회 대상 adminid
	 * @return Login - 조회된 회원 정보
	 */
	public Admin selectAdminById(String adminid);

	/**
	 * 유저 전체 조회
	 * @return - 전체 유저
	 */
	public List<Member> selectAllMember();

	/**
	 * 조회 개수 카운트
	 * @param paging - 조회 개수 카운트
	 * @return - 개수 카운트 반환
	 */
	public int selectCntAll(AdminMemberPaging paging);
	
	/**
	 * 멤버 전체 조회
	 * @param paging - 전체 조회
	 * @return 전체 조회 반환
	 */
	
	public List<Member> selectMemberListPaging(AdminMemberPaging paging);

	
	public Member selectmemberIdView(Member member);

	public void memberUpdate(Member member);

	public List<TB_SHOW> adminShowList();

	public void adminShowUpdate(TB_SHOW tb_show);

	public TB_SHOW selectShowIdView(TB_SHOW tb_show);

	public void adminShowInsert(TB_SHOW tb_show);

	public List<?> selectsalesdate(HashMap<String, String> map);

	public List<TB_BOOK> booklist();

	public List<?> selectsalescategory(HashMap<String, String> map);

	public List<?> selectsalesplace(HashMap<String, String> map);

	public List<?> seleticketinginfo(HashMap<String, String> map);

	public void ticketcancel(TB_BOOK tb_book);

	public List<?> adminAttraclist(HashMap<String, Object> map);

	public List<?> selectAttractionIdView(HashMap<String, Object> map);

	public void attractionupdate(HashMap<String, Object> map);

	public void attractionimgupdate(HashMap<String, Object> map);

	public void adminShowDelete(TB_SHOW tb_show);

	public List<?> yesterdaytotal();

	public List<?> kotoshiuriage();

	public List<?> hidukeuriage();


}
