package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDAOImpl;
import dao.UserDAO;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class InsertNewMessageServlet
 */
@WebServlet("/htmlCssFiles/insertNewMessage")
public class InsertNewMessageServlet extends HttpServlet {
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
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/index.jsp");
		
		UserDAO dao = new UserDAOImpl(false);
		HttpSession session = request.getSession();
		String sender =(String) session.getAttribute("username");
		String receiver =(String) session.getAttribute("host_name");
		String message = request.getParameter("message");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dateTime = new Date();
		
		dao.insertMessage(message, sender, receiver, dateFormat.format(dateTime));
		
		disp.forward(request, response);
	}

}
