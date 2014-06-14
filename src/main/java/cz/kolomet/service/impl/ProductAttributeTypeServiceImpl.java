package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.service.ProductAttributeTypeService;

public class ProductAttributeTypeServiceImpl implements ProductAttributeTypeService {
	
    public List<ProductAttributeType> findAllProductAttributeTypes() {
        return productAttributeTypeRepository.findAll(Codelist.defaultSort());
    }
	
	public Page<ProductAttributeType> findProductAttributeTypeEntries(Pageable pageable) {
		return productAttributeTypeRepository.findAll(pageable);
	}
	
}
