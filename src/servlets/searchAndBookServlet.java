package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ListingDAO;
import dao.ListingDAOImpl;

/**
 * Servlet implementation class searchAndBookServlet
 */
@WebServlet("/htmlCssFiles/searchAndBook")
public class searchAndBookServlet extends HttpServlet {
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
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/booking.jsp");
		HttpSession session = request.getSession();
		String check_in = request.getParameter("departing");
		String check_out = request.getParameter("returning");
		String listing_name = request.getParameter("book_now");
		String username =(String) session.getAttribute("username");
		int guests =Integer.parseInt(request.getParameter("guests"));
		
		ListingDAO dao  = new ListingDAOImpl(false);
		
		int guests_can_be_accommodated = dao.checkGuests(listing_name, guests);
		int available = 0;
		if(guests_can_be_accommodated == 1){
			available = dao.checkIfHotelIsAvailable(listing_name, check_in, check_out);
			if(available == 1){
				dao.insertNewBooking(check_in, check_out, listing_name, username);
				dao.updateAvailability(check_in, check_out, listing_name,0);
			}
		}
		request.setAttribute("available", available);
		disp.forward(request, response);
	}

}
