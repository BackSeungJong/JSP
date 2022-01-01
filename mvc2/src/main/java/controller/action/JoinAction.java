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
		String birthDate = request.getParameter("birthdate");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String address = request.getParameter("address");
		String PN = request.getParameter("PN");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");

		UserDAO dao = UserDAO.getInstance();
		if (dao.checkData(name, birthDate, address, PN, id, pw, pw2) && pw.equals(pw2)) {
			if (dao.findName(name) == null) {
				if(dao.addUser(new UserDTO(name, birthDate, gender, address, PN, id, pw))) {
					System.out.println("가입성공");
					request.setAttribute("msg", "success");
					String url = "/view/login.jsp";
					request.getRequestDispatcher(url).forward(request, response);
				}
				
			} else {
				request.setAttribute("errmsg", "existName");
				String url = "/views/login.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			}
		} else {
			request.setAttribute("errmsg", "blank");
			String url = "/views/join.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
