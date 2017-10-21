package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.ListingProfileInfo;
import dao.ListingDAO;
import dao.ListingDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import entities.User;
import entities.Review;
import java.util.List;


/**
 * Servlet implementation class GetListingDetailsServlet
 */
@WebServlet("/htmlCssFiles/getListingDetails")
public class GetListingDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/listing.jsp");
		
		HttpSession session = request.getSession();

		String listing_name = request.getParameter("listing_name");//get the listing's name
		
		ListingProfileInfo listing = new ListingProfileInfo();
		List<Review> reviews = new ArrayList<>();
		ListingDAO listing_dao = new ListingDAOImpl(false);
		
		listing = listing_dao.getListingDetails(listing_name);//get the listing's info
		reviews = listing_dao.findAllReviews(listing_name);//get the listing's reviews
		
		String username =(String) session.getAttribute("username");
		
		if(username != null){
			int listing_id = listing_dao.findListingId(listing_name);
			int already_visited = listing_dao.searchIfAlreadyVisited(username, listing_id);
			
			if(already_visited == 0){
				listing_dao.logClick(username, listing_id);
			}
		}
		
		
		
		UserDAO user_dao = new UserDAOImpl(false);
		User host_info = user_dao.findUser(listing.getUsername());//get the host's info
		
		request.setAttribute("listing_details",listing);
		request.setAttribute("listing_reviews", reviews);
		request.setAttribute("host_info", host_info);
		
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
		
	}

}
