<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#div2 {
	margin-top: 20px;
}
</style>
</head>

<body>
	<%
	String tmp = request.getParameter("index");
	int idx = Integer.parseInt(tmp);
	UserDAO dao = UserDAO.getInstance();
	BoardDAO bdao = BoardDAO.getInstance();
	dao.getUser();
	bdao.getBoard();

	BoardDTO board = bdao.boards.get(idx);
	%>

	<div class="wrap">
		no :
		<%=idx + 1%><br> <br> 게시자 :
		<%=board.getId()%><br> <br> 작성시간 :
		<%=board.getRegDate()%><br> <br> 제목 :
		<%=board.getTitle()%><br> <br> 내용 : <br><%=board.getContent()%><br>
		<br>
	</div>
	<div id="div2">
		<button id="list">목록</button>
		<%
		if (dao.LOG.equals(board.getId())) {
		%>
		<button id="edit">수정</button>
		<button id="delete">삭제</button>
		<%
		}
		%>
	</div>
	<form id="form" method="post" action="12_boardDelPro.jsp">
		<input type="hidden" name="idx" value="<%=idx%>">
	</form>
	<form id="form2" method="post" action="13_boardSet.jsp">
		<input type="hidden" name="idx" value="<%=idx%>">
	</form>
	<script>
    document.querySelector('#list').addEventListener('click', e=>{
    	location.href = "6_main.jsp";
    });
    
    document.querySelector('#edit').addEventListener('click', e=>{
    	var confirmflag = confirm("게시물을 수정하시겠습니까?");
   	  if(confirmflag){
			var form = document.querySelector('#form2');
			form.submit();
  	  }
    });
    
 	document.querySelector('#delete').addEventListener('click', e=>{
	 	 var confirmflag = confirm("게시물을 삭제하시겠습니까?");
     	  if(confirmflag){
			var form = document.querySelector('#form');
			form.submit();
    	  }
    });
    
    
    </script>
</body>
</html>