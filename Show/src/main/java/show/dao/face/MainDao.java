package show.dao.face;

import java.util.List;

import show.dto.Member;
import show.dto.TB_SHOW;

public interface MainDao {

	public int login(Member member);

	public String getUsernick(Member member);


	
}
