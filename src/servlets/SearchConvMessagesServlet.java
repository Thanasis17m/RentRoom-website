package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.UserDAOImpl;
import entities.SentMessage;
import java.util.List;

/**
 * Servlet implementation class SearchConvMessagesServlet
 */
@WebServlet("/htmlCssFiles/searchConvMessages")
public class SearchConvMessagesServlet extends HttpServlet {
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
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/conversation.jsp");
		HttpSession session = request.getSession();
		UserDAO dao = new UserDAOImpl(false);
		String senderUsername =(String) session.getAttribute("username");
		String receiverUsername = request.getParameter("view_conv");
		List<SentMessage> message_list = dao.findConvMessages(senderUsername,receiverUsername);
		
		request.setAttribute("conv_messages",message_list);
		session.setAttribute("host_name", request.getParameter("view_conv"));
		disp.forward(request, response);
	}

}
