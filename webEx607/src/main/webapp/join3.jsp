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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");//
	String pw = request.getParameter("pw");//
	String pw2 = request.getParameter("pw2");//
	String name = request.getParameter("name");//
	String year = request.getParameter("year");//
	String month = request.getParameter("month");//
	String date = request.getParameter("date");//
	String gender = request.getParameter("gender");//
	String email = request.getParameter("email");
	String nation = request.getParameter("nation");//
	String phone = request.getParameter("phone");//
	
	%>
	<div class="div"></div>
	<form class="form" method="get" action="join2.jsp">
		<input type="hidden" name="back" value="back">
	</form>

	<script>
		if('<%=id %>'===""||'<%=pw %>'===""||'<%=pw2 %>'===""||'<%=name %>'===""||
				'<%=year %>'===""||'<%=month %>'===""||'<%=date %>'===""||'<%=gender %>'===""||
				'<%=nation %>'===""||'<%=phone %>'===""){
			<%-- alert("<%=id %>");
			alert("<%=pw %>");
			alert("<%=pw2 %>");
			alert("<%=name %>");
			alert("<%=year %>");
			alert("<%=month %>");
			alert("<%=date %>");
			alert("gender : <%=gender %>");
			alert("<%=email %>");
			alert("nateion : <%=nation %>");
			alert("<%=phone %>"); --%>
			//location.href="join2.jsp";
			
			 const form = document.querySelector('.form');
	         form.submit();
		}else{
			console.log("<%=id %>");
			console.log("<%=pw %>");
			console.log("<%=pw2 %>");
			console.log("<%=name %>");
			console.log("<%=year %>");
			console.log("<%=month %>");
			console.log("<%=date %>");
			console.log("gender : <%=gender %>");
			console.log("<%=email %>");
			console.log("nateion : <%=nation %>");
			console.log("<%=phone %>");
			document.querySelector('.div').append('가입이 완료되었습니다.');
		}
		
	
	</script>
</body>
</html>