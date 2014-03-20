// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.Producer;
import cz.kolomet.repository.ProducerRepository;
import cz.kolomet.service.impl.ProducerServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProducerServiceImpl_Roo_Service {
    
    declare @type: ProducerServiceImpl: @Service;
    
    declare @type: ProducerServiceImpl: @Transactional;
    
    @Autowired
    ProducerRepository ProducerServiceImpl.producerRepository;
    
    public long ProducerServiceImpl.countAllProducers() {
        return producerRepository.count();
    }
    
    public void ProducerServiceImpl.deleteProducer(Producer producer) {
        producerRepository.delete(producer);
    }
    
    public Producer ProducerServiceImpl.findProducer(Long id) {
        return producerRepository.findOne(id);
    }
    
    public List<Producer> ProducerServiceImpl.findAllProducers() {
        return producerRepository.findAll();
    }
    
    public List<Producer> ProducerServiceImpl.findProducerEntries(int firstResult, int maxResults) {
        return producerRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ProducerServiceImpl.saveProducer(Producer producer) {
        producerRepository.save(producer);
    }
    
    public Producer ProducerServiceImpl.updateProducer(Producer producer) {
        return producerRepository.save(producer);
    }
    
}
