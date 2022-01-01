package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {

	public static Connection getConnection() {
		Connection conn = null;
		// TODO Auto-generated method stub
		try {
			// 드라이버 연동 (jdbc mysql connector(.jar)를 WEB-INF/lib 폴더로 넣어주기
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 주소/스키마이름/파라미터
			String url = "jdbc:mysql://localhost:3306/myshopping?serverTimezone=UTC"; // DB 주소
			String id = "root";
			String pw = "180517";

			conn = DriverManager.getConnection(url, id, pw);

			/*
			 * if (conn != null) { System.out.println("데이터베이스 연동 성공"); }
			 */
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("데이터베이스 연동 실패");
		}
		return conn;
	}

}
