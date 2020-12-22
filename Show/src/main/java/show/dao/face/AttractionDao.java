package show.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import show.dto.TB_ATTRACTION;
import show.dto.TB_SUBWAY;

public interface AttractionDao {

	public int selectListPaging();

	public int selectAttractionPaging(HashMap<String, Object> searchList);

	public int selectAreaList(String area);
	
	public TB_ATTRACTION selectMarker(String attraction_no);

	public List<TB_ATTRACTION> selectAttractionList(HashMap<String, Object> searchList);

	public TB_ATTRACTION selectSubwayList(String name);

	public TB_ATTRACTION selectShowList(HashMap<String, Object> nearBysearch);

	public TB_ATTRACTION selectSubwayDist(TB_ATTRACTION subway);

	public List<TB_SUBWAY> selectSubwayAllList();

	public List<TB_SUBWAY> selectDist(@Param("lat1") String lat1,@Param("lon1") String lon1,@Param("lat2") String lat2,@Param("lon2") String lon2, @Param("subway_name") String name);


	public void visitListInsert(HashMap<String, Object> searchList);

	public void visitListDelete(HashMap<String, Object> searchList);

	public boolean scrapChk(HashMap<String, Object> searchList);






	
}
