package model.dto;

import java.sql.Timestamp;

public class UserDTO {
	private String name;
	private String id; // pk
	private String pw;
	private int gender;
	private String PN;
	private String address;
	private String email;
	private Timestamp joindate;
	
	
	// 회원가입
	public UserDTO(String name, String id, String pw, int gender, String PN, String email, String address) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.PN = PN;
		this.email = email;
		this.address = address;
	}
	
	// DB에 넣을 때
	public UserDTO(String name, String id, String pw, int gender, String PN, String email, String address, Timestamp joindate) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.PN = PN;
		this.email = email;
		this.address = address;
		this.joindate = joindate;
	}

	public String getName() {
		return name;
	}


	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getGender() {
		return gender;
	}


	public String getPN() {
		return PN;
	}

	public void setPN(String pN) {
		PN = pN;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getJoindate() {
		return joindate;
	}

	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
}
