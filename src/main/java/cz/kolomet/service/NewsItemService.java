package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.NewsItem;

@RooService(domainTypes = { cz.kolomet.domain.NewsItem.class })
public interface NewsItemService {
	
	public Page<NewsItem> findNewsItemEntries(Pageable pageable);
	
}
