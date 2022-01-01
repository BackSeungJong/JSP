<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-A-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post" action="service">
    	<input type="hidden" name="command" value="loginForm">
        <input type="submit" value="로그인">
    </form>
     <form method="post" action="service">
    	<input type="hidden" name="command" value="joinForm">
        <input type="submit" value="회원가입">
    </form>
    <!-- <button onclick="location.href="service?command=loginForm"></button> -->
</body>
</html>