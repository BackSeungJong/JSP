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
 	<form id="form" method="post" action="7_withdraw.jsp">
        <input type="hidden" id="hidden" name="err" value="err">
    </form>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if (id != "" && pw != "") {
		UserDAO dao = UserDAO.getInstance();
		if (dao.deleteUser(id, pw)) {
			response.sendRedirect("1_entrance.jsp");
		} else {%>
			<script >
				alert("비밀번호를 잘못입력하셨습니다.");
				location.href = "6_main.jsp";
			</script>
		<%	
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