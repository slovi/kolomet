package cz.kolomet.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.facebook.api.FeedOperations;
import org.springframework.social.facebook.api.PostData;
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
		
		String resultUrl = newsItem.getContainedUrl();
		if (StringUtils.isBlank(resultUrl)) {
			resultUrl = newsItem.getItemTipLink();
			if (StringUtils.isBlank(resultUrl)) {
				resultUrl = newsItemLink;
			}
		}
		String facebookHeaderText = StringUtils.isNotBlank(newsItem.getFacebookHeaderText()) ? newsItem.getFacebookHeaderText() : newsItemCaption;
		
		PostData postData = new PostData(ownerId);
		postData.link(resultUrl).name(facebookHeaderText).description(newsItem.getFacebookText()).picture(newsItem.getContainedImageUrl());
		operations.post(postData);
	}

}