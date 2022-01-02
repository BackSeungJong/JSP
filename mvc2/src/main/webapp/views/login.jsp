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
    <form method="post" action="service">
    	<input type="hidden" name="command" value="login">
        아이디 : <input type="text" name="id">
        비밀번호 : <input type="password" name="pw">
        <input type="submit" value="로그인">
    </form>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    // loginAction 에서 온 메시지
	Object msg_login = request.getAttribute("msg_login");
    if(msg_login != null && msg_login.equals("fail_login")){%>
    	 <script>
	 		alert("[로그인실패]재하지 않는 회원정보입니다.");
		 </script>
    <%}
    
    // joinAction 에서 온 메시지
	Object msg_join = request.getAttribute("msg_join");
	if(msg_join != null && msg_join.equals("success")){%>
	 <script>
	 		alert("가입에 성공했습니다.");
	 </script>
	 <%} else if(msg_join != null && msg_join.equals("existName")){%>
		 <script>
		 alert("존재하는 이름입니다. 확인하고 로그인해주세요");
		 </script>
	<%}
	
	
	%>
</body>
</html>