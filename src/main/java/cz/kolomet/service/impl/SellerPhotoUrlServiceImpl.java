package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.Async;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.service.ImageService;
import cz.kolomet.service.SellerPhotoUrlService;

public class SellerPhotoUrlServiceImpl implements SellerPhotoUrlService {
	
	@Value("${seller.img.width}")
	private Integer width;
	@Value("${seller.img.height}")
	private Integer height;
	
	@Value("${seller.img.overview.width}")
	private Integer overviewWidth;
	@Value("${seller.img.overview.height}")
	private Integer overviewHeight;
	
	@Value("${seller.img.thumbnail.width}")
	private Integer thumbnailWidth;
	@Value("${seller.img.thumbnail.height}")
	private Integer thumbnailHeight;
	
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private TaskExecutor executor;
	
	@Async
	public void saveSellerPhotoUrl(SellerPhotoUrl photoUrl, final File file) {
		
		sellerPhotoUrlRepository.save(photoUrl);
		
		executor.execute(new Runnable() {
			
			@Override
			public void run() {
				
				// save original image
				String targetFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.ORIGINAL_IMG_SUFFIX;
				imageService.resizeAndSave(file, new File(file.getParent(), targetFileName), new Dimension(width, height));
				
				String targetOverviewFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.OVERVIEW_IMG_SUFFIX;
				imageService.resizeAndSave(file, new File(file.getParent(), targetOverviewFileName), new Dimension(overviewWidth, overviewHeight));
				
				// img thumbnail
				String targetThumbFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.THUMBNAIL_IMG_SUFFIX;
				imageService.resizeAndSave(file, new File(file.getParent(), targetThumbFileName), new Dimension(thumbnailWidth, thumbnailHeight));
				
				FileUtils.deleteQuietly(file);
			}
		});
	}

	@Override
	public void savePhoto(Photo photo, File dest) {
		saveSellerPhotoUrl((SellerPhotoUrl) photo, dest);
	}
	
}
