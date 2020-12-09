package show.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import show.dto.Admin;
import show.service.face.AdminService;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
//	@Autowired
//	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
//	private AdminShowListService adminShowListservice;
	
	
	@RequestMapping(value="/admin/main")
	public void main() {
		logger.info("관리자메인페이지");
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
	
//	@RequestMapping(value="/admin/memberlist", method=RequestMethod.GET)
//	public String memberlist(Model model) {
//		
//		logger.info("유저 리스트 페이지 시작");
//		
//		//Service 메소드호출
//		List<Member> list = memberService.serviceMember();
//		
//		//View에 모델값 전달
//		model.addAttribute("list", list);
//		
//		//View 지정하고 Forwarding
//		return "/admin/memberlist";
//	}
	
	@RequestMapping(value = "/admin/loginfail", method = RequestMethod.GET)
	public void adminloginfile() { }

//	@RequestMapping(value ="/admin/showlist", method = RequestMethod.GET)
//	public String adminshowlist(Model model) {
//		
//		logger.info("쇼 리스트 페이지 시작");
//		
//		//Service 메소드 호출
//		List<Show> list = adminShowListservice.serviceShowList();
//		
//		//View에 모델값 전달
//		model.addAttribute("list", list);
//		
//		//View 지정하고Forwarding
//		return "/admin/showlist";
//		
//	}
	
}
