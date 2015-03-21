package cz.kolomet.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.facebook.api.FacebookLink;
import org.springframework.social.facebook.api.FeedOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.stereotype.Service;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.service.FacebookService;

@Service
public class FacebookServiceImpl implements FacebookService {

	@Value("${facebook.appOwner}")
	private String ownerId;
	
	@Value("${facebook.app}")
	private String facebookApp;
	
	@Value("${facebook.newsItem.link}")
	private String newsItemLink;
	
	@Value("${facebook.newsItem.name}")
	private String newsItemName;
	
	@Value("${facebook.newsItem.caption}")
	private String newsItemCaption;
	
	@Value("${facebook.newsItem.message}")
	private String newsItemMessage;
	
	@Override
	public void sendNewsItemToFacebook(NewsItem newsItem) {

		FacebookTemplate facebookTemplate = new FacebookTemplate(newsItem.getAccessToken(), facebookApp);
		FeedOperations operations = facebookTemplate.feedOperations();
		
		String newsItemUrl = newsItem.getContainedUrl();
		String resultUrl = StringUtils.isNotBlank(newsItemUrl) ? newsItemUrl : newsItemLink;
		String facebookHeaderText = StringUtils.isNotBlank(newsItem.getFacebookHeaderText()) ? newsItem.getFacebookHeaderText() : newsItemCaption;
		FacebookLink facebookLink = new FacebookLink(resultUrl, facebookHeaderText, facebookHeaderText, newsItem.getFacebookText());
		operations.postLink(ownerId, newsItemMessage, facebookLink);
	}

}