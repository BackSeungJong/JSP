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
    <form method="get" action="service">
    	<input type="hidden" name="command" value="login">
        아이디 : <input type="text" name="id">
        비밀번호 : <input type="password" name="pw">
        <input type="submit" value="로그인">
    </form>
    
    <%
    request.setCharacterEncoding("utf-8");
	Object errmsg = request.getAttribute("errmsg");
	Object msg = request.getAttribute("errmsg");
	
	if(errmsg != null && errmsg.equals("existName")){
		/* System.out.println("서블릿에서 빠꾸먹고옴 - objnull아님");
		System.out.println(obj);
		System.out.println(obj.getClass().getSimpleName());
		System.out.println(obj.toString());
		System.out.println(obj.toString().getClass().getSimpleName());*/
	 %>
	 <script>
	 		alert("존재하는 이름입니다. 확인해주세요");
	 </script>
	 <%
	} else if(msg != null && msg.equals("success")){
		%>
		 <script>
	 		alert("가입에 성공했습니다.");
	 </script>
		<%
	}
	
	%>
</body>
</html>