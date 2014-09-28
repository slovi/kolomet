// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.repository.NewsItemPhotoUrlRepository;

privileged aspect NewsItemPhotoUrlServiceImpl_Roo_Service {
    
    declare @type: NewsItemPhotoUrlServiceImpl: @Service;
    
    declare @type: NewsItemPhotoUrlServiceImpl: @Transactional;
    
    @Autowired
    NewsItemPhotoUrlRepository NewsItemPhotoUrlServiceImpl.newsItemPhotoUrlRepository;
    
    public long NewsItemPhotoUrlServiceImpl.countAllNewsItemPhotoUrls() {
        return newsItemPhotoUrlRepository.count();
    }
    
    public NewsItemPhotoUrl NewsItemPhotoUrlServiceImpl.findNewsItemPhotoUrl(Long id) {
        return newsItemPhotoUrlRepository.findOne(id);
    }
    
    public List<NewsItemPhotoUrl> NewsItemPhotoUrlServiceImpl.findAllNewsItemPhotoUrls() {
        return newsItemPhotoUrlRepository.findAll();
    }
    
    public List<NewsItemPhotoUrl> NewsItemPhotoUrlServiceImpl.findNewsItemPhotoUrlEntries(int firstResult, int maxResults) {
        return newsItemPhotoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void NewsItemPhotoUrlServiceImpl.saveNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl) {
        newsItemPhotoUrlRepository.save(newsItemPhotoUrl);
    }
    
    public NewsItemPhotoUrl NewsItemPhotoUrlServiceImpl.updateNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl) {
        return newsItemPhotoUrlRepository.save(newsItemPhotoUrl);
    }
    
}
