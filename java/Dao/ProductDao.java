package Dao;

import java.util.List;

import UserInterface.Product;

public interface ProductDao {
	public boolean addProduct(Product product);
	public List<Product> getAllProduct();
	public Product getProductById(int id);
	public boolean updateEditProduct(Product product);
	public boolean deleteProduct(int id);
	public List<Product> getKurtiProduct();
	public List<Product> getFloorTouchProduct();
	public List<Product> getSareeProduct();
	public List<Product> getAllKurtiProduct();
	public List<Product> getAllFloorTouchProduct();
	public List<Product> getAllSareeProduct();
}