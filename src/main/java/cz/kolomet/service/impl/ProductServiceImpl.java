package cz.kolomet.service.impl;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

import cz.kolomet.domain.Product;
import cz.kolomet.service.ProductService;

public class ProductServiceImpl implements ProductService {
	
	@PreAuthorize("#product.seller.id == principal.sellerId")
    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }
    
	@PostAuthorize("isAnonymous() or returnObject.seller.id == principal.sellerId")
    public Product findProduct(Long id) {
        return productRepository.findOne(id);
    }
    
	@PreAuthorize("#product.seller.id == principal.sellerId")
    public void saveProduct(Product product) {
        productRepository.save(product);
    }
    
	@PreAuthorize("#product.seller.id == principal.sellerId")
    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }
	
}
