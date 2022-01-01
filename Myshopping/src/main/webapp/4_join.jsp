<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>회원가입</h1>
    <form method="post" action="5_joinPro.jsp">
        이름: <input type="text" name="name"><br><br>
        생년월일: <input type="text" name="birthdate" placeholder="ex) 19950523"><br><br>
        성별: <select name="gender" id="">
            <option value="1" selected>남자</option>
            <option value="2">여자</option>
        </select>
        <br><br>
        주소api자리: <input type="text" name="address"><br><br>
        휴대폰번호 : <input type="text" name="PN"><br><br>
        아이디: <input type="text" name="id"><br><br>
        비밀번호: <input type="text" name="pw"><br><br>
        <input type="submit" value="회원가입">
    </form>

</body>

</html>