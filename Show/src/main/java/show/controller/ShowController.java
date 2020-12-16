package show.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import show.dto.Email;
import show.dto.Member;
import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.service.face.MyPageService;
import show.service.face.ShowService;
import show.service.impl.MyPageServiceImpl;
import show.service.impl.ShowServiceImpl;
import show.util.ShowlistPaging;
import show.util.showPaging;


@Controller
public class ShowController {
	private static final Logger logger = LoggerFactory.getLogger(ShowController.class);
	@Autowired private ShowService showService = new ShowServiceImpl();
	@Autowired private MyPageService myPageService = new MyPageServiceImpl();
	@Autowired private JavaMailSenderImpl mailSender;
//	static Calendar cal = Calendar.getInstance();
//	public static final String YEARNO =  Integer.toString(cal.get(Calendar.YEAR));
	
	@RequestMapping(value="/show/list")
	public void showList(showPaging curPage, Model model, HttpServletRequest request ) {
		
		logger.info("시작");
		logger.info("페이징 객체"+curPage);
		
		showPaging paging = showService.getPaging(curPage);
//		paging.setSearch(curPage.getSearch()); 
		paging.setYear(curPage.getYear()); //위의 페이징 객체에 year와 month가 담김.
		paging.setMonth(curPage.getMonth());
		logger.info("get paging : "+paging);
		model.addAttribute("paging", paging);
		
		List<TB_SHOW> list = showService.getShowList(paging);//전체리스트 or 월별 조회

		logger.info("list"+list);		
		model.addAttribute("showList",list);
	}
	
	
	
	@RequestMapping(value = "/show/showlist", method = RequestMethod.GET)
	public void showlist(
			ShowlistPaging curPage, Model model) {
		logger.info("showlist () curPage " + curPage);
		ShowlistPaging paging = showService.getPagingJH(curPage);
		paging.setShowarea(curPage.getShowarea());
		paging.setShowkind(curPage.getShowkind());
		paging.setShowgenre(curPage.getShowgenre());
		paging.setSearch(curPage.getSearch());
		logger.info("showlist () paging " + paging);

		model.addAttribute("paging", paging);
		logger.info("get요청완료!");
		List<TB_SHOW> list = showService.checklist(paging);
		logger.info("list : " + list);
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping(value="/show/detail", method=RequestMethod.GET)
	public void showDetail(String show_id, Model model) {
		logger.info("시작");
		logger.info("show id - {}", show_id);
		
		TB_SHOW showDetail = showService.getShowDetail(show_id);
		model.addAttribute("View",showDetail);
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/show/book")
	public void book(String show_id, Model model, HttpSession session) {
		String id = session.getAttribute("member_id").toString();

		model.addAttribute("showDetail",showService.getShowDetail(show_id));
		model.addAttribute("seatCnt",showService.getSeatCnt(show_id));
		model.addAttribute("member",myPageService.getMember(id));
	}
	
	
	@RequestMapping(value="/show/book2")
	public void book2() {
		
		
	}
	@RequestMapping(value="/show/book2", method = RequestMethod.POST)
	public void book2Proc(TB_BOOK tbBook,Model model, HttpSession session) {
		String id = session.getAttribute("member_id").toString();

		logger.info("date : "+tbBook);
		TB_SHOW show = showService.getShowDetail(Integer.toString(tbBook.getShow_id()));
		logger.info("book2 show info"+show);
		
		//넘어온 show_id, book_date로 TB_BOOK에서 seat_num의 리스트를 불러오자
		//리스트를 model값에 넣자
		List<String> seatList = showService.getUnavaliableSeatList(tbBook);
		logger.info("seatList"+seatList);
		
		model.addAttribute("seatList",seatList);
		model.addAttribute("tbBook",tbBook);
		model.addAttribute("showDetail",showService.getShowDetail(Integer.toString(tbBook.getShow_id())));
		model.addAttribute("member",myPageService.getMember(id));


	}
	@RequestMapping(value="/show/book3")
	public void book3() {
		

	}
	
	@RequestMapping(value="/show/book3Proc", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String book3Proc(@RequestBody List<TB_BOOK> totalJason, HttpSession session, Model model) {
		String id = session.getAttribute("member_id").toString();
		List<TB_BOOK> list= null;
		for(TB_BOOK book : totalJason) {
//			logger.info("show_id = " + book.getShow_id());
//			logger.info("seat_num = " + book.getSeat_num());
//			logger.info("seat_grade = " + book.getSeat_grade());
//			logger.info("seat_price = " + book.getSeat_price());
//			logger.info("book_date = " + book.getBook_date().toString());
//			logger.info("member_id = " + session.getAttribute("userId"));
			book.setMember_id(id); //리스트를 통째로 넘겨서 db에 넣어주고 싶음, 근데 어떻게함?(book_id가 같도록)
			logger.info("book3 info "+book);
			showService.book(book);
			
			list = showService.selectBook(book);

		}
		logger.info("book3 list "+list);
		model.addAttribute("list",list);
		model.addAttribute("member",myPageService.getMember(id));
		return "show/book3";
	}
	
	
	@RequestMapping(value="/show/bookDelete", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String bookDelete(@RequestBody List<TB_BOOK> totalJason) {
		for(TB_BOOK deleteInfo : totalJason) {
			logger.info("bookDelete : "+deleteInfo);
			showService.delete(deleteInfo);
		}
		return null;
	}
	
	@RequestMapping(value="/show/pay")
	public void pay(final TB_BOOK book, HttpSession session,final Email email, int pointM) {
		logger.info("pay"+book);
		final String member_id = session.getAttribute("member_id").toString();
		final String show_id = Integer.toString(book.getShow_id());
		book.setMember_id(member_id);
		List<TB_BOOK> bookDetailList = myPageService.getBookDetail(book);
		
		Member member = myPageService.getMember(member_id);
		HashMap<String, Object> pointUpdate = new HashMap<String, Object>();
		pointUpdate.put("member", member);
		pointUpdate.put("point", member.getPoint() - pointM);
		
		System.out.println(pointM);

		logger.info("bookDetailList : "+bookDetailList);
		String eTicketNum = "";
		for (TB_BOOK b:bookDetailList) {
			eTicketNum = eTicketNum +"-"+b.getBook_id();

			pointUpdate.put("point",  (int)pointUpdate.get("point") + (b.getSeat_price()/10));
			
		}
		
		System.out.println(pointUpdate.get("point"));

		showService.memberPointUpdate(pointUpdate);
		final String eTicketNum2 = eTicketNum;
		
		book.setMember_id(member_id);
		showService.payComplete(book);
		showService.paymentDateComplete(book);
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				TB_SHOW show = showService.getShowDetail(show_id);
				
				Member member = myPageService.getMember(member_id);
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
	}


	
	@RequestMapping(value="/show/selectBoxSearch")
	public void selectBoxSearch() {
	}		

	
	
	
	
	@RequestMapping(value="/show/error")
	public void error() {}


	
}


