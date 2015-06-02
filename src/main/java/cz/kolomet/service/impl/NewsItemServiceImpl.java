package cz.kolomet.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlaceComment;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.NewsItemDto;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.repository.NewsItemSpecifications;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.service.FacebookService;
import cz.kolomet.service.NewsItemService;

@Service
@Transactional
public class NewsItemServiceImpl implements NewsItemService {
	
	@Autowired
    private NewsItemRepository newsItemRepository;
	
	@Autowired
	private PlaceRepository placeRepository;
	
	private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private FacebookService facebookService;

	
	@Override
	public List<NewsItem> findPlaceNewsBanners(Pageable pageable) {
		return newsItemRepository.findAllWithoutCountQueryCacheable(NewsItemSpecifications.placesNewsBanners(), pageable);
	}
	
	@Override
	public List<NewsItem> findPlaceNewsBanners(Region region, Pageable pageable) {
		return newsItemRepository.findAllWithoutCountQueryCacheable(NewsItemSpecifications.placesNewsBanners(region), pageable);
	}
	
	@Override
	public List<NewsItemDto> findPlaceNewsBannersDtos(Region region, PageRequest newsItemsPageRequest) {
		List<NewsItem> newsItems = newsItemRepository.findAllWithoutCountQueryCacheable(NewsItemSpecifications.placesNewsBanners(region), newsItemsPageRequest);
		return mapDtos(newsItems);
	}
	
	@Override
	public List<NewsItem> findProductNewsBanners(Pageable pageable) {
		return newsItemRepository.findAllWithoutCountQueryCacheable(NewsItemSpecifications.productsNewsBanners(), pageable);
	}
	
	@Override
	public List<NewsItem> findAllNewsItems(Pageable pageable) {
		return newsItemRepository.findAllWithoutCountQueryCacheable(NewsItemSpecifications.allNewsItems(), pageable);
	}
	
	@Override
	public List<NewsItem> findAllWeekendTips() {
		return newsItemRepository.findAll(NewsItemSpecifications.allNewsWeekendTips());
	}

	@Override
	public List<NewsItemDto> findAllPartnerLinksDtos(Region region) {
		List<NewsItem> newsItems = newsItemRepository.findAll(NewsItemSpecifications.partnerLinks(region)); 
		List<NewsItemDto> newsItemDtos = mapDtos(newsItems);
		return newsItemDtos;
	}
	
	@Override
	public List<NewsItem> findAllPartnerLinks(Region region) {
		return newsItemRepository.findAll(NewsItemSpecifications.partnerLinks(region));
	}
	
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
        if (newsItem.getItemTipProductId() != null) {
        	Place place = placeRepository.findOne(newsItem.getItemTipProductId());
        	PlaceComment placeComment = new PlaceComment();
        	placeComment.setPlace(place);
        	placeComment.setText(newsItem.getText());
        	place.getComments().add(placeComment);
        }
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
	
	private List<NewsItemDto> mapDtos(List<NewsItem> newsItems) {
		List<NewsItemDto> newsItemDtos = new ArrayList<NewsItemDto>();
		for (NewsItem newsItem: newsItems) {
			NewsItemDto newsItemDto = new NewsItemDto();
			newsItemDto.setText(newsItem.getText());
			newsItemDtos.add(newsItemDto);
		}
		return newsItemDtos;
	}
}
