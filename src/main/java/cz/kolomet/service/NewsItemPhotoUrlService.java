package cz.kolomet.service;

import java.io.File;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.NewsItemPhotoUrl;

@RooService(domainTypes = { cz.kolomet.domain.NewsItemPhotoUrl.class })
public interface NewsItemPhotoUrlService {
	
	public void saveNewsItemPhotoUrl(NewsItemPhotoUrl photoUrl, File file);
	
}
