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
	
	
	@Override
	public String toString() {
		return "TB_BOOK [book_id=" + book_id + ", member_id=" + member_id + ", show_id=" + show_id + ", seat_num="
				+ seat_num + ", seat_grade=" + seat_grade + ", book_date=" + book_date + ", seat_price=" + seat_price
				+ "]";
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
}
