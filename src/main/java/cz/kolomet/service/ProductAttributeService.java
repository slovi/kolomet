package cz.kolomet.service;
import cz.kolomet.domain.ProductAttribute;
import java.util.List;

public interface ProductAttributeService {

	public abstract long countAllProductAttributes();


	public abstract void deleteProductAttribute(ProductAttribute productAttribute);


	public abstract ProductAttribute findProductAttribute(Long id);


	public abstract List<ProductAttribute> findAllProductAttributes();


	public abstract List<ProductAttribute> findProductAttributeEntries(int firstResult, int maxResults);


	public abstract void saveProductAttribute(ProductAttribute productAttribute);


	public abstract ProductAttribute updateProductAttribute(ProductAttribute productAttribute);

}
