package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.BoardDTO;
import util.DBManager;

public class BoardDAO {
	ArrayList<BoardDTO> boards = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<BoardDTO> getList() {
		boards = new ArrayList<BoardDTO>();
		try {
			conn = DBManager.getConnection();
			String sql = "select * from boards";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				Timestamp regDate = rs.getTimestamp(6);
				int like = rs.getInt(7);
				int hate = rs.getInt(8);

				boards.add(new BoardDTO(no, id, pw, title, content, regDate, like, hate));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("[BoardDAO] >> getList err");
		}
		return boards;
	}
}
