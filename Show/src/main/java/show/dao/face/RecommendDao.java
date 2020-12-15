package show.dao.face;

import show.dto.Recommend;

public interface RecommendDao {

	public int selectCntRecommend(Recommend recommend);

	public void insertRecommend(Recommend recommend);
	
	public void deleteRecommend(Recommend recommend);
	
	public int selectTotalCntRecommend(Recommend recommend);
	
}
















