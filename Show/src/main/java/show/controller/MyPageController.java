package show.controller;

import java.io.File;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import show.dto.Email;
import show.dto.Member;
import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.service.face.MyPageService;
import show.service.face.ShowService;
import show.service.impl.MyPageServiceImpl;
import show.service.impl.ShowServiceImpl;

@Controller
@RequestMapping(value = "/myPage")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Autowired private MyPageService myPageService = new MyPageServiceImpl(); 
	@Autowired private ShowService showService = new ShowServiceImpl(); 
	@Autowired private JavaMailSenderImpl mailSender;

	
	@RequestMapping(value="/bookList")
	public void bookList(HttpSession session, Model model) {
		String member_id = session.getAttribute("member_id").toString();
		List<TB_BOOK> listOfShowIdAndDate = myPageService.getBookList(member_id);
		logger.info("list : "+listOfShowIdAndDate);
//		List<TB_BOOK> anotherList = null;
//		for (TB_BOOK bookInfo : listOfShowIdAndDate) {
//			logger.info("bookInfo : "+bookInfo);
//			bookInfo.setMember_id(member_id);
//			bookInfo.setBook_date(bookInfo.getBook_date().substring(0,10));
//			anotherList= myPageService.getOtherBookList(bookInfo);			
//		}
		model.addAttribute("list",listOfShowIdAndDate);
	}
	@RequestMapping(value="/bookDetail")
	public String bookDetail(TB_BOOK book, HttpSession session,Model model) {
		logger.info("book"+book);
		String member_id = session.getAttribute("member_id").toString();
		book.setMember_id(member_id);
		List<TB_BOOK> bookDetailList = myPageService.getBookDetail(book);
		model.addAttribute("detailList",bookDetailList);
		logger.info("detailList"+bookDetailList);
		return "myPage/bookDetailRes";
	}
	@RequestMapping(value="/payPage")
	public String payPage() {
		return null;
	}
	
	@RequestMapping(value="/pay") //status 컬럼 Y, 이메일 전송
	public String pay(final TB_BOOK book, HttpSession session,final Email email) {
		logger.info("pay"+book);
		final String member_id = session.getAttribute("member_id").toString();
		final String show_id = Integer.toString(book.getShow_id());
		book.setMember_id(member_id);
		List<TB_BOOK> bookDetailList = myPageService.getBookDetail(book);
		logger.info("bookDetailList : "+bookDetailList);
		String eTicketNum = "";
		for (TB_BOOK b:bookDetailList) {
			eTicketNum = eTicketNum +"-"+b.getBook_id();
		}
		final String eTicketNum2 = eTicketNum;
		
		book.setMember_id(member_id);
		showService.payComplete(book);
		showService.paymentDateComplete(book);
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				TB_SHOW show = showService.getShowDetail(show_id);
				
				Member member = myPageService.getMember(member_id);
				System.out.println("member Info : "+member);
				
				helper.setFrom("@gmail.com"); // 보낼 이메일주소 
				helper.setTo(member.getEmail()); // 받는 이메일 주소
				helper.setSubject(member_id+"님! 예매가 완료 되었습니다."); 
								
				String contents = "<img style=\"width: 90px; height: 120px;\" src=\""+show.getShow_image()+"\">"; 
				contents += "<hr>";
				contents += "예약 번호 : "+book.getBook_date()+eTicketNum2+"<br>";
				contents += "공연 제목 : "+show.getShow_name()+"<br>";
				contents += "공연 날짜 : "+book.getBook_date()+"<br>";
				contents += "<hr>";
				contents += "<img style=\"width: 1000px; height: 700px;\" src=\"cid:notice.png\">";
				
				helper.setText(contents, true); 
				
				FileSystemResource file = new FileSystemResource(new File("보낼 파일 주소 경로")); 
				helper.addInline("notice.png", file); 
			}
		};
		mailSender.send(preparator); 
		
		return "redirect:/myPage/bookList";
	}
	
	
	@RequestMapping(value="/error")
	public void error() {}
	
}
