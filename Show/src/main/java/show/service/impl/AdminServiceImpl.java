package show.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.face.AdminDao;
import show.dto.Admin;
import show.dto.Member;
import show.dto.TB_ATTRACTION;
import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.service.face.AdminService;
import show.util.AdminAttractionPaging;
import show.util.AdminMemberPaging;
import show.util.AdminShowPaging;
import show.util.AdminTicketPaging;
import show.util.Paging;
import show.util.showPaging;

@Service
public class AdminServiceImpl implements AdminService {
	
	private static final Logger logger 	= LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	AdminDao adminDao;
	
	@Override
	public boolean adminLogin(Admin admin) {
		
		
		if( adminDao.selectAdminCnt(admin) >= 1 ) {
			return true;
		}
		
		return false;
	}

	@Override
	public Admin admininfo(String adminid) {
		return adminDao.selectAdminById(adminid);
	}

	@Override
	public List<Member> userAllList() {

		
		List<Member> list = adminDao.selectAllMember();
		
		
		return list;

	}

	@Override
	public AdminMemberPaging selectCntAll(AdminMemberPaging curPage) {
		
		//전체 게시글 수 조회
		int totalCount = adminDao.selectCntAll(curPage);
		
		//페이징 객체 생성
		AdminMemberPaging paging = new AdminMemberPaging(totalCount, curPage.getCurPage());
				
		return paging;
	}

	@Override
	public List<Member> selectMemberListPaging(AdminMemberPaging paging) {
		
		return adminDao.selectMemberListPaging(paging);
	}

	@Override
	public Member selectmemberIdView(Member member) {
		return adminDao.selectmemberIdView(member);
	}

	@Override
	public void memberUpdate(Member member) {
		adminDao.memberUpdate(member);
	}

	@Override
	public List<TB_SHOW> adminShowList() {
		return adminDao.adminShowList();
	}

	@Override
	public void adminShowUpdate(TB_SHOW tb_show) {
		
		logger.info("쇼 업데이트 " + tb_show);
		adminDao.adminShowUpdate(tb_show);
		
	}

	@Override
	public TB_SHOW selectShowIdView(TB_SHOW tb_show) {
		
		return adminDao.selectShowIdView(tb_show);
	}

	@Override
	public void adminShowInsert(TB_SHOW tb_show) {
		
		adminDao.adminShowInsert(tb_show);
		
	}

	@Override
	public List<TB_BOOK> booklist() {
		
		return adminDao.booklist();
	}

	@Override
	public List<?> selectsalesdate(HashMap<String, String> map) {
		
		List<?> list = adminDao.selectsalesdate(map);
		
		return list;
	}

	@Override
	public List<?> selectsalescategory(HashMap<String, String> map) {
		 
		List<?> list = adminDao.selectsalescategory(map);
		 
		return list;
	}

	@Override
	public List<?> selectsalesplace(HashMap<String, String> map) {
		
		List<?> list = adminDao.selectsalesplace(map);
		
		return list;
	}

	@Override
	public List<?> seleticketinginfo(HashMap<String, String> map) {
		
		List<?> list = adminDao.seleticketinginfo(map);

		return list;
	}

	@Override
	public void ticketcancel(TB_BOOK tb_book) {
		
		adminDao.ticketcancel(tb_book);
		
	}

	@Override
	public List<?> adminAttraclist(HashMap<String, Object> map) {
		
		List<?> list = adminDao.adminAttraclist(map);
		
		return list;
	}

	@Override
	public List<?> selectAttractionIdView(HashMap<String, Object> map) {
		
		List<?> list = adminDao.selectAttractionIdView(map);

		return list;
	}

	@Override
	public void attractionupdate(HashMap<String, Object> map) {

		adminDao.attractionupdate(map);
		
	}

	@Override
	public void attractionimgupdate(HashMap<String, Object> map) {

		adminDao.attractionimgupdate(map);
	}

	@Override
	public void adminShowDelete(TB_SHOW tb_show) {
		
		adminDao.adminShowDelete(tb_show);
		
	}

	@Override
	public List<?> yesterdaytotal() {

		List<?> list = adminDao.yesterdaytotal();
		
		return list;
	}

	@Override
	public List<?> kotoshiuriage() {
		
		List<?> list = adminDao.kotoshiuriage();
		
		return list;
	}

	@Override
	public List<?> hidukeuriage() {
		
		List<?> list = adminDao.hidukeuriage();
		
		return list;
	}

	@Override
	public void attractionDelete(TB_ATTRACTION tb_attraction) {
		
		adminDao.attractionDelete(tb_attraction);
		
	}

	@Override
	public void memberDelete(Member member) {
		
		adminDao.memberDelete(member);
		
	}

	@Override
	public AdminShowPaging showGetPaging(AdminShowPaging curPage) {
		int totalCount = adminDao.showSelectCntAll(curPage);
		AdminShowPaging paging = new AdminShowPaging(totalCount, curPage.getCurPage());
		return paging;
	}

	@Override
	public List<TB_SHOW> getShowList(AdminShowPaging paging) {
		
		return adminDao.selectShowAll(paging);
	}

	@Override
	public AdminAttractionPaging attractionGetPaging(AdminAttractionPaging curPage) {
		int totalCount = adminDao.AttractionSelectCntAll(curPage);
		AdminAttractionPaging paging = new AdminAttractionPaging(totalCount, curPage.getCurPage());
		return paging;
	}

	@Override
	public List<?> adminAttraclist(AdminAttractionPaging paging) {

		return adminDao.selectAttractionAll(paging);
	}

	@Override
	public AdminTicketPaging tiketGetPaging(AdminTicketPaging curPage) {
		int totalCount = adminDao.TicketSelectCntAll(curPage);
		AdminTicketPaging paging = new AdminTicketPaging(totalCount, curPage.getCurPage());
		return paging;
	}

	@Override
	public List<?> getTiketList(AdminTicketPaging paging) {
		return adminDao.selectTicketAll(paging);
	}



}
