package cz.kolomet.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Category;
import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	public Page<Category> findCategoryEntries(Pageable pageable) {
		return categoryRepository.findAll(pageable);
	}
	

	@Autowired
    CategoryRepository categoryRepository;

	public long countAllCategorys() {
        return categoryRepository.count();
    }

	public void deleteCategory(Category category) {
        categoryRepository.delete(category);
    }

	public Category findCategory(Long id) {
        return categoryRepository.findOne(id);
    }

	public List<Category> findAllCategorys() {
        return categoryRepository.findAll();
    }

	public List<Category> findCategoryEntries(int firstResult, int maxResults) {
        return categoryRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveCategory(Category category) {
        categoryRepository.save(category);
    }

	public Category updateCategory(Category category) {
        return categoryRepository.save(category);
    }
}
