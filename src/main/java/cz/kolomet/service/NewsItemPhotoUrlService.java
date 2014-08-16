package cz.kolomet.service;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.PhotoContainerService;

@RooService(domainTypes = { cz.kolomet.domain.NewsItemPhotoUrl.class })
public interface NewsItemPhotoUrlService extends PhotoContainerService {
	
}
