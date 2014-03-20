// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.service.NewsItemService;
import java.util.List;

privileged aspect NewsItemService_Roo_Service {
    
    public abstract long NewsItemService.countAllNewsItems();    
    public abstract void NewsItemService.deleteNewsItem(NewsItem newsItem);    
    public abstract NewsItem NewsItemService.findNewsItem(Long id);    
    public abstract List<NewsItem> NewsItemService.findAllNewsItems();    
    public abstract List<NewsItem> NewsItemService.findNewsItemEntries(int firstResult, int maxResults);    
    public abstract void NewsItemService.saveNewsItem(NewsItem newsItem);    
    public abstract NewsItem NewsItemService.updateNewsItem(NewsItem newsItem);    
}