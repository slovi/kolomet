package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.repository.BicycleCategoryRepository;
import cz.kolomet.service.BicycleCategoryService;

@Service
@Transactional
public class BicycleCategoryServiceImpl implements BicycleCategoryService {

	@Autowired
    BicycleCategoryRepository bicycleCategoryRepository;
	
	public Page<BicycleCategory> findBicycleCategoryEntries(Pageable pageable) {
		return bicycleCategoryRepository.findAll(pageable);
	}
	
    public List<BicycleCategory> findAllBicycleCategorys() {
        return bicycleCategoryRepository.findAll(Codelist.defaultSort());
    }

	public long countAllBicycleCategorys() {
        return bicycleCategoryRepository.count();
    }

	public void deleteBicycleCategory(BicycleCategory bicycleCategory) {
        bicycleCategoryRepository.delete(bicycleCategory);
    }

	public BicycleCategory findBicycleCategory(Long id) {
        return bicycleCategoryRepository.findOne(id);
    }

	public List<BicycleCategory> findBicycleCategoryEntries(int firstResult, int maxResults) {
        return bicycleCategoryRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveBicycleCategory(BicycleCategory bicycleCategory) {
        bicycleCategoryRepository.save(bicycleCategory);
    }

	public BicycleCategory updateBicycleCategory(BicycleCategory bicycleCategory) {
        return bicycleCategoryRepository.save(bicycleCategory);
    }
}
