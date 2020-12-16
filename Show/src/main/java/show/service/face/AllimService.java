package show.service.face;

import java.util.List;

import show.dto.TB_ALLIM;

public interface AllimService {

	/**
	 * 알림 insert
	 * @param allim
	 */
	public void insertAllim(TB_ALLIM allim);
	
	/**
	 * 알림리스트 조회
	 * @param member_id
	 * @return
	 */
	public List<TB_ALLIM> getList(String member_id);

	/**
	 * '읽음'처리
	 * @param allim_id
	 */
	public void updateRead(String allim_id);

	/**
	 * isRead컬럼 N개수
	 * @param member_id
	 * @return
	 */
	public String cntIsRead(String member_id);

}
