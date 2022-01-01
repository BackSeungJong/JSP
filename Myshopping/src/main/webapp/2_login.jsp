<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="2_login.css">
    <script src="https://code.jquery.com/jquery-2.2.4.js"
        integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
    <title>page2</title>
</head>

<body>
    <div class="wrap">
        <header>
            <div class="headdiv">
                <a href="" id="logo">
                    <h1>MyShopping</h2>
                </a>
                <a href="">BEST</a>
                <a href="">NEW</a>
                <a href="">WEATHER</a>
                <a href="">EVENT</a>
                <div class="ver"></div>
                <a href="">SUIT</a>
                <a href="">SHIRT</a>
                <a href="">TOP</a>
                <a href="">BOTTOM</a>
                <a href="">SHOES</a>
                <div class="ver"></div>
                <a href="">LOGIN</a>
                <a href="">JOIN</a>
                <a href="">CART</a>
                <a href="">BOARD</a>
                <a href="">MYPAGE</a>

            </div>

        </header>

        <main>
            <h1>로그인</h1>
            <div class="form-wrap">
                <form method="post" action="3_loginPro.jsp">
                    <input type="text" name="id" placeholder="아이디">
                    <input type="password" name="pw" placeholder="비밀번호">
                    <input id="submit" type="submit" value="로그인">
                </form>
                <div class="finddiv">
                    <a href="">아이디찾기</a>
                    <div class="ver"></div>
                    <a href="">비밀번호찾기</a>
                </div>
            </div>
        </main>

        <footer>
            전화번호 등등등
        </footer>
    </div>

    <script src="2_login.js"></script>
</body>

</html>