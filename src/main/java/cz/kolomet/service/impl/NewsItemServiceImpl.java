package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.service.NewsItemService;

public class NewsItemServiceImpl implements NewsItemService {
	
	public Page<NewsItem> findNewsItemEntries(Pageable pageable) {
		return newsItemRepository.findAll(pageable);
	}
	
}
