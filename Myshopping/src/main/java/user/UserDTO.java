package user;

import java.sql.Timestamp;
import java.time.LocalDate;

public class UserDTO {
	private int no;
	private String name;
	private String birthdate;
	private int gender;
	private String address;
	private String PN;

	private String id; // 프라이머리 키
	private String pw;
	private Timestamp joinDate; // 가입날짜

	private int height;
	private int weight;

	// 회원 가입 할때
	public UserDTO(String name, String birthdate, int gender, String address, String PN, String id, String pw) {
		this.name = name;
		this.birthdate = birthdate;
		this.gender = gender;
		this.address = address;
		this.PN = PN;
		this.id = id;
		this.pw = pw;
	}
	
	// 회원 가입 최종
	public UserDTO(String name, String birthdate, int gender, String address, String PN, String id, String pw,
			Timestamp joinDate) {
		this.name = name;
		this.birthdate = birthdate;
		this.gender = gender;
		this.address = address;
		this.PN = PN;
		this.id = id;
		this.pw = pw;
		this.joinDate = joinDate;
	}

	// db로 부터 정보를 받아왔을 때
	// 몸무게, 키 O
	public UserDTO(int no, String name, String birthdate, int gender, String address, String PN, String id, String pw,
			Timestamp joinDate, int height, int weight) {
		this.no = no;
		this.name = name;
		this.birthdate = birthdate;
		this.gender = gender;
		this.address = address;
		this.PN = PN;
		this.id = id;
		this.pw = pw;
		this.joinDate = joinDate;
		this.height = height;
		this.weight = weight;
	}

	// 몸무게, 키 X
	public UserDTO(int no, String name, String birthdate, int gender, String address, String PN, String id, String pw,
			Timestamp joinDate) {
		this.no = no;
		this.name = name;
		this.birthdate = birthdate;
		this.gender = gender;
		this.address = address;
		this.PN = PN;
		this.id = id;
		this.pw = pw;
		this.joinDate = joinDate;
	}
	
	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public int getGender() {
		return gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPN() {
		return PN;
	}

	public void setPN(String pN) {
		PN = pN;
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

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
}
