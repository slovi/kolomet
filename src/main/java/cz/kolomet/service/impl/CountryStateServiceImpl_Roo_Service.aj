// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.repository.CountryStateRepository;
import cz.kolomet.service.impl.CountryStateServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CountryStateServiceImpl_Roo_Service {
    
    declare @type: CountryStateServiceImpl: @Service;
    
    declare @type: CountryStateServiceImpl: @Transactional;
    
    @Autowired
    CountryStateRepository CountryStateServiceImpl.countryStateRepository;
    
    public long CountryStateServiceImpl.countAllCountryStates() {
        return countryStateRepository.count();
    }
    
    public void CountryStateServiceImpl.deleteCountryState(CountryState countryState) {
        countryStateRepository.delete(countryState);
    }
    
    public CountryState CountryStateServiceImpl.findCountryState(Long id) {
        return countryStateRepository.findOne(id);
    }
    
    public List<CountryState> CountryStateServiceImpl.findAllCountryStates() {
        return countryStateRepository.findAll();
    }
    
    public List<CountryState> CountryStateServiceImpl.findCountryStateEntries(int firstResult, int maxResults) {
        return countryStateRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void CountryStateServiceImpl.saveCountryState(CountryState countryState) {
        countryStateRepository.save(countryState);
    }
    
    public CountryState CountryStateServiceImpl.updateCountryState(CountryState countryState) {
        return countryStateRepository.save(countryState);
    }
    
}
