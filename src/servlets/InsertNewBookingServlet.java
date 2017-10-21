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
 * Servlet implementation class InsertNewBookingServlet
 */
@WebServlet("/htmlCssFiles/insertNewBooking")
public class InsertNewBookingServlet extends HttpServlet {
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
		HttpSession session = request.getSession();
		
		String check_in = request.getParameter("departing");
		String check_out = request.getParameter("returning");
		String listing_name = request.getParameter("book_now");
		String username =(String) session.getAttribute("username");
		//System.out.println(listing_name+"  "+username);
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/index.jsp");
		
		ListingDAO dao = new ListingDAOImpl(false);
		
		dao.insertNewBooking(check_in, check_out, listing_name, username);
		dao.updateAvailability(check_in, check_out, listing_name,0);
		
		disp.forward(request, response);
	}

}
