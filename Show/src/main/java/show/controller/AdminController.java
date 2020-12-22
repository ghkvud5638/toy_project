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

import show.dto.Member;
import show.dto.TB_ATTRACTION;
import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.service.face.AdminService;
import show.util.AdminAttractionPaging;
import show.util.AdminMemberPaging;
import show.util.AdminShowPaging;
import show.util.AdminTicketPaging;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	
	//----------------- 관리자 메인 페이지 ----------------------
	
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

	//----------------- 관리자 회원관리 ----------------------
	
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
	
	@RequestMapping(value = "/admin/memberdel")
	public String adminMemberDelete(Member member) {
		
		adminService.memberDelete(member);
		
		return "redirect:/admin/memberlist";
	}
	
	
	//----------------- 관리자 매출관리 ----------------------
	
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
	
	
	
	
	
	//----------------- 관리자 예매관리 ----------------------
	
	@RequestMapping(value = "/admin/ticketinginfo")
	public String adminTicketingInfo (AdminTicketPaging curPage,
			Model model ){
		
		AdminTicketPaging paging = adminService.tiketGetPaging(curPage);
		
		paging.setSearchText(curPage.getSearchText());
		
		logger.info("티켓1 : " + paging);
		
		model.addAttribute("paging", paging);
		
		logger.info("티켓2 : " + paging);
		
		List<?> list = adminService.getTiketList(paging);
		
		logger.info("티켓3 : " + list);
		
		model.addAttribute("list", list);

		
//		List<?> list = adminService.seleticketinginfo(map);
		
//		model.addAttribute("list", list);
		
		return "/admin/adminticketinginfo";
	}
	
	@RequestMapping(value = "/admin/ticketingcancel")
	public String adminTicketingCancel (TB_BOOK tb_book){
		
		logger.info("삭제" + tb_book);
		
		adminService.ticketcancel(tb_book);
		
		return "redirect:/admin/ticketinginfo";
	}
	
	
	
	//----------------- 관리자 공연관리 ----------------------
	
	@RequestMapping(value = "/admin/showlist")
	public String adminShowList(Model model, AdminShowPaging curPage) {
		
		AdminShowPaging paging = adminService.showGetPaging(curPage);
		
		paging.setSearchText(curPage.getSearchText());
		
		model.addAttribute("paging", paging);
		
		List<TB_SHOW> list = adminService.getShowList(paging);
		
		model.addAttribute("showList",list);
		
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
	
	
	//----------------- 관리자 볼거리 관리 ----------------------
	
	
	@RequestMapping(value = "/admin/attractionlist")
	public String adminAttractionList(Model model,
			@RequestParam HashMap<String, Object> map,
			AdminAttractionPaging curPage) {
		
		AdminAttractionPaging paging = adminService.attractionGetPaging(curPage);
		
		paging.setSearchText(curPage.getSearchText());
		
		model.addAttribute("paging", paging);
		
		List<?> attraclist = adminService.adminAttraclist(paging);
		
		model.addAttribute("attraclist",attraclist);
		
//		List<?> attraclist = adminService.adminAttraclist(map);
//		
//		model.addAttribute("attraclist", attraclist);
		
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
	
	@RequestMapping(value = "/admin/attractiondel")
	public String adminAttractionDelete(TB_ATTRACTION tb_attraction) {
		
		adminService.attractionDelete(tb_attraction);
		
		return "redirect:/admin/attractionlist";
	}

	
	
}
