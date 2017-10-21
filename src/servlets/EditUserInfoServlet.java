package servlets;


import dao.UserDAO;
import dao.UserDAOImpl;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.User;


@WebServlet("/htmlCssFiles/SaveChanges")
public class EditUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDAO dao = new UserDAOImpl(false);
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/index.jsp");
		
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setName(request.getParameter("name"));
		user.setSurname(request.getParameter("surname"));
		user.setEmail(request.getParameter("email"));
		user.setPhoneNumber(request.getParameter("phone_number"));
		
		dao.editUserInfo(user);
		dao.editUserInfoListingsTable(user);
		
		disp.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
