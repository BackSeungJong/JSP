<%@page import="java.text.Format"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
main {
	margin-top: 20px;
	height: auto;
	width: 100%;
	background-color: beige;
}

#no {
	width: 50px;
}

#id {
	width: 100px;
}

#title {
	width: 150px;
}

#content {
	width: 500px;
}

#like {
	width: 50px;
}

#regDate {
	width: 100px;
}

#title {
	cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
	UserDAO dao = UserDAO.getInstance();
	BoardDAO bdao = BoardDAO.getInstance();

	String log_id = dao.LOG;
	bdao.getBoard();
	%>

	<div class="wrap">
		<header>
			<h1>MAIN PAGE</h1>
			<h2><%=log_id%>님이 로그인 하셨습니다.
			</h2>
			<input type="button" id="withdraw" value="탈퇴"> <input
				type="button" id="logout" value="로그아웃">
		</header>
		<main>
			<input type="button" id="boardwrite" value="글쓰기">
			<table border="solid 1px" style="border-collapse: collapse;">
				<tr>
					<td id="no">no</td>
					<td id="id">id</td>
					<td id="title">title</td>
					<td id="content">content</td>
					<td id="like">like</td>
					<td id="regDate">regDate</td>
				</tr>
				<%
				for (int i = 0; i < bdao.boards.size(); i++) {
					BoardDTO board = bdao.boards.get(i);
				%>
				<tr>
					<td id="no"><%=(i + 1)%></td>
					<td id="id"><%=board.getId()%></td>
					<td class="title<%=(i + 1)%>" id="title"><%=board.getTitle()%></td>
					<td id="content"><%=board.getContent()%></td>
					<td id="like"><%=board.getLike()%></td>
					<td id="regDate"><%=board.getRegDate()%></td>
				</tr>

				<%
				}
				%>
			</table>
		</main>
	</div>
	<form id="form" method="post" action="11_boardView.jsp">
		<input id="hidden" type="hidden" name="index">
	</form>


	<script>
        document.querySelector('#withdraw').addEventListener('click', e => {
            location.href = "7_withdraw.jsp";
        });

        document.querySelector('#logout').addEventListener('click', e => {
            //dao.LOG = "";
            location.href = "1_entrance.jsp";
        });
        document.querySelector('#boardwrite').addEventListener('click', e => {
            //dao.LOG = "";
            location.href = "9_boardWrite.jsp";
        });
        
       <%for (int i = 0; i < bdao.boards.size(); i++) {
	String str = String.format("title%d", i + 1);%>
			document.querySelector(".<%=str%>").addEventListener('click', e=>{
				viewPage(<%=i%>);
			});  
			<%}%> 
			
			function viewPage(idx){
				var hidden = document.querySelector('#hidden');
				hidden.value = idx;
				document.querySelector('#form').submit();
			}
        
        
    </script>
</body>
</html>