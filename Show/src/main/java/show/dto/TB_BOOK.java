package show.dto;


public class TB_BOOK {
	private String book_id;
	private String member_id ;
	private int show_id ;
	private String seat_num ;
	private String seat_grade;
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private String book_date ;
	private int seat_price;
	private String status;
	
	private String show_image;
	private String show_name;
	
	private String payment_date;
	
	
	
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getShow_id() {
		return show_id;
	}
	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public String getSeat_grade() {
		return seat_grade;
	}
	public void setSeat_grade(String seat_grade) {
		this.seat_grade = seat_grade;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public int getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(int seat_price) {
		this.seat_price = seat_price;
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
	@Override
	public String toString() {
		return "TB_BOOK [book_id=" + book_id + ", member_id=" + member_id + ", show_id=" + show_id + ", seat_num="
				+ seat_num + ", seat_grade=" + seat_grade + ", book_date=" + book_date + ", seat_price=" + seat_price
				+ ", status=" + status + ", show_image=" + show_image + ", show_name=" + show_name + ", payment_date="
				+ payment_date + "]";
	}
}
