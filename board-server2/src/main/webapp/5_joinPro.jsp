<%@page import="org.apache.catalina.connector.Response"%>
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
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	UserDAO dao = UserDAO.getInstance();
	
	if(dao.addUser(new UserDTO(id,pw))){%>
	<script>
		alert("회원가입 성공");
		location.href = "2_login.jsp";
	</script>	
	<%
	}else{
		%>
		<script>
			alert("중복된 아이디입니다.");
			location.href = "1_entrance.jsp";
		</script>	
	<%
	}
	%>
</body>
</html>