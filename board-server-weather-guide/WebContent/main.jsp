<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty loginUser}">
	<jsp:forward page='login.do' />
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>community</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="script/parallax.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="parallax_window_div1" data-parallax="scroll"
		data-image-src="">
		<br>
		<br>
		<br>

		<div class="div2">
			<h1>Interstella</h1>
			<p>
				Do not go gentle into that <b>Good Night</b>.
			</p>
		</div>
	</div>

	<div class="outwrap">
		<div class="inwrap" style="margin-top: 10px">
			<br> '${loginUser.userid}'님 환영합니다. &nbsp; <input type="button"
				value="내정보" onclick="location.href='member/memberInfo.jsp'"
				class="w3-button w3-round w3-padding-small w3-dark-grey"> <input
				type="button" value="로그아웃" onclick="location.href='logout.do'"
				class="w3-button w3-round w3-padding-small w3-dark-grey"></br> <br>
			<div class="contents1">
				<figure class="snip1384">
					<img src="img/sky.jpg" alt="sample83" height="430px" />
					<figcaption>
						<h2>날씨</h2>
						<p>description</p>
					<iframe src='weather.jsp' style="border:none"></iframe>
						<i class="ion-ios-arrow-right"></i>
					</figcaption>
					<a href="weather.jsp"></a>
				</figure>
			</div>
			<div class="contents2">
				<figure class="snip1384">
					<img src="img/board.jpg" alt="sample83" height="430px" />
					<figcaption>
						<h2>게시판 바로 가기</h2>
						<p>description</p>
						<i class="ion-ios-arrow-right"></i>
					</figcaption>
					<a href="BoardServlet?command=board_list"></a>
				</figure>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
</body>


<script type="text/javascript">
	$('.parallax_window_div1').parallax({
		imageSrc : 'img/photo1.jpg'
	});
</script>

</html>