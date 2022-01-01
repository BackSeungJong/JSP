<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The way back home</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<h2>아이디 중복확인</h2>
	<form action="idCheck.do" method="get" name="frm">
		아이디 <input type=text name="userid" value="${userid}"> <input
			type=submit value="중복 체크"> <br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.userid.value = "";
			</script>
			<br>${userid}는 이미 사용 중인 아이디입니다.
		</c:if>
		<c:if test="${result==-1}">
			<br>${userid}는 사용 가능한 아이디입니다.
		<input type="button" value="사용" class="cancel"
				onclick="idok('${userid}')">
		</c:if>
	</form>
</body>
</html>