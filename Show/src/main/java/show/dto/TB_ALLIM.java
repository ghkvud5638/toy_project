package show.dto;

public class TB_ALLIM {
	
	private String allim_id;
	private int show_id;
	private String member_id;
	private String status ;
	private String show_image;
	private String show_name ;
	private String book_date ;
	private String is_read ;
	@Override
	public String toString() {
		return "TB_ALLIM [allim_id=" + allim_id + ", show_id=" + show_id + ", member_id=" + member_id + ", status="
				+ status + ", show_image=" + show_image + ", show_name=" + show_name + ", book_date=" + book_date
				+ ", is_read=" + is_read + "]";
	}
	public String getAllim_id() {
		return allim_id;
	}
	public void setAllim_id(String allim_id) {
		this.allim_id = allim_id;
	}
	public int getShow_id() {
		return show_id;
	}
	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getShow_image() {
		return show_image;
	}
	public void setShow_image(String show_image) {
		this.show_image = show_image;
	}
	public String getShow_name() {
		return show_name;
	}
	public void setShow_name(String show_name) {
		this.show_name = show_name;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getIs_read() {
		return is_read;
	}
	public void setIs_read(String is_read) {
		this.is_read = is_read;
	}
}
