package board;

import java.sql.Timestamp;

public class BoardDTO {
	private int no;
	private String id;
	private String pw;
	private String title;
	private String content;
	private int like;
	private Timestamp regDate;
	
	public BoardDTO(String id,String pw, String title, String content, int like) {
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.like = like;
	}
	// db에 넣을때
	public BoardDTO(String id, String pw, String title, String content, int like, Timestamp regDate) {
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.like = like;
		this.regDate = regDate;
	}
	
	// db에서 가져올때는 이렇게
	public BoardDTO(int no, String id, String pw, String title, String content, int like, Timestamp regDate) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.like = like;
		this.regDate = regDate;
	}
	
	// 수정할때
	public BoardDTO(int no, String id, String pw, String title, String content, int like) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.like = like;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
}
