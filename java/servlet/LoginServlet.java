package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDaoImplement;
import dataBase.dataConnection;
import UserInterface.User;
@WebServlet("/Login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserDaoImplement userDAO=new UserDaoImplement(dataConnection.databaseConnection());
			HttpSession session=request.getSession();
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			if("Admin".equals(username) && "Admin@123".equals(password)) {
				User user=new User();
				user.setUsername("Admin");
				session.setAttribute("username", username);
				response.sendRedirect("ApplicationInterface/Admin.jsp");
			}else {
				User user=userDAO.login(username, password);
				if(user!=null) {
					session.setAttribute("username",username);
					response.sendRedirect("welcome.jsp");
				}
				else {
					response.sendRedirect("Login.jsp?message=notexist");
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}