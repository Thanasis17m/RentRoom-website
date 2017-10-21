package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;
import javax.servlet.RequestDispatcher;

import dao.ListingDAO;
import dao.ListingDAOImpl;


/**
 * Servlet implementation class FindYourListingsServlet
 */
@WebServlet("/htmlCssFiles/findYourListings")
public class FindYourListingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/allYourListings.jsp");

		ListingDAO dao = new ListingDAOImpl(false);
	
		
		
		HttpSession session=request.getSession();  
	    String username = (String) session.getAttribute("username");
		
		List<String> listings = dao.findYourListings(username);//the list of all the registered users
		
		if(listings.size()==0 || listings == null){/*Check if there aren't any users*/
			response.getWriter().println("There are no listings for this user registered to the database.");
		}
		else {
			
			request.setAttribute("your_listings",listings);
		}
		
		disp.forward(request, response);		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
