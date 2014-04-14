package cz.kolomet.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.Product;

@RooService(domainTypes = { cz.kolomet.domain.Product.class })
public interface ProductService {
	
	public Page<Product> findProductEntries(Pageable pageable);
	
	public Page<Product> findProductEntries(Pageable pageable, Long sellerId);
	
}
