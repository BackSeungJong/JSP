package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import controller.action.LoginAction;

/**
 * Servlet implementation class Service
 */
@WebServlet("/service")
public class Service extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Service() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("[ServiceServlet] Served at: "+request.getContextPath());
		
//		LoginAction action = new LoginAction();
//		action.execute(request, response);
		
		// request parameter "command" 안에 있는 명령을 확인한 후 -> 명령에 맞는 Action instance를 생성
		String command = request.getParameter("command");
		//System.out.println(command);
		ActionFactory af = ActionFactory.getInstance();
		Action action = af.getAction(command); // af 가 인스턴스화 해줌
		
		if(action != null) {
			action.execute(request, response);
		}else {
			System.out.println("action이 null");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
