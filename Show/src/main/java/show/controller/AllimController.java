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
import org.springframework.web.bind.annotation.ResponseBody;

import show.dto.TB_ALLIM;
import show.service.face.AllimService;
import show.service.impl.AllimServiceImpl;

@Controller
@RequestMapping(value = "/allim")
public class AllimController {
	private static final Logger logger = LoggerFactory.getLogger(AllimController.class);
	@Autowired AllimService allimService = new AllimServiceImpl();
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void allimPage() {
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody // json응답을 view에 보낼 때
	public Object allimList(HttpSession session, Model model) {
		logger.info("HERE! allimList POST");
		String member_id = session.getAttribute("member_id").toString();
		List<TB_ALLIM> list = allimService.getList(member_id);
		logger.info("getList : "+list);
//		model.addAttribute("list",list);
		return list;
	}
	
	@RequestMapping(value="/insertAllim", method=RequestMethod.POST)
	public String insertAllim(TB_ALLIM allim) {
		logger.info("allim : "+allim);
		allimService.insertAllim(allim);
		return null;
	}
	
	@RequestMapping(value="/isRead",method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String chkRead(@RequestBody String allim_id) { //@RequestBody는 ajax에서 데이터를 넘길 때, 컨트롤러의 메서드의 매개변수에 적어줘야함
		logger.info("allim_id : "+allim_id);
		allimService.updateRead(allim_id);
		return null;
	}
	
	@RequestMapping(value="/cntIsRead",method=RequestMethod.POST)
	@ResponseBody // json응답을 view에 보낼 때
	public String cntIsRead(HttpSession session) {
		logger.info("cntIsRead POST");
		try {
			String member_id = session.getAttribute("member_id").toString();			
			String cnt = allimService.cntIsRead(member_id);
			logger.info("cnt : "+cnt);
			return cnt;
		} catch (Exception e) {
			return "0";
		}
	}
}
