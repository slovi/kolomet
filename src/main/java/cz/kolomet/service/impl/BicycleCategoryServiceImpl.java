package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.service.BicycleCategoryService;

public class BicycleCategoryServiceImpl implements BicycleCategoryService {
	
	public Page<BicycleCategory> findBicycleCategoryEntries(Pageable pageable) {
		return bicycleCategoryRepository.findAll(pageable);
	}
	
}
