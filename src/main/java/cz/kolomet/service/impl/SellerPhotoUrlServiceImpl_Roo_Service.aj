// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.repository.SellerPhotoUrlRepository;

privileged aspect SellerPhotoUrlServiceImpl_Roo_Service {
    
    declare @type: SellerPhotoUrlServiceImpl: @Service;
    
    declare @type: SellerPhotoUrlServiceImpl: @Transactional;
    
    @Autowired
    SellerPhotoUrlRepository SellerPhotoUrlServiceImpl.sellerPhotoUrlRepository;
    
    public long SellerPhotoUrlServiceImpl.countAllSellerPhotoUrls() {
        return sellerPhotoUrlRepository.count();
    }
    
    public void SellerPhotoUrlServiceImpl.deleteSellerPhotoUrl(SellerPhotoUrl sellerPhotoUrl) {
        sellerPhotoUrlRepository.delete(sellerPhotoUrl);
    }
    
    public SellerPhotoUrl SellerPhotoUrlServiceImpl.findSellerPhotoUrl(Long id) {
        return sellerPhotoUrlRepository.findOne(id);
    }
    
    public List<SellerPhotoUrl> SellerPhotoUrlServiceImpl.findAllSellerPhotoUrls() {
        return sellerPhotoUrlRepository.findAll();
    }
    
    public List<SellerPhotoUrl> SellerPhotoUrlServiceImpl.findSellerPhotoUrlEntries(int firstResult, int maxResults) {
        return sellerPhotoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void SellerPhotoUrlServiceImpl.saveSellerPhotoUrl(SellerPhotoUrl sellerPhotoUrl) {
        sellerPhotoUrlRepository.save(sellerPhotoUrl);
    }
    
    public SellerPhotoUrl SellerPhotoUrlServiceImpl.updateSellerPhotoUrl(SellerPhotoUrl sellerPhotoUrl) {
        return sellerPhotoUrlRepository.save(sellerPhotoUrl);
    }
    
}
