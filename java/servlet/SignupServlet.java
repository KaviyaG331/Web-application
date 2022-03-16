package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.UserDaoImplement;
import dataBase.dataConnection;
import UserInterface.User;
@WebServlet("/Signup")
public class SignupServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username=request.getParameter("username");
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phonenumber");
			String password=request.getParameter("password");
			String repassword=request.getParameter("repassword");
			//System.out.println(username+" "+email+" "+phoneNumber+" "+password+" "+repassword);
			User user=new User();
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setRepassword(repassword);
			user.setPhonenumber(phoneNumber);
			
			UserDaoImplement userDAO=new UserDaoImplement(dataConnection.databaseConnection());
			boolean status=userDAO.userRegister(user);
			if(status) {
				response.sendRedirect("welcome.jsp?message=valid");
			}
			else {
				response.sendRedirect("Signup.jsp?message=invalid");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}