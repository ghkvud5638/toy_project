package show.dto;

import java.util.Date;

public class Member {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String birth;
	private String gender;
	private String member_addr;
	private String nick;
	private int point;
	private String email;	
	private String member_grade;
	private String member_spot;
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", birth=" + birth + ", gender=" + gender + ", member_addr=" + member_addr + ", nick=" + nick
				+ ", point=" + point + ", email=" + email + ", member_grade=" + member_grade + ", member_spot="
				+ member_spot + "]";
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_spot() {
		return member_spot;
	}
	public void setMember_spot(String member_spot) {
		this.member_spot = member_spot;
	}	
}
