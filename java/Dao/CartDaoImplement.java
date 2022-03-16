package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import UserInterface.Cart;

public class CartDaoImplement implements CartDao{
	private Connection connection;
	
	public CartDaoImplement(Connection connection) {
		this.connection=connection;
	}

	public boolean addCart(Cart cart) {
		boolean status=false;
		try {
			String sql="insert into cart(ProductId,ProductName,Category,Price,TotalPrice) values(?,?,?,?,?)";
			PreparedStatement preparestatement=connection.prepareStatement(sql);
			preparestatement.setInt(1, cart.getProductId());
			preparestatement.setString(2, cart.getProductName());
			preparestatement.setString(3, cart.getCategory());
			preparestatement.setDouble(4, cart.getPrice());
			preparestatement.setDouble(5, cart.getTotalPrice());
			int index=preparestatement.executeUpdate();
			if(index==1) {
				status=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<Cart> getProductByUser(int userId) {
		List<Cart> list=new ArrayList<Cart>();
		Cart cart=null;
		double totalPrice=0;
		try {
			String sql="select * from cart";
			PreparedStatement preparestatement=connection.prepareStatement(sql);
			ResultSet resultSet=preparestatement.executeQuery();
			while(resultSet.next()) {
				cart=new Cart();
				cart.setCartId(resultSet.getInt(1));
				cart.setProductId(resultSet.getInt(2));
				cart.setProductName(resultSet.getString(3));
				cart.setCategory(resultSet.getString(4));
				cart.setPrice(resultSet.getDouble(5));
				totalPrice=totalPrice+resultSet.getDouble(6);
				cart.setTotalPrice(totalPrice);
				list.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteProduct(int productId) {
		boolean status=false;
		try {
			String sql="delete from cart where ProductId=?";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, productId);
			int index=preparedStatement.executeUpdate();
			if(index==1) {
				status=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	

}