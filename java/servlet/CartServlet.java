package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CartDaoImplement;
import Dao.ProductDaoImplement;

import dataBase.dataConnection;
import UserInterface.Cart;
import UserInterface.Product;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int productId=Integer.parseInt(request.getParameter("productId"));
			ProductDaoImplement productDAO=new ProductDaoImplement(dataConnection.databaseConnection());
			Product product=productDAO.getProductById(productId);
			Cart cart=new Cart();
			cart.setProductId(productId);
			cart.setProductName(product.getProductName());
			cart.setCategory(product.getCategory());
			cart.setPrice(Double.parseDouble(product.getProductPrice()));
			cart.setTotalPrice(Double.parseDouble(product.getProductPrice()));
			
			CartDaoImplement cartDAO=new CartDaoImplement(dataConnection.databaseConnection());
			boolean status=cartDAO.addCart(cart);
			if(status) {
				response.sendRedirect("welcome.jsp?message=valid");
			}
			else {
				response.sendRedirect("welcome.jsp?message=invalid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}