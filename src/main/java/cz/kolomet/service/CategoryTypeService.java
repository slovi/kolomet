package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.CategoryType;

public interface CategoryTypeService {
	
	public Page<CategoryType> findCategoryTypeEntries(Pageable pageable);
	
	public CategoryType findByCategoryCodeKey(String categoryCodeKey);
	

	public abstract long countAllCategoryTypes();


	public abstract void deleteCategoryType(CategoryType categoryType);


	public abstract CategoryType findCategoryType(Long id);


	public abstract List<CategoryType> findAllCategoryTypes();


	public abstract List<CategoryType> findCategoryTypeEntries(int firstResult, int maxResults);


	public abstract void saveCategoryType(CategoryType categoryType);


	public abstract CategoryType updateCategoryType(CategoryType categoryType);

}
