package show.dao.face;

import show.dto.Admin;

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

}
