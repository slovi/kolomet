package cz.kolomet.service.impl;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.repository.ProductAttributeRepository;
import cz.kolomet.service.ProductAttributeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductAttributeServiceImpl implements ProductAttributeService {


	@Autowired
    ProductAttributeRepository productAttributeRepository;

	public long countAllProductAttributes() {
        return productAttributeRepository.count();
    }

	public void deleteProductAttribute(ProductAttribute productAttribute) {
        productAttributeRepository.delete(productAttribute);
    }

	public ProductAttribute findProductAttribute(Long id) {
        return productAttributeRepository.findOne(id);
    }

	public List<ProductAttribute> findAllProductAttributes() {
        return productAttributeRepository.findAll();
    }

	public List<ProductAttribute> findProductAttributeEntries(int firstResult, int maxResults) {
        return productAttributeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveProductAttribute(ProductAttribute productAttribute) {
        productAttributeRepository.save(productAttribute);
    }

	public ProductAttribute updateProductAttribute(ProductAttribute productAttribute) {
        return productAttributeRepository.save(productAttribute);
    }
}
