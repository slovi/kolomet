package cz.kolomet.service.impl;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.service.ImageService;
import cz.kolomet.service.NewsItemPhotoUrlService;

public class NewsItemPhotoUrlServiceImpl implements NewsItemPhotoUrlService {
	
	@Autowired
	private ImageService imageService;
	
	public void saveNewsItemPhotoUrl(NewsItemPhotoUrl photoUrl, File file) {
		
		newsItemPhotoUrlRepository.save(photoUrl);
		
		// save original image
        String targetFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.ORIGINAL_IMG_SUFFIX;
        imageService.save(file, new File(file.getParent(), targetFileName));

        FileUtils.deleteQuietly(file);
	}
	
}
