// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.codelist.Producer;
import cz.kolomet.service.impl.RegionServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RegionServiceImpl_Roo_Service {
    
    declare @type: RegionServiceImpl: @Service;
    
    declare @type: RegionServiceImpl: @Transactional;
    
    public long RegionServiceImpl.countAllProducers() {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public void RegionServiceImpl.deleteProducer(Producer producer) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public Producer RegionServiceImpl.findProducer(Long id) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public List<Producer> RegionServiceImpl.findAllProducers() {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public List<Producer> RegionServiceImpl.findProducerEntries(int firstResult, int maxResults) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public void RegionServiceImpl.saveProducer(Producer producer) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
    public Producer RegionServiceImpl.updateProducer(Producer producer) {
        throw new UnsupportedOperationException("Implement me!");
    }
    
}
