package show.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import show.dto.Member;
import show.dto.TB_SHOW;
import show.service.face.MainService;

@Controller
public class MainController {
		private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
		//서비스연결
		@Autowired private MainService mainService; 
		// 이메일약관 띄우기
		@RequestMapping(value = "/main/emailwar",method=RequestMethod.GET)
		public void emailwar() {
		}
		
		// 이용약관 띄우기
		@RequestMapping(value = "/main/use",method=RequestMethod.GET)
		public void eeee() {
		}
		
		// 개인정보동의 띄우기
		@RequestMapping(value = "/main/privacy",method=RequestMethod.GET)
		public void privacy() {
		}
		
		// 메인 화면 띄우기
		@RequestMapping(value = "/main/main",method=RequestMethod.GET)
		public void main(Model model) {

		}
		// 헤더 띄우기
		@RequestMapping(value = "/header",method=RequestMethod.GET)
		public void dddd() {
		}
		// 푸터 띄우기
		@RequestMapping(value = "/footer",method=RequestMethod.GET)
		public void aaaa() {
		}
		
		//로그인 페이지 띄우기
		@RequestMapping(value="/main/login",method=RequestMethod.GET)
		public void login() {	
		}
		
		//로그아웃 처리
		@RequestMapping(value="/main/logout", method=RequestMethod.GET)
		public String logout(HttpSession session) {
			
			session.invalidate();
			
			return "redirect:/main/main";
		}
		
		@RequestMapping(value="/main/login", method=RequestMethod.POST)
		public String loginProcess(
				Member member,
				HttpSession session,
				Model model) {
			logger.info("로그인버튼눌림");
			logger.info(member.getMember_id() + " " + member.getMember_pw());
			boolean loginResult = mainService.login(member);
			
			if(loginResult) {
		
				session.setAttribute("login", true);
				session.setAttribute("member_id", member.getMember_id());
				session.setAttribute("nick", mainService.getUsernick(member));
				return "redirect:/main/main";

			} else {
				return "redirect:/main/login";
			}
			
		}
		
}
