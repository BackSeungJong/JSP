package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;

import org.apache.catalina.mbeans.ClassNameMBean;

import util.DBManager;

// Data Access Object = 컨트롤러
public class UserDAO {
	private ArrayList<UserDTO> users = null;

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public static String LOG = "";

	// getInstace()
	private UserDAO() {
	}

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	// getConnection
//	private Connection getConnection() {
//		try {
//			// 드라이버 연동 (jdbc mysql connector(.jar)를 WEB-INF/lib 폴더로 넣어주기
//			Class.forName("com.mysql.cj.jdbc.Driver");
//
//			// 주소/스키마이름/파라미터
//			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC"; // DB 주소
//			String id = "root";
//			String pw = "180517";
//
//			conn = DriverManager.getConnection(url, id, pw);
//
//			/*
//			 * if (conn != null) { System.out.println("데이터베이스 연동 성공"); }
//			 */
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			System.out.println("데이터베이스 연동 실패");
//		}
//		return conn;
//	}

	// getUser()
	public ArrayList<UserDTO> getUser() {

		try {
			conn = DBManager.getConnection();

			String str = "select * from users";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();

			users = new ArrayList<UserDTO>();
			while (rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				Timestamp regDate = rs.getTimestamp(3);
				users.add(new UserDTO(id, pw, regDate));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println("getUser ERROR");
		}

		return users;
	}

	// addUser()
	public boolean addUser(UserDTO user) {
		if (checkId(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(),
						new Timestamp(Calendar.getInstance().getTimeInMillis()));
				conn = DBManager.getConnection();

				String str = "insert into users values(?,?,?)";
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, newUser.getId());
				pstmt.setString(2, newUser.getPw());
				pstmt.setTimestamp(3, newUser.getRegDate());

				pstmt.executeUpdate();
				users.add(newUser);
				return true;
			} catch (Exception e) {
				// TODO: handle exception
				e.getStackTrace();
				System.out.println("addUser ERROR");
			}
		}
		return false;
	}

	private boolean checkId(String id) {
		users = getUser();
		for (UserDTO user : users) {
			if (id.equals(user.getId())) {
				return false;
			}
		}
		return true;
	}

	// deleteUser() = 탈퇴
	public boolean deleteUser(String id, String pw) {
		users = getUser();

		int idx = -1;
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getId().equals(id) && users.get(i).getPw().equals(pw)) {
				idx = i;
			}
		}

		if (idx != -1) {
			try {

				conn = DBManager.getConnection();
				String sql = "delete from users where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				pstmt.executeUpdate();
				users.remove(idx);
				return true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("deleteUser err");
			}
		}
		return false;
	}

	// userLogin()
	public boolean userLogin(String id, String pw) {
		users = getUser();
		for (UserDTO user : users) {
			if (user.getId().equals(id) && user.getPw().equals(pw)) {
				LOG = id;
				System.out.println(LOG + "님이 로그인하셨습니다.");
				return true;
			}
		}
		return false;
	}

	// getUserInfo()
	public String getUserPw(String id) {
		String result = "";
		try {
			users = getUser();
			for (UserDTO user : users) {
				if (user.getId().equals(id)) {
					result = user.getPw();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		System.out.println("가져온 pw "+result);
		return result;
	}
}
