//package show.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import show.dto.TB_ATTRACTION;
//import show.service.face.AttractionService;
//import show.util.AttractionPaging;
//
//@Controller
//@RequestMapping(value="/attraction")
//public class AttarctionControllerback {
//
//	@Autowired private AttractionService attractionService;
//	
//	@RequestMapping(value="/list")
//	public String attractionList(AttractionPaging curPage, Model model, String area) {
//		System.out.println("시작");
//		
//		if( area == null) {
//			//페이징 계산
//			AttractionPaging paging = attractionService.getPaging(curPage);
//			model.addAttribute("paging", paging);
//			
//			//게시글 목록
//			List<TB_ATTRACTION> list = attractionService.list(paging);
//			model.addAttribute("list", list);
//			
//			return "attraction/attractionlist";
//			
//		} else {
//		
//			System.out.println(area);
//			
//			//페이징 계산
//			AttractionPaging paging = attractionService.getAreaPaging(curPage, area);
//			model.addAttribute("paging", paging);
//			model.addAttribute("area", area);
//			
//		
//			//게시글 목록
//			List<TB_ATTRACTION> areaList = attractionService.areaList(paging, area);
//			model.addAttribute("list", areaList);
//			
//			System.out.println(areaList);
//			
//			return "attraction/attractionlist";
//
//		}
//		
//	}
//	
//	@RequestMapping(value="/map")
//	public void attractionMap(String attraction_no, Model model) {
//		System.out.println(attraction_no);
//
//		
//		TB_ATTRACTION attraction = attractionService.selectMarker(attraction_no);
//		System.out.println(attraction);
//		model.addAttribute("attraction", attraction);
//
//		
//	}
//
//	@RequestMapping(value="/detail")
//	public void attractionDetail(String attraction_no, AttractionPaging p, Model model) {
//		
//		System.out.println(attraction_no);
//		System.out.println(p.getCurPage());
//		double lat2, lon2;
//		
//		
//		TB_ATTRACTION attraction = attractionService.selectMarker(attraction_no);
//		
//		System.out.println(attraction);
//		model.addAttribute("attraction", attraction);
//
//	    double R = 6372.8; // In kilometers
//
//	    lat2 = 37.56119844;
//	    lon2 = 126.9943036;
//	    
//		double lat1 = Double.parseDouble(attraction.getAttraction_latitude());
//		double lon1 = Double.parseDouble(attraction.getAttraction_longitude());
//	    
//	    double dLat = Math.toRadians(lat2 - lat1);
//        double dLon = Math.toRadians(lon2 - lon1);
//        lat1 = Math.toRadians(lat1);
//        lat2 = Math.toRadians(lat2);
//
//        double a = Math.pow(Math.sin(dLat / 2),2) + Math.pow(Math.sin(dLon / 2),2) * Math.cos(lat1) * Math.cos(lat2);
//        double c = 2 * Math.asin(Math.sqrt(a));
//        double dist = R * c;
//	    
////		System.out.println();
////		System.out.println(attraction.getAttraction_longitude());
////		
////		String unit = "killometer";
////		lat2 = 37.52323816;
////		lon2 = 126.9269111;
////		double dist = attractionService.distance(lat1, lon1, lat2, lon2, unit);
//		System.out.println(dist);
//		
////		model.addAttribute("dist", dist);
//		
//	       
//		
//	}
//	
//}
