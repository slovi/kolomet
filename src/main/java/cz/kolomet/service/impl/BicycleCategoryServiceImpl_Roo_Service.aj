// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.repository.BicycleCategoryRepository;

privileged aspect BicycleCategoryServiceImpl_Roo_Service {
    
    declare @type: BicycleCategoryServiceImpl: @Service;
    
    declare @type: BicycleCategoryServiceImpl: @Transactional;
    
    @Autowired
    BicycleCategoryRepository BicycleCategoryServiceImpl.bicycleCategoryRepository;
    
    public long BicycleCategoryServiceImpl.countAllBicycleCategorys() {
        return bicycleCategoryRepository.count();
    }
    
    public void BicycleCategoryServiceImpl.deleteBicycleCategory(BicycleCategory bicycleCategory) {
        bicycleCategoryRepository.delete(bicycleCategory);
    }
    
    public BicycleCategory BicycleCategoryServiceImpl.findBicycleCategory(Long id) {
        return bicycleCategoryRepository.findOne(id);
    }
    
    public List<BicycleCategory> BicycleCategoryServiceImpl.findBicycleCategoryEntries(int firstResult, int maxResults) {
        return bicycleCategoryRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void BicycleCategoryServiceImpl.saveBicycleCategory(BicycleCategory bicycleCategory) {
        bicycleCategoryRepository.save(bicycleCategory);
    }
    
    public BicycleCategory BicycleCategoryServiceImpl.updateBicycleCategory(BicycleCategory bicycleCategory) {
        return bicycleCategoryRepository.save(bicycleCategory);
    }
    
}
