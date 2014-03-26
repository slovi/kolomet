package cz.kolomet.service;
import java.io.File;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.PhotoUrl;

@RooService(domainTypes = { cz.kolomet.domain.PhotoUrl.class })
public interface PhotoUrlService {
	
	public void savePhotoUrl(PhotoUrl photoUrl, File file, File targetRootDir);
	
}
