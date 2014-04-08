package cz.kolomet.service.impl;
import java.awt.Dimension;
import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.service.ImageService;
import cz.kolomet.service.PhotoUrlService;

public class PhotoUrlServiceImpl implements PhotoUrlService {
	
	@Autowired
	private ImageService imageService;
	
	@Value("${product.img.width}")
	private Integer width;
	@Value("${product.img.height}")
	private Integer height;
	
	@Value("${product.img.overview.width}")
	private Integer overviewWidth;
	@Value("${product.img.overview.height}")
	private Integer overviewHeight;
	
	@Value("${product.img.thumbnail.width}")
	private Integer thumbnailWidth;
	@Value("${product.img.thumbnail.height}")
	private Integer thumbnailHeight;
	
    public void savePhotoUrl(PhotoUrl photoUrl, File file) {
        
    	photoUrlRepository.save(photoUrl);
        
    	// save original image
        String targetFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.ORIGINAL_IMG_SUFFIX;
        imageService.resizeAndSave(file, new File(file.getParent(), targetFileName), new Dimension(width, height));
        
        String targetOverviewFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.OVERVIEW_IMG_SUFFIX;
        imageService.resizeAndSave(file, new File(file.getParent(), targetOverviewFileName), new Dimension(overviewWidth, overviewHeight));
        
        // save thumb image
        String targetThumbFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.THUMBNAIL_IMG_SUFFIX;
        imageService.resizeAndSave(file, new File(file.getParent(), targetThumbFileName), new Dimension(thumbnailWidth, thumbnailHeight));
        FileUtils.deleteQuietly(file);
    }
   
}
