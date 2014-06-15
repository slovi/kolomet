// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.repository.PlaceTypeRepository;
import cz.kolomet.service.impl.PlaceTypeServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PlaceTypeServiceImpl_Roo_Service {
    
    declare @type: PlaceTypeServiceImpl: @Service;
    
    declare @type: PlaceTypeServiceImpl: @Transactional;
    
    @Autowired
    PlaceTypeRepository PlaceTypeServiceImpl.placeTypeRepository;
    
    public long PlaceTypeServiceImpl.countAllPlaceTypes() {
        return placeTypeRepository.count();
    }
    
    public void PlaceTypeServiceImpl.deletePlaceType(PlaceType placeType) {
        placeTypeRepository.delete(placeType);
    }
    
    public PlaceType PlaceTypeServiceImpl.findPlaceType(Long id) {
        return placeTypeRepository.findOne(id);
    }
    
    public List<PlaceType> PlaceTypeServiceImpl.findAllPlaceTypes() {
        return placeTypeRepository.findAll();
    }
    
    public List<PlaceType> PlaceTypeServiceImpl.findPlaceTypeEntries(int firstResult, int maxResults) {
        return placeTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PlaceTypeServiceImpl.savePlaceType(PlaceType placeType) {
        placeTypeRepository.save(placeType);
    }
    
    public PlaceType PlaceTypeServiceImpl.updatePlaceType(PlaceType placeType) {
        return placeTypeRepository.save(placeType);
    }
    
}
