package cz.kolomet.service;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Category;

public interface CategoryService {
	
	public Page<Category> findCategoryEntries(Pageable pageable);
	

	public abstract long countAllCategorys();


	public abstract void deleteCategory(Category category);


	public abstract Category findCategory(Long id);


	public abstract List<Category> findAllCategorys();


	public abstract List<Category> findCategoryEntries(int firstResult, int maxResults);


	public abstract void saveCategory(Category category);


	public abstract Category updateCategory(Category category);

}
