<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	UserDAO dao = UserDAO.getInstance();

	String name = request.getParameter("name");
	String birthdate = request.getParameter("birthdate");
	String tmp = request.getParameter("gender");
	int gender = Integer.parseInt(tmp);
	String address = request.getParameter("address");
	String PN = request.getParameter("PN");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if (dao.checkData(name, birthdate, address, PN, id, pw)) {
		if (dao.findName(name) != null) {
			String str = String.format("%s님은 이미 가입된 아이디가 존재합니다.", name);
	%>
	<script>
		alert("이미 가입된 이름");
		location.href = "2_login.jsp"
	</script>
	<%
	} else {
	UserDTO newuser = new UserDTO(name, birthdate, gender, address, PN, id, pw);
	if (dao.addUser(newuser)) {
	%>
	<script>
		alert("회원가입이 완료되었습니다.");
		location.href = "1_page.jsp";
	</script>
	<%
	}
	}
	} else {
	%>
	<script>
		alert("정보를 정확히 입력해주세요");
		location.href = "4_join.jsp"
	</script>
	<%
	}
	%>
</body>

</html>