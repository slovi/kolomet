package cz.kolomet.service;
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
	

	public abstract long countAllProducts();


	public abstract void deleteProduct(Product product);


	public abstract Product findProduct(Long id);


	public abstract List<Product> findAllProducts();


	public abstract List<Product> findProductEntries(int firstResult, int maxResults);


	public abstract void saveProduct(Product product);


	public abstract Product updateProduct(Product product);

}
