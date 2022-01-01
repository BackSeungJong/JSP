package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

// 데이터를 처리하는 곳
public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao = UserDAO.getInstance();
		
		// 값 받아오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		if (dao.findId(id, pw) != null) {
			// 디스패처로 보내버리기
			String url = "main";
			request.getRequestDispatcher(url).forward(request, response);
		}else {
			String url = "loginForm";
			request.getSession().setAttribute("err", "errMsg");
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
