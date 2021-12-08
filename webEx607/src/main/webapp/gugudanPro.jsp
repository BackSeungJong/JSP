<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int score = 0;
	request.setCharacterEncoding("UTF-8");
	String input[] = new String[5];
	String result[] = new String[5];

	for (int i = 0; i < 5; i++) {
		String name = "pro" + (i + 1);
		input[i] = request.getParameter(name);

		String name2 = "result" + (i + 1);
		result[i] = request.getParameter(name2);
	}
	%>
	<table>
		<th>번호</th>
		<th>정답</th>
		<th>사용자값</th>
		<th>정오표</th>
		<%
		for (int i = 0; i < 5; i++) {
		%>
		<tr>
			<td><%=(i + 1)%></td>
			<td><%=result[i]%></td>
			<td><%=input[i]%></td>
			<%
			String str = "";
			if (result[i].equals(input[i])) {
				str = "O";
				score += 20;
			} else {
				str = "X";
			}
			%>
			<td><%=str%></td>
		</tr>
		<%
		}
		%>
	</table>
	<h2>당신의 점수는 <%=score %>점 입니다.</h2>
</body>
</html>