// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service;

import cz.kolomet.domain.codelist.Producer;
import cz.kolomet.service.CountryStateService;
import java.util.List;

privileged aspect CountryStateService_Roo_Service {
    
    public abstract long CountryStateService.countAllProducers();    
    public abstract void CountryStateService.deleteProducer(Producer producer);    
    public abstract Producer CountryStateService.findProducer(Long id);    
    public abstract List<Producer> CountryStateService.findAllProducers();    
    public abstract List<Producer> CountryStateService.findProducerEntries(int firstResult, int maxResults);    
    public abstract void CountryStateService.saveProducer(Producer producer);    
    public abstract Producer CountryStateService.updateProducer(Producer producer);    
}
