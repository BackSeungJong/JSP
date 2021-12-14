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
	String tmp = request.getParameter("idx");
	int idx = Integer.parseInt(tmp);
	
	BoardDAO bdao = BoardDAO.getInstance();
	if(bdao.deleteBoard(bdao.boards.get(idx))){
		response.sendRedirect("6_main.jsp");
	} else{
		System.out.println("보드삭제실패");
	}
	%>
</body>
</html>