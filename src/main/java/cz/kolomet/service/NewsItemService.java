package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.NewsItem;

public interface NewsItemService {
	
	public Page<NewsItem> findNewsItemEntries(Pageable pageable);
	

	public abstract long countAllNewsItems();


	public abstract void deleteNewsItem(NewsItem newsItem);


	public abstract NewsItem findNewsItem(Long id);


	public abstract List<NewsItem> findAllNewsItems();


	public abstract List<NewsItem> findNewsItemEntries(int firstResult, int maxResults);


	public abstract void saveNewsItem(NewsItem newsItem);


	public abstract NewsItem updateNewsItem(NewsItem newsItem);

}
