package show.dto;

public class TB_SEAT {
	private int show_id;
	private int seatr_cnt;
	private int seats_cnt;
	@Override
	public String toString() {
		return "TB_SEAT [show_id=" + show_id + ", seatr_cnt=" + seatr_cnt + ", seats_cnt=" + seats_cnt + "]";
	}
	public int getShow_id() {
		return show_id;
	}
	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}
	public int getSeatr_cnt() {
		return seatr_cnt;
	}
	public void setSeatr_cnt(int seatr_cnt) {
		this.seatr_cnt = seatr_cnt;
	}
	public int getSeats_cnt() {
		return seats_cnt;
	}
	public void setSeats_cnt(int seats_cnt) {
		this.seats_cnt = seats_cnt;
	}
}
