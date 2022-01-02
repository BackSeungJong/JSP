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
				String name = rs.getString(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				int gender = rs.getInt(4);
				String PN = rs.getString(5);
				String email = rs.getString(6);
				String address = rs.getString(7);
				Timestamp joindate = rs.getTimestamp(8);

				users.add(new UserDTO(name, id, pw, gender, PN, email, address, joindate));
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
	public boolean checkData(String name, String id, String pw, String pw2, String PN, String email, String address) {

		if (name == "" || id == "" || pw == "" || pw2 == "" || PN == "" || email == "" || address == "") {
			return false;
		}
		return true;
	}

	// 회원가입
	public boolean addUser(UserDTO user) {
		try {
			users = getList();
			user.setJoindate(new Timestamp(Calendar.getInstance().getTimeInMillis()));

			conn = DBManager.getConnection();
			// INSERT INTO `myshopping`.`users` (`name`, `birthdate`, `gender`, `address`,
			// `PN`, `id`, `pw`, `joinDate`) VALUES ('ew', 'ew', '2', 'ew', 'ew', 'ew',
			// 'ew', '2021-12-30 17:40:00');
			String sql = "insert into users (name, id, pw, gender, PN, email, address, joindate) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getId());
			pstmt.setString(3, user.getPw());
			pstmt.setInt(4, user.getGender());
			pstmt.setString(5, user.getPN());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getAddress());
			pstmt.setTimestamp(8, user.getJoindate());

			pstmt.executeUpdate();
			users.add(user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception

			System.out.println("addUser err");
			System.out.println(e);
		}
		return false;
	}

	public boolean update(String id) {
		
//		for(UserDTO user : users) {
//			System.out.println("[id]:"+user.getId());
//			System.out.println(user);
//			System.out.println(user.getPw());
//			System.out.println(user.getPN());
//			System.out.println(user.getEmail());
//			System.out.println(user.getAddress());
//		}
		
		try {
			conn = DBManager.getConnection();
			for(UserDTO user : users) {
				if(user.getId().equals(id)) {
					//UPDATE `myshopping`.`users` SET `pw` = 'qq', `PN` = 'qq', `address` = 'qq', `email` = 'qq' WHERE (`id` = 'wwww');
					String sql = "update users set pw = ?, PN = ?, address = ?,email = ?  where (id = ?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, user.getPw());
					pstmt.setString(2, user.getPN());
					pstmt.setString(3, user.getAddress());
					pstmt.setString(4, user.getEmail());
					pstmt.setString(5, id);
//					System.out.println("[id]:"+user.getId());
//					System.out.println(user);
//					System.out.println(user.getPw());
//					System.out.println(user.getPN());
//					System.out.println(user.getAddress());
//					System.out.println(user.getEmail());
//					System.out.println("================");
				}
			}
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println("Update err");
		}
		return false;
	}
}
