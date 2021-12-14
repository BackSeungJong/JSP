<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Document</title>
</head>
<body>
	<%
	UserDAO dao = UserDAO.getInstance();
	%>

	<form method="post" action="8_withdrawPro.jsp">
		<input type="hidden" name="id" value="<%=dao.LOG%>"> 
		<span>pw : </span><input type="password" name="pw"> 
		<input type="submit" value="탈퇴">
	</form>
	<div class="div1"></div>


	<%
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("err");
	if (msg != null && msg.equals("err")) {
	%>
	<script>
		$('.div1').append('<p style="color:red">필수 정보입니다.</p>');
	</script>
	<%
	}
	%>
</body>
</html>