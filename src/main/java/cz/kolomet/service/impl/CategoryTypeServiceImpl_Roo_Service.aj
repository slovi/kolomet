// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.repository.CategoryTypeRepository;
import cz.kolomet.service.impl.CategoryTypeServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CategoryTypeServiceImpl_Roo_Service {
    
    declare @type: CategoryTypeServiceImpl: @Service;
    
    declare @type: CategoryTypeServiceImpl: @Transactional;
    
    @Autowired
    CategoryTypeRepository CategoryTypeServiceImpl.categoryTypeRepository;
    
    public long CategoryTypeServiceImpl.countAllCategoryTypes() {
        return categoryTypeRepository.count();
    }
    
    public void CategoryTypeServiceImpl.deleteCategoryType(CategoryType categoryType) {
        categoryTypeRepository.delete(categoryType);
    }
    
    public CategoryType CategoryTypeServiceImpl.findCategoryType(Long id) {
        return categoryTypeRepository.findOne(id);
    }
    
    public List<CategoryType> CategoryTypeServiceImpl.findCategoryTypeEntries(int firstResult, int maxResults) {
        return categoryTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void CategoryTypeServiceImpl.saveCategoryType(CategoryType categoryType) {
        categoryTypeRepository.save(categoryType);
    }
    
    public CategoryType CategoryTypeServiceImpl.updateCategoryType(CategoryType categoryType) {
        return categoryTypeRepository.save(categoryType);
    }
    
}
