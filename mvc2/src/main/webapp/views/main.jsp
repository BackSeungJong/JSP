<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<h1>MAIN 페이지</h1>
	<h3><%=id %>님 환영합니다.</h1>
	<h3>비밀번호: <%=pw %></h1>
</body>
</html>