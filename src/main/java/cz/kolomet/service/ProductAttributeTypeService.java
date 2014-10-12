package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.ProductAttributeType;

public interface ProductAttributeTypeService {
	
	public Page<ProductAttributeType> findProductAttributeTypeEntries(Pageable pageable);
	

	public abstract long countAllProductAttributeTypes();


	public abstract void deleteProductAttributeType(ProductAttributeType productAttributeType);


	public abstract ProductAttributeType findProductAttributeType(Long id);


	public abstract List<ProductAttributeType> findAllProductAttributeTypes();


	public abstract List<ProductAttributeType> findProductAttributeTypeEntries(int firstResult, int maxResults);


	public abstract void saveProductAttributeType(ProductAttributeType productAttributeType);


	public abstract ProductAttributeType updateProductAttributeType(ProductAttributeType productAttributeType);

}
