package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.ProductUsage;

@RooService(domainTypes = { cz.kolomet.domain.codelist.ProductUsage.class })
public interface ProductUsageService {
	
	public Page<ProductUsage> findProductUsageEntries(Pageable pageable);
	
}
