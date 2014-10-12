package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.BicycleCategory;

public interface BicycleCategoryService {
	
	public Page<BicycleCategory> findBicycleCategoryEntries(Pageable pageable);
	

	public abstract long countAllBicycleCategorys();


	public abstract void deleteBicycleCategory(BicycleCategory bicycleCategory);


	public abstract BicycleCategory findBicycleCategory(Long id);


	public abstract List<BicycleCategory> findAllBicycleCategorys();


	public abstract List<BicycleCategory> findBicycleCategoryEntries(int firstResult, int maxResults);


	public abstract void saveBicycleCategory(BicycleCategory bicycleCategory);


	public abstract BicycleCategory updateBicycleCategory(BicycleCategory bicycleCategory);

}
