package cz.kolomet.service;

import java.io.File;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.SellerPhotoUrl;

@RooService(domainTypes = { cz.kolomet.domain.SellerPhotoUrl.class })
public interface SellerPhotoUrlService {
	
	public void saveSellerPhotoUrl(SellerPhotoUrl photoUrl, File file, File targetRootDir);
	
}