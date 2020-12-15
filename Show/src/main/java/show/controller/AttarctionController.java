package show.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import show.dto.TB_ATTRACTION;
import show.service.face.AttractionService;
import show.util.AttractionPaging;

@Controller
@RequestMapping(value="/attraction")
public class AttarctionController {

	@Autowired private AttractionService attractionService;
	
	@RequestMapping(value="/test")
	public void att() {
		System.out.println("asdasd");
		System.out.println("테스트입니다");
		System.out.println("2020-12-08 17:21 commit Test");
		System.out.println("2020-12-08 17:27 Pull Test");
		System.out.println("2020-12-08 18:03 Pull Test");
		System.out.println("2020-12-08 18:12 Pull Test");
		System.out.println("2020-12-09 00:54 Branch Test");
		System.out.println("2020-12-09 01:14 Merge Test");
		System.out.println("2020-12-09 01:44 Merge Test");
		System.out.println("2020-12-09 09:53 Commit Test");
		System.out.println("2020-12-09 09:53 Commit Test");
		System.out.println("Ignore Test");
		System.out.println("Ignore Test222");
		System.out.println("Ignore Test333");
		System.out.println("2020-12-15 PullTest");
		System.out.println("2020-12-15 MergeTest");
		System.out.println("2020-12-15 PullrequestTest");
		System.out.println("2020-12-15 PullrequestTest2");
		System.out.println("2020-12-15 PullrequestTest3");
		System.out.println("2020-12-15 PullrequestTest4");
		System.out.println("2020-12-15 PullrequestTest5");
		System.out.println("2020-12-15 MergerequestTest");
		

	}
	
	
	
	@RequestMapping(value="/list")
	public String attractionList(AttractionPaging curPage, Model model, String area, 
			String cate1, String cate2, String search, String order, String boardType) {
	
		System.out.println("시작");
		
		if( area == null) {
			area = "all";
		
		} else { }

		if( cate1 == null ) {	
			cate1 = "all";
		} else { }
		if( cate2 == null ) {
			cate2 = "all";
		} else { }
	
		if( search == null ) {	
			search = "";

		} else { }
		
		if(order == null ) {
			order = "";
		}
		
		if(boardType == null) {
			System.out.println("테스트" + boardType);
			boardType = "image";
			System.out.println("테스트" + boardType);
		}

		
		
//		System.out.println("ajaxChk ==" + ajaxChk);
		
		model.addAttribute("cate1", cate1);
		model.addAttribute("cate2", cate2);
		model.addAttribute("search", search);
		model.addAttribute("order", order);

		HashMap<String, Object> searchList = new HashMap<String, Object>();
		
		searchList.put("area", area);
		searchList.put("cate1", cate1);
		searchList.put("cate2", cate2);
		searchList.put("search", search);		
		searchList.put("order", order);		
		searchList.put("chkNumber", 0);	
		if(boardType.equals("image")) {
			searchList.put("listNo", 4);
			
		} else {
		searchList.put("listNo", 10);
			
		}
		
		//페이징 계산
		AttractionPaging paging = attractionService.selectAttractionPaging(curPage, searchList);
		model.addAttribute("paging", paging);
		model.addAttribute("area", area);
		model.addAttribute("ajaxChk", false);
		searchList.put("paging", paging);
		
		listArray(model, searchList);
	
		model.addAttribute("boardType", boardType);

		return "attraction/attractionlist";
			
		
		
	}
	
	@RequestMapping(value="/nearbyshowlist")
	public String attractionNearbyShowList(AttractionPaging curPage, Model model, String attraction_no, boolean ajaxChk, int chkNumber) {
		

		model.addAttribute("ajaxChk", ajaxChk);
		HashMap<String, Object> searchList = new HashMap<String, Object>();

		searchList.put("attraction_no", attraction_no);
		searchList.put("listNo", 5);

			searchList.put("chkNumber", chkNumber);
			AttractionPaging paging = attractionService.selectAttractionPaging(curPage, searchList);
			model.addAttribute("paging", paging);
			searchList.put("paging", paging);

			if(chkNumber == 1) {
			TB_ATTRACTION showList = attractionService.selectShowList(searchList);
			model.addAttribute("show", showList);
			
		} else {
			List<TB_ATTRACTION> attractionList = attractionService.selectAttractionList(searchList);
			model.addAttribute("attraction", attractionList);
		}
			
			
		
		
		model.addAttribute("chkNumber", chkNumber);
				
		return "attraction/nearbyshowlist";
		
	}
	
	@RequestMapping(value="/nav")
	public String attractionNav(AttractionPaging curPage, Model model, String area, String cate1, String cate2, String search, String order) {
		System.out.println("시작");
		
		
		return "attraction/attractionNavSubMenu";
		
	}
	
		
	
	@RequestMapping(value="/nava")
	public String attractionNava(AttractionPaging curPage, Model model, int listNo, int chkNumber) {
		HashMap<String, Object> searchList = new HashMap<String, Object>();
		
		System.out.println("아오페이징..." + curPage.getCurPage());
		System.out.println("아오페이징..." + curPage);
		searchList.put("chkNumber", chkNumber);
		searchList.put("listNo", listNo);
		AttractionPaging paging = attractionService.selectAttractionPaging(curPage, searchList);
		searchList.put("paging", paging);
		System.out.println("아오페이징..." + paging);
	
		listArray(model, searchList);
	
	
		model.addAttribute("paging", paging);
	
		
		return "attraction/attractionNavList";
		
	}
	
	@RequestMapping(value="/navList")
	@ResponseBody
	public boolean attractionNavList(TB_ATTRACTION attr, boolean delete, boolean insert, int whereList) {
		String attraction_no = attr.getAttraction_no();
	
		HashMap<String, Object> searchList = new HashMap<String, Object>();
		searchList.put("attraction_no", attraction_no);
		searchList.put("delete", delete);
		searchList.put("insert", insert);
		searchList.put("whereList", whereList);
		
		return attractionService.visitList(searchList);
		
		
	}
	
	

	@RequestMapping(value="/detail")
	public void attractionDetail(TB_ATTRACTION attrInfo, AttractionPaging p, Model model, String area) {
		String attraction_no = attrInfo.getAttraction_no();
		
		
		HashMap<String, Object> searchList = new HashMap<String, Object>();
		searchList.put("attraction_no", attraction_no);
		

		attractionNavList(attrInfo, true, true, 4);

		TB_ATTRACTION attraction = attractionService.selectMarker(attraction_no);

		
		model.addAttribute("attraction", attraction);

	 

		
		
	}
	
	
	@RequestMapping(value="/map")
	public String attractionMap(TB_ATTRACTION attrInfo, Model model, boolean chk, String area) {
				
		String attraction_no = attrInfo.getAttraction_no();
		TB_ATTRACTION attraction = attractionService.selectMarker(attraction_no);
		model.addAttribute("attraction", attraction);
		model.addAttribute("chk", chk);
		model.addAttribute("attraction_no", attraction_no);
		model.addAttribute("area", area);
		
		
		
		return "attraction/map";
		
		
	}
	
	
	@RequestMapping(value="/subway")
	public ModelAndView subwayDistance(TB_ATTRACTION attrInfo, ModelAndView mav) {

		String attraction_no = attrInfo.getAttraction_no();


		TB_ATTRACTION subway = attractionService.selectSubwayList(attraction_no);
		
		
		mav.addObject("subway", subway); //모델값 작성
		
		mav.setViewName("jsonView"); //jsonView로 뷰네임 지정

		return mav;
		
	}
	
	public void listArray(Model model, HashMap<String, Object> searchList){
		List<TB_ATTRACTION> list = attractionService.selectAttractionList(searchList);
		List<String> subwayName = new ArrayList<String>();
		List<TB_ATTRACTION> showName = new ArrayList<TB_ATTRACTION>();
		for(int j = 0; j<list.size(); j++) {
			TB_ATTRACTION subway = attractionService.selectSubwayList(list.get(j).getAttraction_no());
			if(subway == null) {
				subwayName.add("없음");
			} else {
				subwayName.add(subway.getSubway().get(0).getSubway_name());
			}
			searchList.put("attraction_no", list.get(j).getAttraction_no());
			TB_ATTRACTION showList = attractionService.selectShowList(searchList);
			showName.add(showList);
		}

		model.addAttribute("list", list);
		model.addAttribute("showName", showName);
		model.addAttribute("subwayName", subwayName);
	}
	
}
