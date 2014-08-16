package cz.kolomet.service;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.PhotoContainerService;

@RooService(domainTypes = { cz.kolomet.domain.SellerPhotoUrl.class })
public interface SellerPhotoUrlService extends PhotoContainerService {
	
}
