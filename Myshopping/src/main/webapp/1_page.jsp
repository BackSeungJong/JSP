<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="1_page.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
    <script src="https://code.jquery.com/jquery-2.2.4.js"
        integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
    <title>page1</title>
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
                <a href="2_login.jsp">LOGIN</a>
                <a href="4_join.jsp">JOIN</a>
                <a href="">CART</a>
                <a href="">BOARD</a>
                <a href="">MYPAGE</a>

            </div>

        </header>

        <main>
            <div id="slider-wrap">
                <ul id="slider">
                    <li>
                        <img src="img/메인1.jpg" alt="">
                    </li>
                    <li>
                        <img src="img/메인2.jpg" alt="">
                    </li>

                    <li>
                        <img src="img/메인3.jpg" alt="">
                    </li>
                </ul>
            </div>
            <div id="pagination-wrap">
                <ul>
                </ul>
            </div>

            <div id="maindiv1">
                <h3>WEEKLY BEST</h3>
                <hr width="150">
                <div id="category">
                    <li>
                        <a href="">OUTER</a>
                    </li>
                    <li>
                        <a href="">TOP</a>
                    </li>
                    <li>
                        <a href="">BOTTOM</a>
                    </li>
                    <li>
                        <a href="">SHIRT</a>
                    </li>
                    <li>
                        <a href="">SHOES</a>
                    </li>
                </div>
                <div id="content">
                    <ul>
                        <li>
                            <div id="product1">
                                <div id="thumbnail">
                                    <img src="img/슈트_기본1.jpg" alt="">
                                    <a href="https://www.naver.com"></a>
                                </div>
                                슈트기본1
                            </div>
                        </li>
                        <li>
                            <div id="product1">
                                <div id="thumbnail">
                                    <img src="img/슈트_기본2.jpg" alt="">
                                </div>
                                슈트기본2
                            </div>
                        </li>
                    </ul>
                </div>
            </div>



        </main>

        <footer>
            footer
        </footer>
    </div>

    <script src="1_page.js"></script>
</body>

</html>