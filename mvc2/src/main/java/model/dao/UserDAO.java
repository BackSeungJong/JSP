package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.UserDTO;
import util.DBManager;

public class UserDAO {
	// 싱글톤
	private UserDAO() {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	ArrayList<UserDTO> users = null;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<UserDTO> getList(){
		try {
			users = new ArrayList<UserDTO>();
			conn = DBManager.getConnection();
			
			String sql = "select * from users";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				Timestamp regDate = rs.getTimestamp(3);
				
				users.add(new UserDTO(id, pw, regDate));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getList err");
		}
		return users;
	}
	
	// 아이디 비번으로 찾기
	public UserDTO findId(String id, String pw){
		try {
			users = getList();
			
			for(UserDTO index : users) {
				if(index.getId().equals(id)&& index.getPw().equals(pw)) {
					return index;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("findId err");
		}
		return null;
	}
}
