package show.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.face.AttractionDao;
import show.dto.TB_ATTRACTION;
import show.service.face.AttractionService;
import show.util.AttractionPaging;

@Service
public class AttractionServiceImpl implements AttractionService {

	@Autowired private AttractionDao attractionDao;
	
	@Override
	public AttractionPaging selectAttractionPaging(AttractionPaging curPage, HashMap<String, Object> searchList) {
		if( (Integer)searchList.get("chkNumber") == 2) {
		
			TB_ATTRACTION nearBy = attractionDao.selectMarker((String) searchList.get("attraction_no"));

			searchList.put("LSWEW", nearBy.getAttraction_latitude());
			searchList.put("lon", nearBy.getAttraction_longitude());
			
			int totalCount = attractionDao.selectAttractionPaging(searchList);
			AttractionPaging paging = new AttractionPaging(totalCount, curPage.getCurPage(), (Integer) searchList.get("listNo"));
					
			return paging;
		} else {
			
			int totalCount = attractionDao.selectAttractionPaging(searchList);
			System.out.println("나값없어?" + totalCount);
			AttractionPaging paging = new AttractionPaging(totalCount, curPage.getCurPage(), (Integer) searchList.get("listNo"));
			System.out.println("나값없어?" + paging);
			
			return paging;
		}
	}

	
	
	@Override
	public List<TB_ATTRACTION> selectAttractionList(HashMap<String, Object> searchList) {
		if( (Integer)searchList.get("chkNumber") == 2) {
			String s = (String) searchList.get("attraction_no");
			TB_ATTRACTION nearBy = attractionDao.selectMarker(s);

			searchList.put("LSWEW", nearBy.getAttraction_latitude());
			searchList.put("lon", nearBy.getAttraction_longitude());
	
		}

		return attractionDao.selectAttractionList(searchList);
	}

	@Override
	public TB_ATTRACTION selectShowList(HashMap<String, Object> searchList) {		

		
		
			return attractionDao.selectShowList(searchList);
			
			
			
		}
	
	@Override
	public TB_ATTRACTION selectMarker(String attraction_no) {
		return attractionDao.selectMarker(attraction_no); 

	}
	
	@Override
	public TB_ATTRACTION selectSubwayList(String attraction_no) {
		TB_ATTRACTION att = attractionDao.selectSubwayList(attraction_no);
		

		return att;
	}
	
	
	@Override
	public boolean visitList(HashMap<String, Object> searchList) {

		if((boolean)searchList.get("delete") == true) {
			attractionDao.visitListDelete(searchList);
			System.out.println("작동했슴니다 지우는거");
		}
		if((boolean)searchList.get("insert") == true) {
			attractionDao.visitListInsert(searchList);
			System.out.println("작동했슴니다 넣는거");
		}
		
		return true;
	}
		
	
	
	
}
