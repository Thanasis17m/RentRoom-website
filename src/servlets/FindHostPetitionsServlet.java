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
 * Servlet implementation class FindHostPetitionsServlet
 */
@WebServlet("/htmlCssFiles/findHostPetitions")
public class FindHostPetitionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/hostPetitions.jsp");

		UserDAO dao = new UserDAOImpl(false);
		
		List<User> usersWithHostPetitions = dao.findHostPetitions();//the list of all the users with host petitions waiting to be accepted
		
		if(usersWithHostPetitions.size()==0){/*Check if there aren't any users*/
			response.getWriter().println("There are no users registered to the database with host petitions.");
		}
		else {
			
			request.setAttribute("users_with_petitions_list",usersWithHostPetitions);
		}
		
		disp.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}