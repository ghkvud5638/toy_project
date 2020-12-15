package show.dto;

public class Recommend {
	private String userid;
	private int boardNo;

	@Override
	public String toString() {
		return "Recommend [userid=" + userid + ", boardNo=" + boardNo + "]";
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

}
