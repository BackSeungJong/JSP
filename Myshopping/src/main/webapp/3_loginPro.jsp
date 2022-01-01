<%@page import="user.UserDTO"%>
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
	<form id="refuse" method="post" action="2_login.jsp">
		<input type="hidden" name="refuse" value="refuse">
	</form>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if (id != "" && pw != "") {
		UserDAO instance = UserDAO.getInstance();
		UserDTO user = instance.findUser(id);
		if (user == null) {
			System.out.println("user가 null입니다.");
		} else {
			System.out.println("user가 존재합니다.");
		}
	} else {

	}
	%>

</body>
</html>