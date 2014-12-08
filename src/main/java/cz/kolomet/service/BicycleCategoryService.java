package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.BicycleCategory;

public interface BicycleCategoryService {
	
	
	public Page<BicycleCategory> findBicycleCategoryEntries(Pageable pageable);
	

	public long countAllBicycleCategorys();


	public void deleteBicycleCategory(BicycleCategory bicycleCategory);

	
	public BicycleCategory getBicycleCategory(Long id);
	

	public BicycleCategory findBicycleCategory(Long id);


	public List<BicycleCategory> findAllBicycleCategorys();


	public List<BicycleCategory> findBicycleCategoryEntries(int firstResult, int maxResults);


	public void saveBicycleCategory(BicycleCategory bicycleCategory);


	public BicycleCategory updateBicycleCategory(BicycleCategory bicycleCategory);

}
