package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.ListingDAOImpl;
import dao.ListingDAO;
import entities.NewListing;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/htmlCssFiles/insertReview")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

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
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/index.jsp");
		
		String listing_name = request.getParameter("submit_review");
		//System.out.println(listing_name);
		
		HttpSession session = request.getSession();
		String username =(String) session.getAttribute("username");
		
		String review = request.getParameter("review");
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		ListingDAO listing = new ListingDAOImpl(false);
		int listing_id = listing.findListingId(listing_name);
		listing.insertReview(review, listing_name, username, rating,listing_id);//insert the review to the reviews table
		
		
		NewListing review_info = listing.findListingReviewsInfo(listing_name);//find the info of the reviews of this listing
		
		int total_reviews = review_info.getReviews_num();
		
 		
		int new_rating = listing.findAvgOfReviews(listing_name);
		
		listing.updateReviewInfo(total_reviews+1,new_rating,listing_name);//update the listing's review info
		
		disp.forward(request, response);
	}

}
