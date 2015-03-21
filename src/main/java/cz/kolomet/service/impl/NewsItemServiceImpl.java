package cz.kolomet.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.service.FacebookService;
import cz.kolomet.service.NewsItemService;

@Service
@Transactional
public class NewsItemServiceImpl implements NewsItemService {
	
	@Autowired
    private NewsItemRepository newsItemRepository;
	
	private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private FacebookService facebookService;

	public Page<NewsItem> findNewsItemEntries(Pageable pageable) {
		return newsItemRepository.findAll(pageable);
	}
	
	public long countAllNewsItems() {
        return newsItemRepository.count();
    }

	public void deleteNewsItem(NewsItem newsItem) {
        newsItemRepository.delete(newsItem);
    }

	public NewsItem findNewsItem(Long id) {
        return newsItemRepository.findOne(id);
    }

	public List<NewsItem> findAllNewsItems() {
        return newsItemRepository.findAll();
    }

	public List<NewsItem> findNewsItemEntries(int firstResult, int maxResults) {
        return newsItemRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveNewsItem(NewsItem newsItem) {
        newsItemRepository.save(newsItem);
        if (newsItem.getSendToFacebook()) {
        	try {
        		facebookService.sendNewsItemToFacebook(newsItem);
        	} catch (Exception e) {
        		logger.warn("Cannot send news item to facebook", e);
        	}
        }
    }

	public NewsItem updateNewsItem(NewsItem newsItem) {
        return newsItemRepository.save(newsItem);
    }
}
