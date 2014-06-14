package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.ProductColor;

@RooService(domainTypes = { cz.kolomet.domain.codelist.ProductColor.class })
public interface ProductColorService {
	
	public Page<ProductColor> findProductColorEntries(Pageable pageable);
	
}
