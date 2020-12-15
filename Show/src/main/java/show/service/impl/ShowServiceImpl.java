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
import show.util.Paging;
import show.util.ShowlistPaging;
import show.util.showPaging;

@Service
public class ShowServiceImpl implements ShowService{
	private static final Logger logger = LoggerFactory.getLogger(ShowServiceImpl.class);
	@Autowired private ShowDao showDao;
	@Override
	public showPaging getPaging(showPaging curPage) {
		int totalCount = showDao.selectCntAll(curPage);
		showPaging paging = new showPaging(totalCount, curPage.getCurPage());
		logger.info("페이징!!!!! : "+paging);
		
		return paging;
	}
	
	//
	@Override
	public List<TB_SHOW> checklist(ShowlistPaging paging) {
		logger.info("checklist");
		logger.info("serviceImpl curpage" + paging);
		List<TB_SHOW> checklist=showDao.checklistMap(paging);
		
		logger.info("checklist : "+checklist);
		
		return checklist;	
	}
	//
	@Override
	public ShowlistPaging getPagingJH(ShowlistPaging curPage) {
		logger.info(" getPaging serviceImpl curpage" + curPage);

		int totalCount = showDao.selectCntAllJH(curPage);
		logger.info("getPaging totalCount : "+totalCount);
		ShowlistPaging paging = new ShowlistPaging(totalCount, curPage.getCurPage());
				
		return paging;	
	}
	
	
	
	@Override
	public List<TB_SHOW> getShowList(showPaging paging) {
		return showDao.selectShowAll(paging);
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
	@Override
	public List<String> getUnavaliableSeatList(TB_BOOK tbBook) {
		return showDao.selectSeatList(tbBook);
	}
	@Override
	public void payComplete(TB_BOOK book) {
		showDao.updateBookStatus(book);
	}
	@Override
	public void paymentDateComplete(TB_BOOK book) {
		showDao.updateBookPaymentDate(book);
	}
}
