package cz.kolomet.service;

import java.io.File;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoContainerService;

@RooService(domainTypes = { cz.kolomet.domain.NewsItemPhotoUrl.class })
public interface NewsItemPhotoUrlService extends PhotoContainerService {
	
	public void saveNewsItemPhotoUrl(NewsItemPhotoUrl photoUrl, File file);
	
}
