package show.service.face;

import java.util.List;

import show.dto.Member;
import show.dto.TB_SHOW;

public interface MainService {

	//	public boolean login(Member member);
	public Member login(Member member);
	
//	public int login(Member member);
	
	public Object getUsernick(Member member);

	public void join(Member member);

	
	
	
	//id 중복확인
	public int idcheck(String member_id);

		
	//회원정보 insert
	public void insertJoin(Member tb_member);
		
		
		
	public List<TB_SHOW> listten();

	public Object getUpdate(String member_id);

	public void updateProcess(Member member);

	public String loginspot(Member member);
	
}
