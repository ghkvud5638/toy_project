package show.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.face.MyPageDao;
import show.dto.Member;
import show.dto.TB_BOOK;
import show.service.face.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired private MyPageDao myPageDao;
	@Override
	public List<TB_BOOK> getBookList(String member_id) {
		return myPageDao.selectBookList(member_id);
	}
	@Override
	public List<TB_BOOK> getBookDetail(TB_BOOK book) {
		return myPageDao.selectBookDetail(book);
	}
	@Override
	public Member getMember(String member_id) {
		return myPageDao.selectMember(member_id);
	}
}
