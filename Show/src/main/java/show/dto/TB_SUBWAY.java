package show.dto;

public class TB_SUBWAY {
                                       
	private String subway_no;
	private String subway_name;
	private String subway_line;
	private String subway_addr1;
	private String subway_addr2;
	private String subway_addrdetail;
	private String subway_tel;
	private String subway_latitude;
	private String subway_longitude;

	@Override
	public String toString() {
		return "TB_SUBWAY [subway_no=" + subway_no + ", subway_name=" + subway_name + ", subway_line=" + subway_line
				+ ", subway_addr1=" + subway_addr1 + ", subway_addr2=" + subway_addr2 + ", subway_addrdetail="
				+ subway_addrdetail + ", subway_tel=" + subway_tel + ", subway_latitude=" + subway_latitude
				+ ", subway_longitude=" + subway_longitude + "]";
	}

	public String getSubway_no() {
		return subway_no;
	}
	public void setSubway_no(String subway_no) {
		this.subway_no = subway_no;
	}
	public String getSubway_name() {
		return subway_name;
	}
	public void setSubway_name(String subway_name) {
		this.subway_name = subway_name;
	}
	public String getSubway_line() {
		return subway_line;
	}
	public void setSubway_line(String subway_line) {
		this.subway_line = subway_line;
	}
	public String getSubway_addr1() {
		return subway_addr1;
	}
	public void setSubway_addr1(String subway_addr1) {
		this.subway_addr1 = subway_addr1;
	}
	public String getSubway_addr2() {
		return subway_addr2;
	}
	public void setSubway_addr2(String subway_addr2) {
		this.subway_addr2 = subway_addr2;
	}
	public String getSubway_addrdetail() {
		return subway_addrdetail;
	}
	public void setSubway_addrdetail(String subway_addrdetail) {
		this.subway_addrdetail = subway_addrdetail;
	}
	public String getSubway_tel() {
		return subway_tel;
	}
	public void setSubway_tel(String subway_tel) {
		this.subway_tel = subway_tel;
	}
	public String getSubway_latitude() {
		return subway_latitude;
	}
	public void setSubway_latitude(String subway_latitude) {
		this.subway_latitude = subway_latitude;
	}
	public String getSubway_longitude() {
		return subway_longitude;
	}
	public void setSubway_longitude(String subway_longitude) {
		this.subway_longitude = subway_longitude;
	}
	
	
	
	
	
}
