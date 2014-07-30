// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.repository.PlacePhotoUrlRepository;
import cz.kolomet.service.impl.PlacePhotoUrlServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PlacePhotoUrlServiceImpl_Roo_Service {
    
    declare @type: PlacePhotoUrlServiceImpl: @Service;
    
    declare @type: PlacePhotoUrlServiceImpl: @Transactional;
    
    @Autowired
    PlacePhotoUrlRepository PlacePhotoUrlServiceImpl.placePhotoUrlRepository;
    
    public long PlacePhotoUrlServiceImpl.countAllPlacePhotoUrls() {
        return placePhotoUrlRepository.count();
    }
    
    public PlacePhotoUrl PlacePhotoUrlServiceImpl.findPlacePhotoUrl(Long id) {
        return placePhotoUrlRepository.findOne(id);
    }
    
    public List<PlacePhotoUrl> PlacePhotoUrlServiceImpl.findAllPlacePhotoUrls() {
        return placePhotoUrlRepository.findAll();
    }
    
    public List<PlacePhotoUrl> PlacePhotoUrlServiceImpl.findPlacePhotoUrlEntries(int firstResult, int maxResults) {
        return placePhotoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PlacePhotoUrlServiceImpl.savePlacePhotoUrl(PlacePhotoUrl placePhotoUrl) {
        placePhotoUrlRepository.save(placePhotoUrl);
    }
    
    public PlacePhotoUrl PlacePhotoUrlServiceImpl.updatePlacePhotoUrl(PlacePhotoUrl placePhotoUrl) {
        return placePhotoUrlRepository.save(placePhotoUrl);
    }
    
}