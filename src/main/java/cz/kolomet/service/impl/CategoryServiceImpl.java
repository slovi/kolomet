package cz.kolomet.service.impl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Category;
import cz.kolomet.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	
	public Page<Category> findCategoryEntries(Pageable pageable) {
		return categoryRepository.findAll(pageable);
	}
	
}
