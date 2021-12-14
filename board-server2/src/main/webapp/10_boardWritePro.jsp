<%@page import="com.mysql.cj.xdevapi.AddResultBuilder"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="form" method="post" action="9_boardWrite.jsp">
		<input type="hidden" id="hidden" name="err" value="err">
	</form>
	<%
	request.setCharacterEncoding("utf-8");
	UserDAO dao = UserDAO.getInstance();
	BoardDAO bdao = BoardDAO.getInstance();

	String id = dao.LOG;
	String pw = dao.getUserPw(id);
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int like = Integer.parseInt(request.getParameter("like"));

	if (title != "" && content != "") {
		BoardDTO bdto = new BoardDTO(id, pw, title, content, like);
		bdao.addBoard(bdto);
	%>
	<script>
		alert("게시물이 작성되었습니다.");
		location.href = "6_main.jsp";
	</script>
	<%
	} else {
	%>
	<script>
		document.querySelector('#form').submit();
	</script>
	<%
	}
	%>


</body>
</html>