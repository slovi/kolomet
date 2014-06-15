package cz.kolomet.service.impl;
import java.io.File;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductState;
import cz.kolomet.service.ProductService;

public class ProductServiceImpl implements ProductService {
	
	@Value("${img.rootdir}")
	protected String rootDir;
	
	@PreAuthorize("principal.isCapableToDeleteProduct(#product)")
    public void deleteProduct(Product product) {
        product.setEnabled(false);
        product.setValidTo(new Date());
        product.setProductState(ProductState.DELETED);
    }
    
	@PostAuthorize("isAnonymous() or principal.isCapableToDisplayProduct(returnObject)")
    public Product findProduct(Long id) {
        return productRepository.findOne(id);
    }
    
	@PreAuthorize("principal.isCapableToSaveProduct(#product)")
    public void saveProduct(Product product) {
		
		// prepocitame cenu a ulozime (pokud se jedna o novy produkt, tak nastavime na activni)
		product.computeAndSetDiscount();
		if (product.isEmptyState()) {
			product.setProductState(ProductState.ACTIVE);
		}
        productRepository.save(product);
        
        // nejdrive musi byt produkt ulozen, pak bude mit ID a az pak muzeme kopirovat slozky
        if (product.isCopyState()) {
        	product.copyPhotoUrlFiles(new File(rootDir));
        	// pak nasledne muzeme zmenit stav na aktivni a aktualizovat
        	product.setProductState(ProductState.ACTIVE);
        	productRepository.save(product);
        }
    }
    
	@PreAuthorize("principal.isCapableToUpdateProduct(#product)")
    public Product updateProduct(Product product) {
		product.computeAndSetDiscount();		
		product.setProductState(ProductState.ACTIVE);
        return productRepository.save(product);
    }
	
	@Override
	public List<Product> findProductEntries(Specification<Product> specification) {
		return productRepository.findAll(specification);
	}
	
	@Override
	public Page<Product> findProductEntries(Specification<Product> specification, Pageable pageable) {
		return productRepository.findAll(specification, pageable);
	}

	@Override
	public Product copyProduct(Long id) {
		return copyProduct(findProduct(id));
	}
	
	@Override
	@PreAuthorize("principal.isCapableToCopyProduct(#product)")
	public Product copyProduct(Product product) {
		Product newProduct = product.copy();
		newProduct.setValidFrom(new Date());
		if (newProduct.getValidTo() != null && newProduct.getValidTo().before(new Date())) {
			newProduct.setValidTo(Product.DEFAULT_VALID_TO_DATE);
		}
    	newProduct.setProductState(ProductState.COPY);
		return newProduct;
	}
	
}