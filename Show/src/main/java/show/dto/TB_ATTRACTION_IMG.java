package show.dto;

public class TB_ATTRACTION_IMG {

	private String attraction_img_id;
	private String attraction_id;
	private String attraction_photo;

	@Override
	public String toString() {
		return "TB_ATTRACTION_IMG [attraction_img_id=" + attraction_img_id + ", attraction_id=" + attraction_id
				+ ", attraction_photo=" + attraction_photo + "]";
	}

	public String getattraction_img_id() {
		return attraction_img_id;
	}
	public void setattraction_img_id(String attraction_img_id) {
		this.attraction_img_id = attraction_img_id;
	}
	public String getattraction_id() {
		return attraction_id;
	}
	public void setattraction_id(String attraction_id) {
		this.attraction_id = attraction_id;
	}
	public String getAttraction_photo() {
		return attraction_photo;
	}
	public void setAttraction_photo(String attraction_photo) {
		this.attraction_photo = attraction_photo;
	}
	



	
	
}
