package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.service.ProductUsageService;

public class ProductUsageServiceImpl implements ProductUsageService {
	
    public List<ProductUsage> findAllProductUsages() {
        return productUsageRepository.findAll(Codelist.defaultSort());
    }
	
	public Page<ProductUsage> findProductUsageEntries(Pageable pageable) {
		return productUsageRepository.findAll(pageable);
	}
	
}
