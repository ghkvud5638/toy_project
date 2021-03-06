package show.dto;

public class Email{
	private String from;
	private String to;
	private String subject;
	private String contents;
	@Override
	public String toString() {
		return "MAIL [from=" + from + ", to=" + to + ", subject=" + subject + ", contents=" + contents + "]";
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}
