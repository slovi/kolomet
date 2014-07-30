// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.Rate;
import cz.kolomet.repository.RateRepository;
import cz.kolomet.service.impl.RateServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RateServiceImpl_Roo_Service {
    
    declare @type: RateServiceImpl: @Service;
    
    declare @type: RateServiceImpl: @Transactional;
    
    @Autowired
    RateRepository RateServiceImpl.rateRepository;
    
    public long RateServiceImpl.countAllRates() {
        return rateRepository.count();
    }
    
    public void RateServiceImpl.deleteRate(Rate rate) {
        rateRepository.delete(rate);
    }
    
    public Rate RateServiceImpl.findRate(Long id) {
        return rateRepository.findOne(id);
    }
    
    public List<Rate> RateServiceImpl.findAllRates() {
        return rateRepository.findAll();
    }
    
    public List<Rate> RateServiceImpl.findRateEntries(int firstResult, int maxResults) {
        return rateRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public Rate RateServiceImpl.updateRate(Rate rate) {
        return rateRepository.save(rate);
    }
    
}