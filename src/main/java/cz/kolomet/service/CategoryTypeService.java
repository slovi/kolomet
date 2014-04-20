package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.CategoryType;

@RooService(domainTypes = { cz.kolomet.domain.codelist.CategoryType.class })
public interface CategoryTypeService {
	
	public Page<CategoryType> findCategoryTypeEntries(Pageable pageable);
	
	public CategoryType findByCategoryCodeKey(String categoryCodeKey);
	
}
