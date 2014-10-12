package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.repository.ProductAttributeTypeRepository;
import cz.kolomet.service.ProductAttributeTypeService;

@Service
@Transactional
public class ProductAttributeTypeServiceImpl implements ProductAttributeTypeService {
	
    public List<ProductAttributeType> findAllProductAttributeTypes() {
        return productAttributeTypeRepository.findAll(Codelist.defaultSort());
    }
	
	public Page<ProductAttributeType> findProductAttributeTypeEntries(Pageable pageable) {
		return productAttributeTypeRepository.findAll(pageable);
	}
	

	@Autowired
    ProductAttributeTypeRepository productAttributeTypeRepository;

	public long countAllProductAttributeTypes() {
        return productAttributeTypeRepository.count();
    }

	public void deleteProductAttributeType(ProductAttributeType productAttributeType) {
        productAttributeTypeRepository.delete(productAttributeType);
    }

	public ProductAttributeType findProductAttributeType(Long id) {
        return productAttributeTypeRepository.findOne(id);
    }

	public List<ProductAttributeType> findProductAttributeTypeEntries(int firstResult, int maxResults) {
        return productAttributeTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveProductAttributeType(ProductAttributeType productAttributeType) {
        productAttributeTypeRepository.save(productAttributeType);
    }

	public ProductAttributeType updateProductAttributeType(ProductAttributeType productAttributeType) {
        return productAttributeTypeRepository.save(productAttributeType);
    }
}
