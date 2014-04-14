package cz.kolomet.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.Category;

@RooService(domainTypes = { cz.kolomet.domain.Category.class })
public interface CategoryService {
	
	public Page<Category> findCategoryEntries(Pageable pageable);
	
}
