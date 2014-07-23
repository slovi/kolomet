package cz.kolomet.service;

import java.io.File;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.domain.SellerPhotoUrl;

@RooService(domainTypes = { cz.kolomet.domain.SellerPhotoUrl.class })
public interface SellerPhotoUrlService extends PhotoContainerService {
	
	public void saveSellerPhotoUrl(SellerPhotoUrl photoUrl, File file);
	
}
