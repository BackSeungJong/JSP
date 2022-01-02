package controller.cartaction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import model.dao.CartDAO;

public class CartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String position = request.getParameter("position");
		String code = request.getParameter("code");
		CartDAO cart = CartDAO.getInstance();
		cart.put(code); // 1
		
//		System.out.println("=====");
//		for(ClothesDTO index : cart.getCart()) {
//			System.out.println(index.getCode());
//		}
//		System.out.println("=====");
//		System.out.println(cart.getCart().size());
		
		
		String url="";
		if(position.equals("main")) {
			url = "main";
		}else {
			request.setAttribute("code", code);
			url = "detailForm";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
