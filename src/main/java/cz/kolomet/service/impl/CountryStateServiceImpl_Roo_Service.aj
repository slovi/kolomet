// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.codelist.Producer;
import cz.kolomet.service.impl.CountryStateServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CountryStateServiceImpl_Roo_Service {
    
    declare @type: CountryStateServiceImpl: @Service;
    
    declare @type: CountryStateServiceImpl: @Transactional;
    
    public long CountryStateServiceImpl.countAllProducers() {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public void CountryStateServiceImpl.deleteProducer(Producer producer) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public Producer CountryStateServiceImpl.findProducer(Long id) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public List<Producer> CountryStateServiceImpl.findAllProducers() {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public List<Producer> CountryStateServiceImpl.findProducerEntries(int firstResult, int maxResults) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public void CountryStateServiceImpl.saveProducer(Producer producer) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public Producer CountryStateServiceImpl.updateProducer(Producer producer) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
}
