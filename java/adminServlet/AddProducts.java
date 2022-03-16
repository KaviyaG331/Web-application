package adminServlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Dao.ProductDaoImplement;

import dataBase.dataConnection;
import UserInterface.Product;

@WebServlet("/AddProduct")
@MultipartConfig
public class AddProducts extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String productId=request.getParameter("id");
			String productName=request.getParameter("productName");
			String productPrice=request.getParameter("productPrice");
			String category=request.getParameter("category");
			String status=request.getParameter("status");
			Part part=request.getPart("image");
			String fileName=part.getSubmittedFileName();
			
			Product product=new Product(productId,productName,productPrice,category,status,fileName);
			ProductDaoImplement productDAO=new ProductDaoImplement(dataConnection.databaseConnection());
						
			boolean productStatus=productDAO.addProduct(product);
			if(productStatus) {
				String path=getServletContext().getRealPath("")+"images";
				File file=new File(path);
				part.write(path+File.separator + fileName);
				
				response.sendRedirect("ApplicationInterface/AddProduct.jsp?message=done");
			}
			else {
				response.sendRedirect("ApplicationInterface/AddProduct.jsp?message=wrong");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}