package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.service.ProductUsageService;

public class ProductUsageServiceImpl implements ProductUsageService {
	
	public Page<ProductUsage> findProductUsageEntries(Pageable pageable) {
		return productUsageRepository.findAll(pageable);
	}
	
}
