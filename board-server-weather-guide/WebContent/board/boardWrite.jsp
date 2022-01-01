<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty loginUser}">
	<jsp:forward page='login.do' />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/board_rw.css">
<script type="text/javascript" src="script/board.js"></script>
<title>community</title>
</head>
<body>
	<%
	session.setAttribute("command", "board_write"); // multipart/form-data때문에 세션을 통해 커맨드 전송
	%>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="wrap" align="center">
		<p>게시글 등록
		<p>
		<form name="frm" method="post"
			action="BoardServlet?command=board_write"
			enctype="multipart/form-data">
			<!--  <input type="hidden" name="command" value="board_write">  -->
			<table id="list">
				<tr>
					<th class="w3-pale-green">작성자</th>
					<td><input type="text" name="name" value="${loginUser.userid}"
						readonly></td>
				</tr>
				<tr>
					<th class="w3-pale-green">이메일</th>
					<td><input type="text" name="email" value="${loginUser.email}"
						readonly></td>
				</tr>
				<tr>
					<th class="w3-pale-green">사 진</th>
					<td><input type="file"
						accept="image/png, image/gif, image/jpeg" name="pictureUrl"><br></td>
				</tr>
				<tr>
					<th class="w3-pale-green">제목</th>
					<td><input type="text" size="70" name="title"> * 필수</td>
				</tr>
				<tr>
					<th class="w3-pale-green">내용</th>
					<td><textarea cols="70" rows="15" name="content"></textarea></td>
				</tr>
			</table>
			<br> <input type="submit" value="등록"> <input
				type="reset" value="다시 작성"> <input type="button" value="목록"
				onclick="location.href='BoardServlet?command=board_list&page=1'">
			<br> <br> <br>
		</form>
	</div>
</body>
</html>