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
	 <form id="form" method="post" action="2_login.jsp">
        <input type="hidden" id="hidden" name="err" value="err">
    </form>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if (id != "" && pw != "") {
		UserDAO dao = UserDAO.getInstance();
		if (dao.userLogin(id, pw)) {
			response.sendRedirect("6_main.jsp");
		} else {
			response.sendRedirect("1_entrance.jsp");
		}
	}else{%>
		 <script>
      		 document.querySelector('#form').submit();
   		 </script>
	<%
	}
	%>

</body>
</html>