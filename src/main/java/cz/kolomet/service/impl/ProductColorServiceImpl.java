package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.service.ProductColorService;

public class ProductColorServiceImpl implements ProductColorService {
	
    public List<ProductColor> findAllProductColors() {
        return productColorRepository.findAll(Codelist.defaultSort());
    }
    
	public Page<ProductColor> findProductColorEntries(Pageable pageable) {
		return productColorRepository.findAll(pageable);
	}
	
}
