package show.dto;

public class TB_NAVIGATION_BAR {
	
	private String scrap_id;
	private String visit_id;
	private String attraction_id;
	private String show_id;
	private String member_id;

	@Override
	public String toString() {
		return "TB_NAVIGATION_BAR [scrap_id=" + scrap_id + ", visit_id=" + visit_id + ", attraction_id=" + attraction_id
				+ ", show_id=" + show_id + ", member_id=" + member_id + "]";
	}
	public String getScrap_id() {
		return scrap_id;
	}
	public void setScrap_id(String scrap_id) {
		this.scrap_id = scrap_id;
	}
	public String getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(String visit_id) {
		this.visit_id = visit_id;
	}
	public String getAttraction_id() {
		return attraction_id;
	}
	public void setAttraction_id(String attraction_id) {
		this.attraction_id = attraction_id;
	}
	public String getShow_id() {
		return show_id;
	}
	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	

}
