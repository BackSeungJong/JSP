<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String tmp = request.getParameter("idx");
	int idx = Integer.parseInt(tmp);
	
	BoardDAO bdao = BoardDAO.getInstance();
	BoardDTO board = bdao.boards.get(idx);
	%>
	<form id="form" method="post" action="14_boardSetPro.jsp">
		게시자 :<%=board.getId()%><br> <br> 
		like : <%=board.getLike() %><br> <br> 
		제목 : <input type="text" name="title" id="text"><br>	<br> 
		내용<br>
		<textarea name="content" id="textarea" cols="50" rows="20"></textarea>
		
		<input type="hidden" name="idx" value="<%=idx%>"> <br> <br>
		<input type="submit" value="저장">
	</form>
	<div class="div1"></div>
	<%
	String msg = request.getParameter("err");
	if (msg != null && msg.equals("err")) {
	%>
	<script>
		$('.div1').append('<p style="color:red">제목, 내용을 입력해주세요.</p>');
	</script>
	<%
	}
	%>
</body>
</html>