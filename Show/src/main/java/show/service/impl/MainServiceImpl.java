package show.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.face.MainDao;
import show.dto.Member;
import show.dto.TB_SHOW;
import show.service.face.MainService;

@Service
public class MainServiceImpl implements MainService{
	@Autowired private MainDao mainDao;
	
	@Override
	public boolean login(Member member) {
		int loginChk = mainDao.login(member);
		
		if(loginChk > 0)	return true;
		else return false;
	}

	@Override
	public String getUsernick(Member member) {
		return mainDao.getUsernick(member);
	}


}
