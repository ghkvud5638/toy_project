package show.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import show.dto.Member;
import show.dto.TB_SHOW;
import show.service.face.MainService;

@Controller
public class MainController {
		private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
		//서비스연결
		@Autowired private MainService mainService; 
		@Autowired BCryptPasswordEncoder pwdEncoder;
		
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
					List<TB_SHOW> list=mainService.listten();
					model.addAttribute("list", list);
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
		
		
		
		
//		@RequestMapping(value="/main/login", method=RequestMethod.POST)
//		public String loginProcess(
//				Member member,
//				HttpSession session,
//				Model model) {
//			logger.info("로그인버튼눌림 member : "+member);
//			logger.info(member.getMember_id() + " " + member.getMember_pw());
//			
//			Member login = mainService.login(member);
//			logger.info("로그인 조회 : "+login);
////			boolean loginResult = mainService.login(member);
//			 
//			boolean pwdMatch = pwdEncoder.matches(member.getMember_pw(), login.getMember_pw());
//			
//			if(pwdMatch ==true && login!=null) {
//		
//				session.setAttribute("login", true);
//				session.setAttribute("member_id", member.getMember_id());
//				session.setAttribute("nick", mainService.getUsernick(member));
//				return "redirect:/main/main";
//
//			} else {
//				return "redirect:/main/login";
//			}
//			
//		}
		//로그인
		@RequestMapping(value="/main/login", method=RequestMethod.POST)
		public String loginProcess(Member member, HttpSession session, HttpServletResponse response) {
			logger.info("로그인 시도 데이터 : " + member);
			Member login = mainService.login(member);
			System.out.println("login data : "+ member);
			if (login == null) {
				PrintWriter out;
				try {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					out = response.getWriter();
					out.println("<script>alert('존재하지 않는 아이디'); history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "main/login";
			}
			
			boolean pwdMatch = pwdEncoder.matches(member.getMember_pw(), login.getMember_pw());
			System.out.println("isCorrect pwd? : "+ pwdMatch);
			String spot=mainService.loginspot(member);
			if (pwdMatch ==true && login!=null) {
				logger.info("로그인 성공");
				System.out.println("login success");
				logger.info(member.getMember_spot());
				session.setAttribute("login", true);
				session.setAttribute("member_id", member.getMember_id());
				session.setAttribute("member_spot",spot);
			} else {
				logger.info("로그인 실패");
				System.out.println("login fail");
//				PrintWriter out;
//				try {
////					response.setCharacterEncoding("UTF-8");
////					response.setContentType("text/html; charset=UTF-8");
////					out = response.getWriter();
////					out.println("<script>alert('로그인 실패'); history.go(-1);</script>");
////					out.flush();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
				return "main/login";
			}
			return "redirect:/main/main";
			
		}
		
		
		
		
		@RequestMapping(value="/main/join", method=RequestMethod.GET)
		public void join() {}
		
		


		
		//회원가입 약관 띄우기
		@RequestMapping(value="/join/joinbefore", method=RequestMethod.GET)
		public void joinBefore() {
		}
		
		//회원가입 폼 띄우기
		@RequestMapping(value="/join/joinForm", method=RequestMethod.GET)
		public void joinForm() {
		}
		
		//회원 정보 insert
		@RequestMapping(value="/join/joinForm", method=RequestMethod.POST)
		public String joinInsert(Member member) {
			logger.info(member.toString());
			if (member.getMember_spot().equals("0527")) {
				member.setMember_spot("관리자");
			}else {
				member.setMember_spot("일반");
			}
			String inputPw = member.getMember_pw();
			String pwd = pwdEncoder.encode(inputPw); //암호화
			member.setMember_pw(pwd);
	
			mainService.insertJoin(member);
	
			return "join/joinResult";
		}
		
//		@RequestMapping(value="/main/join", method=RequestMethod.POST)
//		public String joinProc(Member member) {
//			String inputPass = member.getMember_pw();
//			String pwd = pwdEncoder.encode(inputPass); //입력한 비밀번호 암호화하여 다시 dto에 넣어줌, 이 시점에서 DB에도 암호화되어 잘 들어감
//			member.setMember_pw(pwd);
//			
//			mainService.join(member);
//			
//			return "redirect:/main/main";
//		}
//		
		
		
		//아이디 중복체크
		@RequestMapping(value="/join/idCheck", method = RequestMethod.GET)
		@ResponseBody
		public int idcheck(String member_id) {
			
			return mainService.idcheck(member_id);
		}
		
		@RequestMapping(value="/main/update",method=RequestMethod.GET)
		public void update(String member_id,Model model) {
			model.addAttribute("user",mainService.getUpdate(member_id));
		}
		@RequestMapping(value="/main/update",method=RequestMethod.POST)
		public void updateprocess(Member member) {
			mainService.updateProcess(member);
			
		}
		@RequestMapping(value="/main/searchidpw",method=RequestMethod.GET)
		public void searchidpw(Model model) {
		}
		
		
		//패스워드 체크
		@ResponseBody
		@RequestMapping(value="/main/passChk", method = RequestMethod.POST)
		public boolean passChk(Member member) {
			logger.info("member"+member);
			Member login = mainService.login(member);
			boolean pwdChk = pwdEncoder.matches(member.getMember_pw(), login.getMember_pw());
			return pwdChk;
		}

		@RequestMapping(value="/main/chat")
		public void chat() {
		}
		@RequestMapping(value="/main/askBtn")
		public void askBtn() {
		}
		
		
		
}
