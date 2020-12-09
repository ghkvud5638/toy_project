package show.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.face.ShowDao;
import show.dto.TB_BOOK;
import show.dto.TB_SEAT;
import show.dto.TB_SHOW;
import show.service.face.ShowService;

@Service
public class ShowServiceImpl implements ShowService{
	private static final Logger logger = LoggerFactory.getLogger(ShowServiceImpl.class);
	@Autowired private ShowDao showDao;
	@Override
	public List<TB_SHOW> getShowList() {
		return showDao.selectShowAll();
	}
	@Override
	public TB_SHOW getShowDetail(String show_id) {
		return showDao.selectShowById(show_id);
	}
	@Override
	public TB_SEAT getSeatCnt(String show_id) {
		return showDao.selectSeatCnt(show_id);
	}
	@Override
	public void book(TB_BOOK book) {
		showDao.insertBook(book);
	}
	@Override
	public List<TB_BOOK> selectBook(TB_BOOK book) {
		return showDao.selectBookList(book);
	}
	@Override
	public void delete(TB_BOOK deleteInfo) {
		showDao.deleteBack(deleteInfo);
	}
}
