package cz.kolomet.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.NewsItemDto;
import cz.kolomet.dto.PlaceFilterDto;

public interface NewsItemService {
	
	
	public Page<NewsItem> findNewsItemEntries(Pageable pageable);
	
	
	public List<NewsItem> findPlaceNewsBanners(Pageable pageable);
	
	
	public List<NewsItem> findPlaceNewsBanners(Region region, Pageable pageable);
	
	
	public List<NewsItem> findProductNewsBanners(Pageable pageable);
	
	
	public List<NewsItemDto> findPlaceNewsBannersDtos(Region region, PageRequest newsItemsPageRequest);
	
	
	public List<NewsItem> findAllWeekendTips();

	
	public List<NewsItemDto> findAllPartnerLinksDtos(Region region);
	
	
	public List<NewsItem> findAllPartnerLinks(PlaceFilterDto placeFilter);
	
	
	public List<NewsItem> findAllNewsItems(Pageable pageable);
	

	public long countAllNewsItems();


	public void deleteNewsItem(NewsItem newsItem);


	public NewsItem findNewsItem(Long id);


	public List<NewsItem> findAllNewsItems();


	public List<NewsItem> findNewsItemEntries(int firstResult, int maxResults);


	public void saveNewsItem(NewsItem newsItem);


	public NewsItem updateNewsItem(NewsItem newsItem);

	
}
