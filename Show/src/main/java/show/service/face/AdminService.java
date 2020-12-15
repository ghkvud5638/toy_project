package show.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import show.dto.Admin;
import show.dto.Member;
import show.dto.TB_ATTRACTION;
import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.util.AdminMemberPaging;

public interface AdminService {
	
	
	/**
	 * 로그인 처리
	 * 
	 * @param admin - 로그인 아이디, 패스워드 정보 객체
	 * @return
	 * 		true - 로그인 인증 성공
	 * 		false -로그인 인증 실패
	 */
	public boolean adminLogin(Admin admin);
	
	/**
	 * 회원 상세정보
	 * 
	 * @param adminid - 로그인 아이디
	 * @return Admin - 회원 정보
	 */
	public Admin admininfo(String adminid);
	
	
	/**
	 * 유저 리스트 전체 출력
	 * @return - 유저 정보
	 */

	public List<Member> userAllList();
	
	public AdminMemberPaging selectCntAll(AdminMemberPaging curPage);
	
	public List<Member> selectMemberListPaging(AdminMemberPaging paging);

	
	/**
	 * 유저 상세 정보
	 * @param member - 유저 정보
	 * @return - 유저정보 반환
	 */
	public Member selectmemberIdView(Member member);

	
	/**
	 * 회원 정보 수정
	 * @param member - 회원 정보
	 */
	public void memberUpdate(Member member);

	public List<TB_SHOW> adminShowList();

	public void adminShowUpdate(TB_SHOW tb_show);

	public TB_SHOW selectShowIdView(TB_SHOW tb_show);

	public void adminShowInsert(TB_SHOW tb_show);

	public List<TB_BOOK> booklist();

	public List<?> selectsalesdate(HashMap<String, String> map);

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
