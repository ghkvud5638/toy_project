package show.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import show.dto.Admin;
import show.dto.Member;
import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.service.face.AdminService;
import show.util.AdminMemberPaging;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin/main") 
	public String main(Model model
			, @RequestParam HashMap<String, String> map) {
		
		logger.info("관리자메인페이지");
		
		List<?> yday = adminService.yesterdaytotal();
		model.addAttribute("yday", yday);
		
		List<?> total = adminService.kotoshiuriage();
		model.addAttribute("total", total);
		
		List<?> days = adminService.hidukeuriage();
		model.addAttribute("days", days);

		List<?> genre = adminService.selectsalescategory(map);
		model.addAttribute("genre", genre);
		
		
		return "/admin/adminmain";
	}
	
	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public void adminlogin() {
		logger.info("관리자로그인페이지");
	}
	
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public String adminloginProcess(
					Admin admin
					, HttpSession session) {
		
		logger.info(admin.toString());
		
		//아이디, 패스워드 DB 조회
		boolean isLogin = adminService.adminLogin(admin); //true-인증 성공
		
		//결과에 따른 세션처리
		if(isLogin) {
			session.setAttribute("login", isLogin);
			session.setAttribute("adminid", admin.getAdminid());
		}
		
		return "redirect:/admin/main";
	}
	
	@RequestMapping(value = "/admin/logout")
	public String adminlogout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/login";
	}
	
	@RequestMapping(value="/admin/mypage") //세션값 테스트
	public void adminmypageTest(HttpSession session, Model model) {
		
		String adminid = (String) session.getAttribute("adminid");
		
		logger.info("로그인 정보 : " + session.getAttribute("adminid") );
		
		Admin info = adminService.admininfo(adminid);
		
		model.addAttribute("info", info);
		
	}

	
//	@RequestMapping(value = "/admin/loginfail", method = RequestMethod.GET)
//	public void adminloginfile() { }

	

	
	@RequestMapping(value = "/admin/memberlist") 
	public String adminMemberList( AdminMemberPaging curPage, Model model, HttpSession session ) {
		
		//페이징 계산
		AdminMemberPaging paging = adminService.selectCntAll(curPage);
		paging.setSearch(curPage.getSearch());
		paging.setSearchText(curPage.getSearchText());
		
		model.addAttribute("paging", paging);
		
		//게시글 목록
		List<Member> list = adminService.selectMemberListPaging(paging);
		model.addAttribute("list", list);

		return "/admin/adminmemberlist";
	}
	
	@RequestMapping(value = "/admin/memberupdate", method=RequestMethod.GET)
	public String adminMemberUpdateGet(Member member, Model model) {
		
		member = adminService.selectmemberIdView(member);
		model.addAttribute("view", member);
		
//		logger.info("업데이트 GET : " + model.addAttribute("view", member));
		
		return "/admin/adminmemberupdate";
	}
	
	@RequestMapping(value = "/admin/memberupdate", method=RequestMethod.POST)
	public String adminMemberUpdatePost(Member member) {
		
//		logger.info("업데이트 POST : " + member );
		
		adminService.memberUpdate(member);
		
		return "redirect:/admin/memberlist?search=member_id&searchText=" + member.getMember_id();
//		return "redirect:/admin/memberlist";

	}
	
	
//	@RequestMapping(value = "/adminstest/adminnotice")
//	public void adminNotice() {
	
//	}

	
	@RequestMapping(value = "/admin/salescategory")
	public String adminSalesCategory(Model model
			, @RequestParam HashMap<String, String> map) { 
		
		List<?> list = adminService.selectsalescategory(map);
		model.addAttribute("list", list);
		
		return "/admin/adminsalescategory";
	}
	
	@RequestMapping(value = "/admin/salesplace")
	public String adminSalesArea(Model model
			, @RequestParam HashMap<String, String> map) { 
		
		List<?> list = adminService.selectsalesplace(map);
		model.addAttribute("list", list);
		
	
		return "/admin/adminsalesplace";
	}
	
	
	
	@RequestMapping(value = "/admin/salesdate")
	public String adminSalesDateGet(Model model
			, @RequestParam HashMap<String, String> map){ 
		
		model.addAttribute("booklist", adminService.booklist());
		
		//맵 자체를 모델값으로 전달
		//model.addAttribute( "map", map ); //객체 한개를 통째로 전달
		
		String bookYear = map.get("book_year");
		String bookMonth = map.get("book_month");
		
		if(bookYear == null || bookYear.isEmpty()) bookYear = "";
		if(bookMonth == null || bookMonth.isEmpty()) bookMonth = "";
	
		map.put("book_year",bookYear);
		map.put("book_month",bookMonth);

		List<?> list = adminService.selectsalesdate(map);
		
		model.addAttribute("list", list);
		
		return "/admin/adminsalesdate";
	}
	
	@RequestMapping(value = "/admin/ticketinginfo")
	public String adminTicketingInfo (AdminMemberPaging curPage,
			Model model
			, @RequestParam HashMap<String, String> map){
		
		List<?> list = adminService.seleticketinginfo(map);
		
		model.addAttribute("list", list);
		
		return "/admin/adminticketinginfo";
	}
	
	@RequestMapping(value = "/admin/ticketingcancel")
	public String adminTicketingCancel (TB_BOOK tb_book){
		
		logger.info("삭제" + tb_book);
		
		adminService.ticketcancel(tb_book);
		
		return "redirect:/admin/ticketinginfo";
	}
	
	
	@RequestMapping(value = "/admin/showlist")
	public String adminShowList(Model model) {
		
		List<TB_SHOW> list = adminService.adminShowList();
		model.addAttribute("showList", list);
		
		return "/admin/adminshowlist";
	}
	
	@RequestMapping(value = "/admin/showupdate", method = RequestMethod.GET)
	public String adminShowUpdateGet(TB_SHOW tb_show, Model model) {
		
		tb_show = adminService.selectShowIdView(tb_show);
		model.addAttribute("view", tb_show);	
		
		return "/admin/adminshowupdate";
	}
	
	@RequestMapping(value = "/admin/showupdate", method = RequestMethod.POST)
	public String adminShowUpdatePost(TB_SHOW tb_show, Model model) {
			
		adminService.adminShowUpdate(tb_show);
		
		return "redirect:/admin/showlist";
	}
	
	@RequestMapping(value = "/admin/showinsert", method = RequestMethod.GET)
	public String adminShowInsertGet() {
		
		return "/admin/adminshowinsert";
	}
	
	@RequestMapping(value = "/admin/showinsert", method = RequestMethod.POST)
	public String adminShowInsertPost(TB_SHOW tb_show) {
		
		adminService.adminShowInsert(tb_show);
		
		return "redirect:/admin/showlist";
	}
	
	@RequestMapping(value = "/admin/showdel")
	public String adminShowdel(TB_SHOW tb_show) {
		
		adminService.adminShowDelete(tb_show);
		
		return "redirect:/admin/showlist";
	}
	
	
	
	@RequestMapping(value = "/admin/attractionlist")
	public String adminAttractionList(Model model,
			@RequestParam HashMap<String, Object> map) {
		
		List<?> attraclist = adminService.adminAttraclist(map);
		
		model.addAttribute("attraclist", attraclist);
		
		return "/admin/adminattractionlist";
	}
	
	
	@RequestMapping(value = "/admin/attractionupdate", method=RequestMethod.GET)
	public String adminAttractionUpdateGet(Model model,
			@RequestParam HashMap<String, Object> map) {
		
		List<?> view = adminService.selectAttractionIdView(map);
		
		logger.info("뷰어" + model.addAttribute("view", view));
		
		model.addAttribute("view", view);
		
		return "/admin/adminattractionupdate";
	}
	
	@RequestMapping(value = "/admin/attractionupdate", method=RequestMethod.POST)
	public String adminAttractionUpdatePost(Model model,
			@RequestParam HashMap<String, Object> map) {
		
		logger.info("업데이트 로그" + map);
		
		adminService.attractionupdate(map);
		adminService.attractionimgupdate(map);
		
		return "redirect:/admin/attractionlist";
	}

	
	
	
}
