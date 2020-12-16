package show.dao.face;

import java.util.List;

import show.dto.TB_ALLIM;

public interface AllimDao {

	public void insertAllim(TB_ALLIM allim);

	public List<TB_ALLIM> selectAllimList(String member_id);

	public void updateIsRead(String allim_id);

	public String selectIsRead(String member_id);
	

}
