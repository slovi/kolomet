package cz.kolomet.service.impl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

import cz.kolomet.domain.Product;
import cz.kolomet.service.ProductService;

public class ProductServiceImpl implements ProductService {
	
	@PreAuthorize("hasRole('ROLE_per_products_all') or #product.seller.id == principal.sellerId")
    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }
    
	@PostAuthorize("isAnonymous() or hasRole('ROLE_per_products_all') or returnObject.seller.id == principal.sellerId")
    public Product findProduct(Long id) {
        return productRepository.findOne(id);
    }
    
	@PreAuthorize("hasRole('ROLE_per_products_all') or #product.seller.id == principal.sellerId")
    public void saveProduct(Product product) {
        productRepository.save(product);
    }
    
	@PreAuthorize("hasRole('ROLE_per_products_all') or #product.seller.id == principal.sellerId")
    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }
	
	@Override
	public Page<Product> findProductEntries(Pageable pageable) {
		return productRepository.findAll(pageable);
	}
	
	@Override
	public Page<Product> findProductEntries(Pageable pageable, Long sellerId) {
		return productRepository.findBySellerId(sellerId, pageable);
	}
	
}
