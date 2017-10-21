package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.UserDAOImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/htmlCssFiles/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String redirection = "";
		UserDAO dao = new UserDAOImpl(false);
		
		if(request.getParameter("username").equals("admin")){
			redirection = "/htmlCssFiles/adminProfile.jsp";
		}
		
		else{
			redirection = "/htmlCssFiles/index.jsp";
		}
		RequestDispatcher disp = getServletContext().getRequestDispatcher(redirection);
		int re = dao.searchUser(request.getParameter("username"),request.getParameter("password"));
		if(re == 1){
			HttpSession session=request.getSession();  
		    session.setAttribute("username",request.getParameter("username"));
		}
		disp.forward(request, response);
	}

}
