package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.service.ProductAttributeTypeService;

public class ProductAttributeTypeServiceImpl implements ProductAttributeTypeService {
	
	public Page<ProductAttributeType> findProductAttributeTypeEntries(Pageable pageable) {
		return productAttributeTypeRepository.findAll(pageable);
	}
	
}
