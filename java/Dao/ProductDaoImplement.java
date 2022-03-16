package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import UserInterface.Product;

public class ProductDaoImplement implements ProductDao{
	
	private Connection connection;

	public ProductDaoImplement(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addProduct(Product product) {
		boolean status=false;
		try {
			String sql="insert into product(ProductId,ProductName,ProductPrice,Category,Status,ProductImage) values(?,?,?,?,?,?)";
			PreparedStatement preparestatement=connection.prepareStatement(sql);
			preparestatement.setString(1,product.getProductId());
			preparestatement.setString(2,product.getProductName());
			preparestatement.setString(3,product.getProductPrice());
			preparestatement.setString(4,product.getCategory());
			preparestatement.setString(5,product.getStatus());
			preparestatement.setString(6,product.getProductImage());
			
			int index=preparestatement.executeUpdate();
			if(index==1) {
				status=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<Product> getAllProduct() {
		List<Product> list=new ArrayList<Product>();
		Product product=null;
		try {
			String sql="select * from product";
			PreparedStatement prepareStatement=connection.prepareStatement(sql);
			ResultSet resultSet=prepareStatement.executeQuery();
			while(resultSet.next()) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
				list.add(product);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Product getProductById(int id) {
		Product product=null;
		try {
			String sql="select * from product where ProductId=?";
			PreparedStatement prepareStatement=connection.prepareStatement(sql);
			prepareStatement.setInt(1, id);
			ResultSet resultSet=prepareStatement.executeQuery();
			while(resultSet.next()) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	public boolean updateEditProduct(Product product) {
		boolean status=false;
		try {
			String sql="update product set ProductName=?,ProductPrice=?,Status=? where ProductId=?";
			PreparedStatement prepareStatement=connection.prepareStatement(sql);
			
			prepareStatement.setString(1,product.getProductName());
			prepareStatement.setString(2, product.getProductPrice());
			prepareStatement.setString(3, product.getStatus());
			prepareStatement.setString(4, product.getProductId());
			int index=prepareStatement.executeUpdate();
			if(index==1) {
				status=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public boolean deleteProduct(int id) {
		boolean status=false;
		try {
			String sql="delete from product where ProductId=?";
			PreparedStatement prepareStatement=connection.prepareStatement(sql);
			prepareStatement.setInt(1,id);
			int index=prepareStatement.executeUpdate();
			if(index==1) {
				status=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<Product> getKurtiProduct() {
		List<Product> list=new ArrayList<Product>();
		Product product=null;
		try {
			String sql="select * from product where Category=? and Status=? order by ProductId DESC";
			PreparedStatement prepareStatement=connection.prepareStatement(sql); 
			prepareStatement.setString(1, "Kurti");
			prepareStatement.setString(2, "Active");
			ResultSet resultSet=prepareStatement.executeQuery();
			int index=1;
			while(resultSet.next() && index<=3) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
				list.add(product);
				index++;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Product> getFloorTouchProduct() {
		List<Product> list=new ArrayList<Product>();
		Product product=null;
		try {
			String sql="select * from product where Category=? and Status=? order by ProductId DESC";
			PreparedStatement prepareStatement=connection.prepareStatement(sql); 
			prepareStatement.setString(1, "LongGown");
			prepareStatement.setString(2, "Active");
			ResultSet resultSet=prepareStatement.executeQuery();
			int index=1;
			while(resultSet.next() && index<=3) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
				list.add(product);
				index++;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}

	public List<Product> getSareeProduct() {
		List<Product> list=new ArrayList<Product>();
		Product product=null;
		try {
			String sql="select * from product where Category=? and Status=? order by ProductId DESC";
			PreparedStatement prepareStatement=connection.prepareStatement(sql); 
			prepareStatement.setString(1, "Saree");
			prepareStatement.setString(2, "Active");
			ResultSet resultSet=prepareStatement.executeQuery();
			int index=1;
			while(resultSet.next() && index<=3) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
				list.add(product);
				index++;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}

	public List<Product> getAllKurtiProduct() {
		List<Product> list=new ArrayList<Product>();
		Product product=null;
		try {
			String sql="select * from product where Category=? and Status=? order by ProductId DESC";
			PreparedStatement prepareStatement=connection.prepareStatement(sql); 
			prepareStatement.setString(1, "Kurti");
			prepareStatement.setString(2, "Active");
			ResultSet resultSet=prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
				list.add(product);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getAllFloorTouchProduct() {
		List<Product> list=new ArrayList<Product>();
		Product product=null;
		try {
			String sql="select * from product where Category=? and Status=? order by ProductId DESC";
			PreparedStatement prepareStatement=connection.prepareStatement(sql); 
			prepareStatement.setString(1, "LongGown");
			prepareStatement.setString(2, "Active");
			ResultSet resultSet=prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
				list.add(product);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Product> getAllSareeProduct() {
		List<Product> list=new ArrayList<Product>();
		Product product=null;
		try {
			String sql="select * from product where Category=? and Status=? order by ProductId DESC";
			PreparedStatement prepareStatement=connection.prepareStatement(sql); 
			prepareStatement.setString(1, "Saree");
			prepareStatement.setString(2, "Active");
			ResultSet resultSet=prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				product=new Product();
				product.setProductId(resultSet.getString(1));
				product.setProductName(resultSet.getString(2));
				product.setProductPrice(resultSet.getString(3));
				product.setCategory(resultSet.getString(4));
				product.setStatus(resultSet.getString(5));
				product.setProductImage(resultSet.getString(6));
				list.add(product);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
	
}