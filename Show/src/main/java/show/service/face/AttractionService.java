package show.service.face;

import java.util.HashMap;
import java.util.List;

import show.dto.TB_ATTRACTION;
import show.util.AttractionPaging;

public interface AttractionService {

	public AttractionPaging selectAttractionPaging(AttractionPaging curPage, HashMap<String, Object> searchList);

	public TB_ATTRACTION selectMarker(String attraction_no);

	public List<TB_ATTRACTION> selectAttractionList(HashMap<String, Object> searchList);

	public TB_ATTRACTION selectSubwayList(String attraction_no);

	public TB_ATTRACTION selectShowList(HashMap<String, Object> searchList);

	public boolean visitList(HashMap<String, Object> searchList);

	public boolean scrapChk(HashMap<String, Object> searchList);


	



}
