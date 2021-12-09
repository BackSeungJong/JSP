<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
}

.wrap {
	display: flex;
	background-color: #f6f7f6;
	flex-direction: column;
	align-items: center;
}

.logo {
	margin-top: 50px;
	background: url("img/logo.JPG");
	width: 250px;
	height: 55px;
	cursor: pointer;
}

main {
	margin-top: 50px;
	display: flex;
	flex-direction: column;
	gap: 30px;
}

.text {
	padding: 10px;
	font-size: 1em;
	width: 460px;
	height: 30px;
}

.birth {
	padding: 10px;
	width: 135px;
	height: 30px;
}

.month {
	width: 150px;
	height: 55px;
}

.gen {
	width: 480px;
	height: 55px;
}

.certi {
	width: 300px;
	height: 50px;
}

.certiBtn {
	cursor: pointer;
	width: 175px;
	height: 50px;
}

.div8 {
	gap: 10px;
}

.recruit {
	cursor: pointer;
	width: auto;
	height: 50px;
}

footer {
	height: 100px;
}
</style>
<title>Document</title>
</head>

<body>
	<div class="wrap">
		<header>
			<div href="http://www.naver.com" class="logo"></div>
		</header>
		<main>
			<form method="get" action="join3.jsp">
				<div class="div1">
					<p>아이디</p>
					<input type="text" class="text" name="id" id="input1">
					<div class="divdiv1"></div>
				</div>

				<div class="div2">
					<p>비밀번호</p>
					<input type="password" class="text" name="pw" id="input1">
				</div>

				<div class="div3">
					<p>비밀번호 재확인</p>
					<input type="password" class="text" name="pw2" id="input1">
				</div>

				<div class="div4">
					<p>이름</p>
					<input type="text" class="text" name="name" id="input1">
				</div>
				<div class="div5">
					<p>생년월일</p>
					<input type="text" class="birth" name="year" id="input1"> <select
						class="month" name="month" id="">
						<option value="">월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input class="birth" type="text" name="date">
				</div>
				<div class="div6">
					<p>성별</p>
					<select class="gen" name="gender" id="">
						<option value="">성별</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
						<option value="선택안함">선택안함</option>
					</select>
				</div>
				<div class="div7">
					<p>본인 확인 이메일</p>
					<input type="text" class="text" name="email" id="input1">
				</div>
				<div class="div8">
					<p>휴대전화</p>
					<select class="gen" name="nation" id="">
						<option value="+82">대한민국 +82</option>
					</select><br>
					<br> <input class="certi" type="text" name="phone"><span><button
							class="certiBtn">인증번호 받기</button></span><br>
					<br> <input class="text" type="text" placeholder="인증번호 입력하세요">
				</div>
				<input type="button" value="가입하기" class="recruit"
					onclick="next(form)">
			</form>

		</main>
		<footer> </footer>

	</div>

	<%
		request.setCharacterEncoding("UTF-8");
	    String req = request.getParameter("back");
    %>
	<script>
        document.querySelector('.logo').addEventListener('click', e => {
            location.href = "http://www.naver.com";
        });

        function next(form){
            form.submit();
        }

        if('<%=req %>'=="back"){
        	//alert('되돌아왔슴메');
        	$('.div1').append('<p style="color:red">필수 정보입니다.</p>');
        	$('.div2').append('<p style="color:red">필수 정보입니다.</p>');
        	$('.div3').append('<p style="color:red">필수 정보입니다.</p>');
        	$('.div4').append('<p style="color:red">필수 정보입니다.</p>');
        	$('.div5').append('<p style="color:red">태어난 년도 4자리를 정확하게 입력하세요.</p>');
        	$('.div6').append('<p style="color:red">필수 정보입니다.</p>');
        	$('.div8').append('<p style="color:red">필수 정보입니다.</p><br><p style="color:red">인증이 필요합니다.</p>');

        }
        
        // document.querySelector('.text1').addEventListener('blur', function(){
        //     if(document.querySelector('.divdiv1').childNodes.length ===0){
        //         $('.divdiv1').append('<span style="color: red;">아이디 입력해주세요</span>');
        //     }
        // });
    </script>

</body>

</html>