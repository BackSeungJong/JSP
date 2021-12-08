<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            padding: 0;
            margin: 0;
            background-color: #f6f7f6;
        }

        .wrap {
            display: flex;
            flex-direction: column;
            align-items: center;

        }

        .mainbody {
        
            margin-top: 50px;
            width: 500px;
            display: flex;
            flex-direction: column;

            gap: 50px;
        }

        .div1 {
            display: flex;
        }

        .logo {
            margin-top: 50px;
            background: url("img/logo.JPG");
            width: 250px;
            height: 55px;
        }

        .nockeck {
            width: 24px;
            height: 24px;
            background-repeat: no-repeat;
            background-size: cover;
            background: url("img/2424nc.jpg");

            margin-right: 20px;
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
            <form class="mainbody" method="get" action="recruit.jsp">
                <div class="div1">
                    <!-- <div class="nockeck">
                </div> -->
                    <input type="checkbox" name="" id="">
                    <span>네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.</span>
                </div>

                <div class="div2">
                    <input type="checkbox" name="" id="">
                    <span>네이버 이용약관 동의(필수)</span>
                </div>

                <div class="div3">
                    <input type="checkbox" name="" id="">
                    <span>위치정보 이용약관 동의(선택)</span>
                </div>

                <div class="div4">
                    <input type="checkbox" name="" id="">
                    <span>프로모션 정보 수신 동의(선택)</span>
                </div>

                <div>
                    <button>취소</button>
                    <button>확인</button>
                </div>
            </form>
        </main>

        <footer>

        </footer>
    </div>

    <script>
        document.querySelector('.logo').addEventListener('click', e => {
            location.href = "http://www.naver.com";
        });
    </script>
</body>

</html>