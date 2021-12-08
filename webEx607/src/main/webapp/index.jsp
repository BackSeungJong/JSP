<%-- jsp 주석태그 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	hello world

	<%-- <%
	// JSP : JAVA Server Page
	// ㄴ html 문서 안에 java 문장(코드)을 작성하는 것
	
	// 1) 지시자 태그 <%@>
	// 2) 주석 태그 <%-- --% >
	// 3) 스크립틀릿 <% % >
	// 4) 표현식 <%= % >
	
	
	
	//스크립틀릿(scriptlet) 태그 안에 자바 문장을 작성할 수 있다.

	int num = 10;
	System.out.println(num);
	%>
	
	<%
	num = 1;
	while(num <=10){%>
	<h1><%=num %></h1>
		<%num++;
	}
	%> --%>
	
	<%
	int num = 2;
	while(num<10){
		%>
		<h3><%=num %>단</h3>
		<%
		for(int i = 1; i < 10;i++){%>
			<h3><%=num %> X <%=i %> = <%=(num*i) %></h3>
		<%}
		num++;
	}
	%>
	
</body>
</html>