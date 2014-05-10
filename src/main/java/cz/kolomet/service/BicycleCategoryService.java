package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.BicycleCategory;

@RooService(domainTypes = { cz.kolomet.domain.codelist.BicycleCategory.class })
public interface BicycleCategoryService {
	
	public Page<BicycleCategory> findBicycleCategoryEntries(Pageable pageable);
	
}
