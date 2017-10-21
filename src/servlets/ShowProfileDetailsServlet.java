package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

import dao.UserDAO;
import dao.UserDAOImpl;
import entities.User;
import dao.ListingDAO;
import dao.ListingDAOImpl;
import entities.Coordinates;

/**
 * Servlet implementation class ShowProfileDetails
 */
@WebServlet("/htmlCssFiles/ShowProfileDetails")
public class ShowProfileDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/myUserProfile.jsp");
		UserDAO dao = new UserDAOImpl(false);
		ListingDAO listing_dao = new ListingDAOImpl(false);
		
		
		User user = dao.findUser(request.getParameter("username"));
		List<String> convs = dao.searchConversations(request.getParameter("username"));
		request.setAttribute("userDetails",user);
		request.setAttribute("conversations", convs);
		
		List<Coordinates> coords = listing_dao.getCoordinates(request.getParameter("username"));
		
		request.setAttribute("coords", coords);
		//request.setAttribute("listings",listings);
		disp.forward(request, response);
		
	}

}
