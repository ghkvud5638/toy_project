package show.dao.face;

import java.util.List;

import show.dto.Member;
import show.dto.TB_SHOW;

public interface MainDao {
	
	public Member logIn(Member member);

	public int login(Member member);
	
	
	public String getUsernick(Member member);

	
	public void signup(Member member);


	
	
	
	//아이디 중복확인
		public int idcheck(String member_id);

		

		//회원정보 insert
		public void insertJoin(Member tb_member);
		
		
		
		
		public int isExistsId(Member member);

		public int isCorrectPw(Member member);

		public List<TB_SHOW> listten();

		public Object getUpdate(String member_id);

		public void updateProcess(Member member);

		public String loginspot(Member member);
	
	
	
}
