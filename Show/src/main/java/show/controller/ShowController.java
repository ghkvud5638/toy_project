package show.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import show.dto.TB_BOOK;
import show.dto.TB_SHOW;
import show.service.face.ShowService;
import show.service.impl.ShowServiceImpl;


@Controller
public class ShowController {
	private static final Logger logger = LoggerFactory.getLogger(ShowController.class);
	@Autowired
	private ShowService showServie = new ShowServiceImpl();
	
	@RequestMapping(value="/show/list", method=RequestMethod.GET)
	public void showList(Model model) {
		logger.info("시작");
		List<TB_SHOW> list = showServie.getShowList();
		model.addAttribute("showList",list);
	}
	@RequestMapping(value="/show/detail", method=RequestMethod.GET)
	public void showDetail(String show_id, Model model) {
		logger.info("시작");
		logger.info("show id - {}", show_id);
		
		TB_SHOW showDetail = showServie.getShowDetail(show_id);
		model.addAttribute("showDetail",showDetail);
	}
	
	@RequestMapping(value="/show/book")
	public void book(String show_id, Model model) {
		model.addAttribute("showDetail",showServie.getShowDetail(show_id));
		model.addAttribute("seatCnt",showServie.getSeatCnt(show_id));
	}
	
	
	@RequestMapping(value="/show/book2")
	public void book2() {}
	@RequestMapping(value="/show/book2", method = RequestMethod.POST)
	public void book2Proc(TB_BOOK tbBook,Model model) {
		logger.info("date : "+tbBook);
		TB_SHOW show = showServie.getShowDetail(Integer.toString(tbBook.getShow_id()));
		logger.info("book2 show info"+show);
		model.addAttribute("tbBook",tbBook);
		model.addAttribute("showDetail",showServie.getShowDetail(Integer.toString(tbBook.getShow_id())));
		

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
			showServie.book(book);
			
			list = showServie.selectBook(book);
		}
		logger.info("book3 list "+list);
		model.addAttribute("list",list);
		return "show/book3";
	}
	
	
	@RequestMapping(value="/show/bookDelete", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String bookDelete(@RequestBody List<TB_BOOK> totalJason) {
		for(TB_BOOK deleteInfo : totalJason) {
			logger.info("bookDelete : "+deleteInfo);
			showServie.delete(deleteInfo);
		}
		return null;
	}
	
	
	
	
	@RequestMapping(value="/show/error")
	public void error() {}


	
}




















