package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.ProductAttributeType;

@RooService(domainTypes = { cz.kolomet.domain.codelist.ProductAttributeType.class })
public interface ProductAttributeTypeService {
	
	public Page<ProductAttributeType> findProductAttributeTypeEntries(Pageable pageable);
	
}
