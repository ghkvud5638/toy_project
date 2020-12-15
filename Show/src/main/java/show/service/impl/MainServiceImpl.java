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
	
//	@Override
//	public boolean login(Member member) {
//		int loginChk = mainDao.login(member);
//		
//		if(loginChk > 0)	return true;
//		else return false;
//	}

	
//	
	@Override
	public Member login(Member member) {
		return mainDao.logIn(member);
	}

//	@Override
//	public int login(Member member) {
//		int res = 0;
//		//해당 id가 있는지 판단
//		int existId = mainDao.isExistsId(member);
//		if (existId>=1) {
//			//아이디 있음
//			//해당 아이디의 비밀번호 검증
//			int correctPw = mainDao.isCorrectPw(member);
//			if (correctPw>=1) {
//				//아이디가 있고 비밀번호가 일치함 -> 로그인 성공
//				res = 1;
//				return res;
//			}else {
//				//아이디는 맞는데 비밀번호가 일치하지 않음
//				res = 0;
//				return res;
//			}
//		}else {
//			//아이디 없음
//			res = -1;
//			return res;
//		}
//	}

	
	
	
	@Override
	public String getUsernick(Member member) {
		return mainDao.getUsernick(member);
	}
	
	@Override
	public void join(Member member) {
		mainDao.signup(member);
		
	}
	

	
	@Override
	public void insertJoin(Member tb_member) {
		mainDao.insertJoin(tb_member);
	}

	
	
	@Override
	public Object getUpdate(String member_id) {
		return mainDao.getUpdate(member_id);
	}
	
	@Override
	public int idcheck(String member_id) {
		int cnt = mainDao.idcheck(member_id);
		return cnt;	
	}
	
	@Override
	public List<TB_SHOW> listten() {
		return mainDao.listten();
	}
	@Override
	public String loginspot(Member member) {
		String spot=mainDao.loginspot(member);
		return spot;
	}

	@Override
	public void updateProcess(Member member) {
		mainDao.updateProcess(member);
	}
}
