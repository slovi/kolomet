package cz.kolomet.service;

import cz.kolomet.domain.NewsItem;

public interface FacebookService {
	
	public void sendNewsItemToFacebook(NewsItem newsItem);

}
