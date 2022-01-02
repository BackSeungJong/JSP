package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.dto.UserDTO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String PN = request.getParameter("PN");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		UserDAO dao = UserDAO.getInstance();
		if (dao.checkData(name, id, pw, pw2, PN, email, address) && pw.equals(pw2)) {
			if (dao.findName(name) == null) {
				if (dao.addUser(new UserDTO(name, id, pw, gender, PN, email, address))) {
					System.out.println("가입성공");
					request.setAttribute("msg_join", "success");
					String url = "loginForm";
					request.getRequestDispatcher(url).forward(request, response);
				}

			} else {
				request.setAttribute("msg_join", "existName");
				String url = "loginForm";
				request.getRequestDispatcher(url).forward(request, response);
			}
		} else {
			request.setAttribute("msg_join", "blank");
			String url = "joinForm";
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
