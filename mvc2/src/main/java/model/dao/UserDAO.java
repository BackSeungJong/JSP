package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import model.dto.UserDTO;
import util.DBManager;

public class UserDAO {
	// 싱글톤
	private UserDAO() {
	}

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	ArrayList<UserDTO> users = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<UserDTO> getList() {

		try {
			users = new ArrayList<UserDTO>();
			conn = DBManager.getConnection();
			String str = "select * from users";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt(1);
				String name = rs.getString(2);
				String birthdate = rs.getString(3);
				int gender = rs.getInt(4);
				String address = rs.getString(5);
				String PN = rs.getString(6);
				String id = rs.getString(7);
				String pw = rs.getString(8);
				Timestamp joinDate = rs.getTimestamp(9);
				int height = rs.getInt(10);
				int weight = rs.getInt(11);

				if (height == 0 && weight == 0) {
					users.add(new UserDTO(no, name, birthdate, gender, address, PN, id, pw, joinDate));
				} else {
					users.add(new UserDTO(no, name, birthdate, gender, address, PN, id, pw, joinDate, height, weight));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getList err");
		}
		return users;
	}

	// 이름 찾기
	public UserDTO findName(String name) {
		try {
			users = getList();

			for (UserDTO index : users) {
				if (index.getName().equals(name)) {
					return index;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("findId err");
		}
		return null;
	}

	// 아이디 찾기
	public UserDTO findId(String id) {
		try {
			users = getList();

			for (UserDTO index : users) {
				if (index.getId().equals(id)) {
					return index;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("findId err");
		}
		return null;
	}

	// 아이디 비번으로 찾기
	public UserDTO findId(String id, String pw) {
		try {
			users = getList();

			for (UserDTO index : users) {
				if (index.getId().equals(id) && index.getPw().equals(pw)) {
					return index;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("findId err");
		}
		return null;
	}

	// 회원가입시 데이터 검사
	public boolean checkData(String name, String birthdate, String address, String PN, String id, String pw,
			String pw2) {

		if (name == "" || birthdate == "" || address == "" || PN == "" || id == "" || pw == "" || pw2 == "") {
			return false;
		}
		return true;
	}

	// 회원가입
	public boolean addUser(UserDTO user) {
		try {
			users = getList();
			user.setJoinDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));

			conn = DBManager.getConnection();
			// INSERT INTO `myshopping`.`users` (`name`, `birthdate`, `gender`, `address`,
			// `PN`, `id`, `pw`, `joinDate`) VALUES ('ew', 'ew', '2', 'ew', 'ew', 'ew',
			// 'ew', '2021-12-30 17:40:00');
			String sql = "insert into users (name, birthdate, gender, address, PN, id, pw, joinDate) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getBirthdate());
			pstmt.setInt(3, user.getGender());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getPN());
			pstmt.setString(6, user.getId());
			pstmt.setString(7, user.getPw());
			pstmt.setTimestamp(8, user.getJoinDate());

			pstmt.executeUpdate();
			users.add(user);

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println("addUser err");
			System.out.println(e);
		}
		return false;
	}
}
