// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.Place;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.service.impl.PlaceServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PlaceServiceImpl_Roo_Service {
    
    declare @type: PlaceServiceImpl: @Service;
    
    declare @type: PlaceServiceImpl: @Transactional;
    
    @Autowired
    PlaceRepository PlaceServiceImpl.placeRepository;
    
    public long PlaceServiceImpl.countAllPlaces() {
        return placeRepository.count();
    }
    
    public void PlaceServiceImpl.deletePlace(Place place) {
        placeRepository.delete(place);
    }
    
    public Place PlaceServiceImpl.findPlace(Long id) {
        return placeRepository.findOne(id);
    }
    
    public List<Place> PlaceServiceImpl.findAllPlaces() {
        return placeRepository.findAll();
    }
    
    public List<Place> PlaceServiceImpl.findPlaceEntries(int firstResult, int maxResults) {
        return placeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PlaceServiceImpl.savePlace(Place place) {
        placeRepository.save(place);
    }
    
    public Place PlaceServiceImpl.updatePlace(Place place) {
        return placeRepository.save(place);
    }
    
}