// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.repository.PhotoUrlRepository;
import cz.kolomet.service.impl.PhotoUrlServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PhotoUrlServiceImpl_Roo_Service {
    
    declare @type: PhotoUrlServiceImpl: @Service;
    
    declare @type: PhotoUrlServiceImpl: @Transactional;
    
    @Autowired
    PhotoUrlRepository PhotoUrlServiceImpl.photoUrlRepository;
    
    public long PhotoUrlServiceImpl.countAllPhotoUrls() {
        return photoUrlRepository.count();
    }
    
    public void PhotoUrlServiceImpl.deletePhotoUrl(PhotoUrl photoUrl) {
        photoUrlRepository.delete(photoUrl);
    }
    
    public PhotoUrl PhotoUrlServiceImpl.findPhotoUrl(Long id) {
        return photoUrlRepository.findOne(id);
    }
    
    public List<PhotoUrl> PhotoUrlServiceImpl.findAllPhotoUrls() {
        return photoUrlRepository.findAll();
    }
    
    public List<PhotoUrl> PhotoUrlServiceImpl.findPhotoUrlEntries(int firstResult, int maxResults) {
        return photoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PhotoUrlServiceImpl.savePhotoUrl(PhotoUrl photoUrl) {
        photoUrlRepository.save(photoUrl);
    }
    
    public PhotoUrl PhotoUrlServiceImpl.updatePhotoUrl(PhotoUrl photoUrl) {
        return photoUrlRepository.save(photoUrl);
    }
    
}
