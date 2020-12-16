package show.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.face.AllimDao;
import show.dto.TB_ALLIM;
import show.service.face.AllimService;

@Service
public class AllimServiceImpl implements AllimService {
	@Autowired AllimDao allimDao;
	@Override
	public void insertAllim(TB_ALLIM allim) {
		allimDao.insertAllim(allim);
	}
	@Override
	public List<TB_ALLIM> getList(String member_id) {
		return allimDao.selectAllimList(member_id);
	}
	@Override
	public void updateRead(String allim_id) {
		allimDao.updateIsRead(allim_id);
	}
	@Override
	public String cntIsRead(String member_id) {
		return allimDao.selectIsRead(member_id);
	}
}
