<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	loginPro 페이지 입니다.
	<%
	
//	URI 쿼리 구간에 파라미터명1=값1&파라미터명2=값2	
// 	?(쿼리)
//  (요청과 함께 전달되 값이 받아짐)

//	GET	
//	http://localhost:8081/webEx607/loginPro.jsp?id=qwer&pw=qwer

//	POST
//	http://localhost:8081/webEx607/loginPro.jsp
//	인코딩방식을 지정해줘야 한글사용이 가능하다
	request.setCharacterEncoding("UTF-8");

//	JSP 의 내장 객체 중, request
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 폼 예제
	// gugudan.jsp
	// 2~9단 안에서 랜덤으로 5개 문제를 출제
	// 사용자가 문제에ㅐ 대한 답을 입력 (input -> req)
	
	// gugudanPro.jsp
	// 넘어온 파라미터를 바탕으로
	// 성적표를 출력
	
	%>
	<h1>ID: <%=id %></h1>
	<h1>PW: <%=pw %></h1>
</body>
</html>