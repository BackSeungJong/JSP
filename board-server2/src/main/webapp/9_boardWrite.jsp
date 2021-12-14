<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<form id="form" method="post" action="10_boardWritePro.jsp">
		게시자 : <br>
		<br> like : <select name="like" id="select">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select><br>
		<br> 제목 : <input type="text" name="title" id="text"><br>
		<br> 내용<br>
		<textarea name="content" id="textarea" cols="50" rows="20"></textarea>
		<br>
		<br> <input type="submit" value="저장">
	</form>
	<div class="div1"></div>
	<%
	request.setCharacterEncoding("utf-8");
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