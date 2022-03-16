package adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDaoImplement;

import dataBase.dataConnection;

@WebServlet("/Delete")
public class DeleteProducts extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			ProductDaoImplement productDAO=new ProductDaoImplement(dataConnection.databaseConnection());
			boolean delete=productDAO.deleteProduct(id);
			if(delete) {
				
				response.sendRedirect("ApplicationInterface/AddEditProduct.jsp?message=success");
			}
			else {
				response.sendRedirect("ApplicationInterface/AddEditProduct.jsp?message=error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}