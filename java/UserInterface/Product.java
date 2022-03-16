package UserInterface;

public class Product {
	private String productId;
	private String productName;
	private String productPrice;
	private String category;
	private String status;
	private String productImage;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String productId,String productName, String productPrice, String category, String status,
			String productImage) {
		super();
		this.productId=productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.category = category;
		this.status = status;
		this.productImage = productImage;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", category=" + category + ", status=" + status + ", productImage=" + productImage + "]";
	}
	
	
}