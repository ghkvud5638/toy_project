package show.dto;

import java.util.List;

public class TB_ATTRACTION {
		                                 
	private String attraction_no;
	private String attraction_title;
	private String attraction_content;
	private String attraction_tel;
	private String attraction_category1;
	private String attraction_category2;
	private String attraction_area1;
	private String attraction_area2;
	private String attraction_area3;
	private String attraction_addr;
	private String attraction_latitude;
	private String attraction_longitude;
	
	private TB_NAVIGATION_BAR nav_bar;
	
	private List<TB_ATTRACTION_IMG> attraction;

	private List<TB_SUBWAY> subway;
	private List<TB_SHOW> show;
	
	@Override
	public String toString() {
		return "TB_ATTRACTION [attraction_no=" + attraction_no + ", attraction_title=" + attraction_title
				+ ", attraction_content=" + attraction_content + ", attraction_tel=" + attraction_tel
				+ ", attraction_category1=" + attraction_category1 + ", attraction_category2=" + attraction_category2
				+ ", attraction_area1=" + attraction_area1 + ", attraction_area2=" + attraction_area2
				+ ", attraction_area3=" + attraction_area3 + ", attraction_addr=" + attraction_addr
				+ ", attraction_latitude=" + attraction_latitude + ", attraction_longitude=" + attraction_longitude
				+ ", nav_bar=" + nav_bar + ", attraction=" + attraction + ", subway=" + subway + ", show=" + show + "]";
	}

	public String getAttraction_no() {
		return attraction_no;
	}
	public void setAttraction_no(String attraction_no) {
		this.attraction_no = attraction_no;
	}
	public String getAttraction_title() {
		return attraction_title;
	}
	public void setAttraction_title(String attraction_title) {
		this.attraction_title = attraction_title;
	}
	public String getAttraction_content() {
		return attraction_content;
	}
	public void setAttraction_content(String attraction_content) {
		this.attraction_content = attraction_content;
	}
	public String getAttraction_tel() {
		return attraction_tel;
	}
	public void setAttraction_tel(String attraction_tel) {
		this.attraction_tel = attraction_tel;
	}
	public String getAttraction_category1() {
		return attraction_category1;
	}
	public void setAttraction_category1(String attraction_category1) {
		this.attraction_category1 = attraction_category1;
	}
	public String getAttraction_category2() {
		return attraction_category2;
	}
	public void setAttraction_category2(String attraction_category2) {
		this.attraction_category2 = attraction_category2;
	}
	public String getAttraction_area1() {
		return attraction_area1;
	}
	public void setAttraction_area1(String attraction_area1) {
		this.attraction_area1 = attraction_area1;
	}
	public String getAttraction_area2() {
		return attraction_area2;
	}
	public void setAttraction_area2(String attraction_area2) {
		this.attraction_area2 = attraction_area2;
	}
	public String getAttraction_area3() {
		return attraction_area3;
	}
	public void setAttraction_area3(String attraction_area3) {
		this.attraction_area3 = attraction_area3;
	}
	public String getAttraction_addr() {
		return attraction_addr;
	}
	public void setAttraction_addr(String attraction_addr) {
		this.attraction_addr = attraction_addr;
	}
	public String getAttraction_latitude() {
		return attraction_latitude;
	}
	public void setAttraction_latitude(String attraction_latitude) {
		this.attraction_latitude = attraction_latitude;
	}
	public String getAttraction_longitude() {
		return attraction_longitude;
	}
	public void setAttraction_longitude(String attraction_longitude) {
		this.attraction_longitude = attraction_longitude;
	}


	
	
	public TB_NAVIGATION_BAR getNav_bar() {
		return nav_bar;
	}

	public void setNav_bar(TB_NAVIGATION_BAR nav_bar) {
		this.nav_bar = nav_bar;
	}

	public List<TB_ATTRACTION_IMG> getAttraction() {
		return attraction;
	}

	public void setAttraction(List<TB_ATTRACTION_IMG> attraction) {
		this.attraction = attraction;
	}

	public List<TB_SUBWAY> getSubway() {
		return subway;
	}
	public void setSubway(List<TB_SUBWAY> subway) {
		this.subway = subway;
	}
	public List<TB_SHOW> getShow() {
		return show;
	}
	public void setShow(List<TB_SHOW> show) {
		this.show = show;
	}

	


	
	
}
