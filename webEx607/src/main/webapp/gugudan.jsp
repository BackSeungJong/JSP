<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
	font-size: 1.2em;
	display: flex;
	flex-direction: column;
	align-items: center;
}

input {
	font-size: 1.2em;
}

#sm {
	margin-top: 50px;
}
</style>

<title>Document</title>
</head>

<body>
	<h1>구구단 문제</h1>
	<form method="get" action="gugudanPro.jsp">
	<table border="1">
		<th>번호</th>
		<th>문제</th>
		<th>정답</th>
		<%
        Random ran = new Random();
		int[] result = new int[5];
    	int count = 1;
        for(int i=1;i<=5;i++){
			int num1 = ran.nextInt(9)+1;
			int num2 = ran.nextInt(9)+1;
			result[i-1] = num1*num2;
        %>
        
		<tr>
			<td><%=i %></td>
			<td><%=num1 %> X <%=num2 %> = </td>
			<td><input type="text" name="pro<%=i %>"></td>
		</tr>

		<%	
        }%>
	</table>
	<input type="submit" value="전송" id="sm">
	<%
		for(int i=0;i<result.length;i++){%>
			<input type="hidden" name="result<%=(i+1) %>" value="<%=result[i] %>">
			
		<%}%>
	</form>
</body>

</html>