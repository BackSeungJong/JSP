package user;

import java.sql.Timestamp;

// Data Transfer Object
public class UserDTO {
	private String id;
	private String pw;
	private Timestamp regDate;

	public UserDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public UserDTO(String id, String pw, Timestamp regDate) {
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
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

	public Timestamp getRegDate() {
		return regDate;
	}
}
