package servlets;

import dao.UserDAO;
import dao.UserDAOImpl;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.User;

@WebServlet("/htmlCssFiles/signup")
public class SignupServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDAO dao = new UserDAOImpl(false);
		
		int re = dao.findUsername(request.getParameter("username"));
		
		
		if(re == 0){	
		
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/signupResults.jsp");
			User user = new User();
			
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setName(request.getParameter("name"));
			user.setSurname(request.getParameter("surname"));
			user.setEmail(request.getParameter("email"));
			user.setPhoneNumber(request.getParameter("phone"));
			user.setImage_url(request.getParameter("image"));
			user.setVerified(0);
			
			
			
			if((request.getParameter("user_role")).equals("renter"))
			{
				user.setHost(0);
				dao.insertUserIntoDatabase(user);
			}
			
			else
			{
				user.setHost(1);
				dao.insertUserIntoDatabase(user);
				dao.insertPetition(request.getParameter("username"));
			}
			
			disp.forward(request, response);
		
		}
		
		else {
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/signup.jsp");
			
			HttpSession session=request.getSession();  
		    session.setAttribute("usernameExists","1");
			
			disp.forward(request, response);
		}
		
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
}
