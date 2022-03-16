package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CartDaoImplement;

import dataBase.dataConnection;
@WebServlet("/remove_product")
public class RemoveProductCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId=Integer.parseInt(request.getParameter("productId"));
		CartDaoImplement cartDAO=new CartDaoImplement(dataConnection.databaseConnection());
		boolean status=cartDAO.deleteProduct(productId);
		if(status) {
			response.sendRedirect("CheckoutPage.jsp?message=valid");
		}
		else {
			response.sendRedirect("CheckoutPage.jsp?message=invalid");
		}
	}
	
	
	
}