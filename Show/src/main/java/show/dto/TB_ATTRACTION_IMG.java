package show.dto;

public class TB_ATTRACTION_IMG {

	private String attraction_img_no;
	private String attraction_no;
	private String attraction_photo;

	@Override
	public String toString() {
		return "TB_ATTRACTION_IMG [attraction_img_no=" + attraction_img_no + ", attraction_no=" + attraction_no
				+ ", attraction_photo=" + attraction_photo + "]";
	}

	public String getAttraction_img_no() {
		return attraction_img_no;
	}
	public void setAttraction_img_no(String attraction_img_no) {
		this.attraction_img_no = attraction_img_no;
	}
	public String getAttraction_no() {
		return attraction_no;
	}
	public void setAttraction_no(String attraction_no) {
		this.attraction_no = attraction_no;
	}
	public String getAttraction_photo() {
		return attraction_photo;
	}
	public void setAttraction_photo(String attraction_photo) {
		this.attraction_photo = attraction_photo;
	}
	



	
	
}
