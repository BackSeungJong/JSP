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
	cursor: pointer;
}

.nockeck {
	width: 24px;
	height: 24px;
	background-repeat: no-repeat;
	background-size: cover;
	background: url("img/2424nc.jpg");
	margin-right: 20px;
}

#box2 {
	cursor: pointer;
}

label {
	cursor: pointer;
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
			<form class="mainbody" method="get" action="join2.jsp">
				<div class="div1">
					<label for="box1"><input type="checkbox" name="check"
						id="box1" /> 네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보
						수신(선택)에 모두 동의합니다.</label>
				</div>

				<div class="div2">
					<label for="box2"><input type="checkbox" name="check"
						id="box2" /> 네이버 이용약관 동의(필수)</label>
				</div>

				<div class="div3">
					<label for="box3"><input type="checkbox" name="check"
						id="box3" /> 개인정보 수집 및 이용 동의(필수)</label>
				</div>

				<div class="div4">
					<label for="box4"><input type="checkbox" name="check"
						id="box4" /> 위치정보 이용약관 동의(선택)</label>
				</div>

				<div class="div5">
					<label for="box5"><input type="checkbox" name="check"
						id="box5" /> 프로모션 정보 수신 동의(선택)</label>

				</div>
				<div class="div6"></div>

				<div>
					<input type="button" value="취소"> <input type="button"
						value="확인" onclick="validate(form)">
				</div>
			</form>
		</main>

		<footer> </footer>
	</div>

	<script>
        document.querySelector('.logo').addEventListener('click', e => {
            location.href = "http://www.naver.com";
        });

        document.querySelector('.div2').addEventListener('click', e => {
            const form = document.querySelector('.mainbody');
            checkBox(form);
        });
        document.querySelector('.div3').addEventListener('click', e => {
            const form = document.querySelector('.mainbody');
            checkBox(form);
        });
        document.querySelector('.div4').addEventListener('click', e => {
            const form = document.querySelector('.mainbody');
            checkBox(form);
        });
        document.querySelector('.div5').addEventListener('click', e => {
            const form = document.querySelector('.mainbody');
            checkBox(form);
        });

        document.querySelector('#box1').addEventListener('click', e => {
            if (document.querySelector('#box1').checked === true) {
                document.querySelector('#box2').checked = true;
                document.querySelector('#box3').checked = true;
                document.querySelector('#box4').checked = true;
                document.querySelector('#box5').checked = true;
            } else {
                document.querySelector('#box2').checked = false;
                document.querySelector('#box3').checked = false;
                document.querySelector('#box4').checked = false;
                document.querySelector('#box5').checked = false;
            }
        });

        function validate(form) {
            let cnt = 0;
            if (form.check[1].checked && form.check[2].checked) {
                form.submit();
            }else{
                $('.div6').append('<p style="color: red;">네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</p>');
            }
        }

        function checkBox(form) {

            if (form.check[0].checked) {
                form.check[0].checked = false;
            } else {

                let cnt = 0;
                for (let i = 1; i < form.check.length; i++) {
                    if (form.check[i].checked) {
                        cnt++;
                    }
                }
                if (cnt === 4) {
                    form.check[0].checked = true;
                }
            }
        }
    </script>
</body>

</html>