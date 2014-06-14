package cz.kolomet.service;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.Product;

@RooService(domainTypes = { cz.kolomet.domain.Product.class })
public interface ProductService {
	
	public List<Product> findProductEntries(Specification<Product> specification);
	
	public Page<Product> findProductEntries(Specification<Product> specification, Pageable pageable);
	
	public Product copyProduct(Long id);
	
	public Product copyProduct(Product product);
	
}
