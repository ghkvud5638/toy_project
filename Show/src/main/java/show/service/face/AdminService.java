package show.service.face;

import show.dto.Admin;

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

}
