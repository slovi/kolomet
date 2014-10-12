package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.repository.CategoryTypeRepository;
import cz.kolomet.service.CategoryTypeService;

@Service
@Transactional
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
	

	@Autowired
    CategoryTypeRepository categoryTypeRepository;

	public long countAllCategoryTypes() {
        return categoryTypeRepository.count();
    }

	public void deleteCategoryType(CategoryType categoryType) {
        categoryTypeRepository.delete(categoryType);
    }

	public CategoryType findCategoryType(Long id) {
        return categoryTypeRepository.findOne(id);
    }

	public List<CategoryType> findCategoryTypeEntries(int firstResult, int maxResults) {
        return categoryTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveCategoryType(CategoryType categoryType) {
        categoryTypeRepository.save(categoryType);
    }

	public CategoryType updateCategoryType(CategoryType categoryType) {
        return categoryTypeRepository.save(categoryType);
    }
}
