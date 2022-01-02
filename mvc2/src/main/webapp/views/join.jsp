<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.UserDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	<%
	// 여기 joinAction으로부터 올 msg_join = "blank" 에 대한 처리 들어갈 부분
	%>
	
    <h1>회원가입</h1>
    <form id="joinForm" method="post" action="service" >
        <input type="hidden" name="command" value="join">
        이름: <input type="text" name="name"><br><br>
        아이디: <input type="text" name="id" id="id">
        <input type="hidden" name="command" value="false" id="checkID">
        <input onclick="check()" type="button" value="중복확인">
        <br><br>
        비밀번호: <input type="password" name="pw"><br><br>
        비밀번호확인: <input type="password" name="pw2"><br><br>
        성별: <select name="gender">
            <option value="1" selected>남자</option>
            <option value="2">여자</option>
        </select><br><br>
        휴대폰번호: <input type="text" name="PN"placeholder="ex) 01072774929"><br><br>
        이메일: <input type="text" name="email"><br><br>
        주소: <input type="text" name="address"><br><br>
  	 	<input onclick="cancel()" type="button" value="취소">
   		<input onclick="totalcheck()" type="button" value="회원가입">
    </form>
    <script>
	   var arr =[];
	   <%
	    UserDAO dao = UserDAO.getInstance();
		ArrayList<UserDTO> users = dao.getList();
		
		for(int i=0; i< users.size();i++){
		%>
			arr.push('<%=users.get(i).getId()%>');
			console.log(arr[<%=i%>]);
		<%
		}
	   %>
	   
	   function check(){
		   var id = document.getElementById('id').value;
		   if(id!==""){
			   let check = false;
			  for(let i=0;i<arr.length;i++){
				  if(id===arr[i]){
					  check= true;
				  }
			  }
			  if(check){
				  alert("중복된 아이디입니다.");
				  document.getElementById('checkID').value="false";
			  }else{
				  alert("사용가능한 아이디입니다.");
				  document.getElementById('checkID').value="true";
			  }
		   }
	   }
	
       function cancel(){
           /*  var form = document.getElementById('none');
            form.submit();*/
            location.href="index.jsp";
       }

       function totalcheck(){
            var bool = document.getElementById('checkID').value;
            if(bool==='true'){
            	var form = document.getElementById('joinForm');
            	form.submit();
            }else{
            	alert("아이디중복체크를 해주세요");
            }
       }
       
       
    </script>
</body>
</html>