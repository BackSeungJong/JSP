package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import util.DBManager;

public class UserDAO {
	private ArrayList<UserDTO> users = null;

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 싱글톤
	private UserDAO() {

	}

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	// 회원가입시 데이터 검사
	public boolean checkData(String name, String birthdate, String address, String PN, String id, String pw) {

		if (name == "" || birthdate == "" || address == "" || PN == "" || id == "" || pw == "") {
			return false;
		}
		return true;
	}

	// 유저 목록 가져오기
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
		users = getList();
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getName().equals(name)) {
				return users.get(i);
			}
		}
		return null;
	}
	
	// 아이디 찾기
	public UserDTO findId(String id) {
		users = getList();
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getId().equals(id)) {
				return users.get(i);
			}
		}
		return null;
	}

	// 유저 추가
	public boolean addUser(UserDTO newuser) {
		try {
			users = getList();
			Timestamp joindate = new Timestamp(Calendar.getInstance().getTimeInMillis());
			newuser.setJoinDate(joindate);

			conn = DBManager.getConnection();
			String sql = "insert into users(name, birthdate, gender, address, PN, id, pw, joinDate) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newuser.getName());
			pstmt.setString(2, newuser.getBirthdate());
			pstmt.setInt(3, newuser.getGender());
			pstmt.setString(4, newuser.getAddress());
			pstmt.setString(5, newuser.getPN());
			pstmt.setString(6, newuser.getId());
			pstmt.setString(7, newuser.getPw());
			pstmt.setTimestamp(8, newuser.getJoinDate());

			pstmt.executeUpdate();
			users.add(newuser);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println(e);
			System.out.println("addUser err");
		}

		return false;
	}
}
