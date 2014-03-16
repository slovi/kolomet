// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.codelist.Producer;
import cz.kolomet.repository.ProducerRepository;
import cz.kolomet.service.impl.RegionServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RegionServiceImpl_Roo_Service {
    
    declare @type: RegionServiceImpl: @Service;
    
    declare @type: RegionServiceImpl: @Transactional;
    
    @Autowired
    ProducerRepository RegionServiceImpl.producerRepository;
    
    public long RegionServiceImpl.countAllProducers() {
        return producerRepository.count();
    }
    
    public void RegionServiceImpl.deleteProducer(Producer producer) {
        producerRepository.delete(producer);
    }
    
    public Producer RegionServiceImpl.findProducer(Long id) {
        return producerRepository.findOne(id);
    }
    
    public List<Producer> RegionServiceImpl.findAllProducers() {
        return producerRepository.findAll();
    }
    
    public List<Producer> RegionServiceImpl.findProducerEntries(int firstResult, int maxResults) {
        return producerRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void RegionServiceImpl.saveProducer(Producer producer) {
        producerRepository.save(producer);
    }
    
    public Producer RegionServiceImpl.updateProducer(Producer producer) {
        return producerRepository.save(producer);
    }
    
}
