package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class BoardDAO {
	public ArrayList<BoardDTO> boards = null;

	// 싱클톤
	private BoardDAO() {
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// getConnection
	private Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 주소/스키마이름/파라미터
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC"; // DB 주소
			String id = "root";
			String pw = "180517";

			conn = DriverManager.getConnection(url, id, pw);

		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println("BoradDAO > getConnection ERR");
		}
		return conn;
	}

	// getBoard()
	public ArrayList<BoardDTO> getBoard() {
		try {
			boards = new ArrayList<BoardDTO>();

			conn = getConnection();
			String sql = "select * from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				int like = rs.getInt(6);
				Timestamp regDate = rs.getTimestamp(7);

				boards.add(new BoardDTO(no, id, pw, title, content, like, regDate));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		return boards;
	}

	// addBoard()
	public boolean addBoard(BoardDTO board) {
		try {
			BoardDTO newboard = new BoardDTO(board.getId(), board.getPw(), board.getTitle(), board.getContent(),
					board.getLike(), new Timestamp(Calendar.getInstance().getTimeInMillis()));

			conn = getConnection();
			String sql = "INSERT INTO `board`.`board` (`id`, `pw`, `title`, `content`, `like`, `regDate`) VALUES (?,?,?,?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newboard.getId());
			pstmt.setString(2, newboard.getPw());
			pstmt.setString(3, newboard.getTitle());
			pstmt.setString(4, newboard.getContent());
			pstmt.setInt(5, newboard.getLike());
			pstmt.setTimestamp(6, newboard.getRegDate());

			pstmt.executeUpdate();
			boards.add(newboard);
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println();
		}
		return false;
	}

	// deleteBoard()
	public boolean deleteBoard(BoardDTO board) {
		try {
			boards = getBoard();

			conn = getConnection();
			String sql = "delete from board where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNo());
			pstmt.executeUpdate();
			boards.remove(board);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println("deleteBoard ERR");
		}
		return false;
	}

	// setBoard()
	public void setBoard(int idx, BoardDTO board) {
		try {
			BoardDTO newboard = new BoardDTO(board.getNo(), board.getId(), board.getPw(), board.getTitle(),
					board.getContent(), board.getLike(), new Timestamp(Calendar.getInstance().getTimeInMillis()));
			boards = getBoard();
			
			conn = getConnection();
//			String sql = "UPDATE `board`.`board` SET `title` = '?', `content` = '?', `like` = '?', `regDate` = '?' WHERE (`no` = '?')";
			String sql = "UPDATE board SET title=?, content=? WHERE no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newboard.getTitle());
			pstmt.setString(2, newboard.getContent());
//			pstmt.setInt(3, newboard.getLike());
//			pstmt.setTimestamp(3, newboard.getRegDate());
			pstmt.setInt(3, newboard.getNo());

			pstmt.executeUpdate();
			boards.set(idx, newboard);
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println(e);
			System.out.println("setBoard ERR");
		}
//		System.out.println(idx); // 1
//		System.out.println(board.getNo()); // 10
	}
}
