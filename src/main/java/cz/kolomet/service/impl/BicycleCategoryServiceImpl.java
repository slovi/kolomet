package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.service.BicycleCategoryService;

public class BicycleCategoryServiceImpl implements BicycleCategoryService {
	
	public Page<BicycleCategory> findBicycleCategoryEntries(Pageable pageable) {
		return bicycleCategoryRepository.findAll(pageable);
	}
	
    public List<BicycleCategory> findAllBicycleCategorys() {
        return bicycleCategoryRepository.findAll(Codelist.defaultSort());
    }
	
}
