package cz.kolomet.service;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Product;

public interface ProductService { 
	
	
	public List<Product> findProductEntries(Specification<Product> specification);
	
	
	public Page<Product> findProductEntries(Specification<Product> specification, Pageable pageable);
	
	
	public Product copyProduct(Long id);
	
	
	public Product copyProduct(Product product);
	
	
	public void eraseProduct(Product product);
	

	public long countAllProducts();


	public void deleteProduct(Product product);


	public Product detail(Long id, String userInfo);
	
	
	public Product findProduct(Long id);


	public List<Product> findAllProducts();


	public List<Product> findProductEntries(int firstResult, int maxResults);


	public void saveProduct(Product product);


	public Product updateProduct(Product product);
	
	
	public BigDecimal findMaxPrice();
	
	
	public Double findMaxWeight();
	
	
	public BigDecimal findMaxDiscount();

}
