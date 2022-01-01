package model.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int no;
	private String id;
	private String pw;
	private String title;
	private String content;
	private Timestamp regDate;
	private int like;
	private int hate;

	// 게시물 작성할때
	public BoardDTO(String id, String pw, String title, String content) {
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
	}

	// 게시물 db에 넣을 때
	public BoardDTO(int no, String id, String pw, String title, String content, Timestamp regDate) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}

	// 게시물 db에 넣을 때
	public BoardDTO(int no, String id, String pw, String title, String content, Timestamp regDate, int like, int hate) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.like = like;
		this.hate = hate;
	}

	public int getNo() {
		return no;
	}

	public String getId() {
		return id;
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

	public Timestamp getRegDate() {
		return regDate;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getHate() {
		return hate;
	}

	public void setHate(int hate) {
		this.hate = hate;
	}

}
