package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.service.CategoryTypeService;

public class CategoryTypeServiceImpl implements CategoryTypeService {
	
	public Page<CategoryType> findCategoryTypeEntries(Pageable pageable) {
		return categoryTypeRepository.findAll(pageable);
	}
	
	public CategoryType findByCategoryCodeKey(String categoryCodeKey) {
		return categoryTypeRepository.findByCodeKeyOrderBySequenceNrDesc(categoryCodeKey);
	}
	
    public List<CategoryType> findAllCategoryTypes() {
        return categoryTypeRepository.findAll(Codelist.defaultSort());
    }
	
}
