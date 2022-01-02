<%@page import="model.dao.CartDAO"%>
<%@page import="model.dto.ClothesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.ClothesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-A-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Object log = request.getSession().getAttribute("LOG");
		CartDAO cart = CartDAO.getInstance();
		if(cart.getCart() ==null){
			cart.cartSet();
		}
	%>
	<h1>MAIN 페이지</h1>
	<h3><%=log %>님 환영합니다.</h3>
	 <form method="post" action="service">
    	<input type="hidden" name="command" value="logoutAction">
        <input type="submit" value="로그아웃">
    </form> 
     <form method="post" action="service">
    	<input type="hidden" name="command" value="cartForm">
        <input type="submit" value="장바구니">
    </form>
     <form method="post" action="service">
    	<input type="hidden" name="command" value="mypageForm">
        <input type="submit" value="마이페이지">
    </form>
    
    <br><br><br><br>
    <div class="content"></div>
    <form id="form" action="service" method="post">
    		<input type="hidden" name="command" value="cart">
    		<input type="hidden" name="position" value="main">
    		<input id="val" type="hidden" name="code">
    </form>
    
   <script>
    	var div = document.querySelector('.content');
    <%
    ClothesDAO cloth = ClothesDAO.getInstance();
    ArrayList<ClothesDTO> products = cloth.getList();
    
    for(ClothesDTO pro : products){%>

    	var newdiv = document.createElement("div");
    	newdiv.id = "pro<%=pro.getCode()%>";
    	newdiv.innerHTML = '<img src="<%=pro.getImg()%>"><h3><%=pro.getName()%></h3><h4><%=pro.getPrice()%></h4><input type="button" value="상세보기" id="pro<%=pro.getCode()%>" onclick="detail(this.id)"><input type="button" value="장바구니담기" id="pro<%=pro.getCode()%>" onclick="cart(this.id)">';
    	div.appendChild(newdiv);
    <%
    }
    %>
    
    function detail(id){
	    var form = document.createElement("form");
    	form.action = "service";
        form.method = "post";
        form.innerHTML = `<input type="hidden" name="command" value="detailForm"><input type="hidden" name="code" value="\${id}">`;

        document.body.append(form);
        form.submit();
    }
    
    function cart(id){
    	var form = document.querySelector('#form');
    	var hidden = document.querySelector('#val');
    	hidden.value = id.charAt(3);
    	console.log(hidden.value);
    	
    	form.submit();
    }
    
    </script>
</body>
</html>