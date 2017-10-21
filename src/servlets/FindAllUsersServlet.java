package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dao.UserDAOImpl;
import entities.User;

/**
 * Servlet implementation class FindAllUsersServlet
 */
@WebServlet("/htmlCssFiles/findAllUsers")
public class FindAllUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/allUsers.jsp");

		UserDAO dao = new UserDAOImpl(false);
		
		List<User> users = dao.findAllUsers();//the list of all the registered users
		
		if(users.size()==0){/*Check if there aren't any users*/
			response.getWriter().println("There are no users registered to the database.");
		}
		else {
			
			request.setAttribute("users_list",users);
		}
		
		disp.forward(request, response);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
