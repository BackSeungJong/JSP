<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	String tmp = request.getParameter("idx");
	int idx = Integer.parseInt(tmp);

	BoardDAO bdao = BoardDAO.getInstance();
	bdao.getBoard();
	BoardDTO board = bdao.boards.get(idx);

	int no = board.getNo();
	
	String id = board.getId();
	String pw = board.getPw();
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int like = board.getLike();

	if (title != "" && content != "") {
		BoardDTO bdto = new BoardDTO(no, id, pw, title, content, like);
		bdao.setBoard(idx, bdto);
	%>
	<script>
		alert("게시물이 수정되었습니다.");
		location.href = "6_main.jsp";
	</script>
	<%
	} else {
	%>
	<form id="form" method="post" action="13_boardSet.jsp">
		<input type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" id="hidden" name="err" value="err">
	</form>
	<script>
		document.querySelector('#form').submit();
	</script>
	<%
	}
	%>
	
</body>
</html>