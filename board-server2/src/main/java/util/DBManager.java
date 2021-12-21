package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	
	private DBManager() {
		
	}
	private static DBManager instance = new DBManager();
	public DBManager getInstance() {
		return instance;
	}
	
	
	// 모든 DAO 안에서 DB 연동이 필요할 때,
	// Connection conn = DBManager.getConnection();
	
	// 연동된 DB(Schema) 안에 있는 데이터 중, 
	// 어떤 테이블을 쓸지 -> use 스키마명 -> 
	
	public static Connection getConnection() {
		Connection conn = null;
		
		// DB 연동
		try {
			// 드라이버 연동 (jdbc mysql connector(.jar)를 WEB-INF/lib 폴더로 넣어주기
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 주소/스키마이름/파라미터
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC"; // DB 주소
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
