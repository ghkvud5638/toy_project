package show.service.face;

import java.util.List;

import show.dto.Member;
import show.dto.TB_SHOW;

public interface MainService {

	public boolean login(Member member);

	public Object getUsernick(Member member);

}
