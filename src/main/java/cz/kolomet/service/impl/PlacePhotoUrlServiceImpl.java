package cz.kolomet.service.impl;
import java.awt.Dimension;
import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.task.TaskExecutor;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.service.ImageService;
import cz.kolomet.service.PlacePhotoUrlService;

public class PlacePhotoUrlServiceImpl implements PlacePhotoUrlService {
	
	@Autowired
	private ImageService imageService;
	
	@Value("${place.img.width}")
	private Integer width;
	@Value("${place.img.height}")
	private Integer height;
	
	@Value("${place.img.overview.width}")
	private Integer overviewWidth;
	@Value("${place.img.overview.height}")
	private Integer overviewHeight;
	
	@Value("${place.img.thumbnail.width}")
	private Integer thumbnailWidth;
	@Value("${place.img.thumbnail.height}")
	private Integer thumbnailHeight;
	
	@Value("${img.rootdir}")
	protected String rootDir;
		
	@Autowired
	private TaskExecutor executor;
	
	public void deletePlacePhotoUrl(PlacePhotoUrl photoUrl) {
        placePhotoUrlRepository.delete(photoUrl);
        
        FileUtils.deleteQuietly(new File(rootDir + "/" + photoUrl.getPhotoUrl()));
        FileUtils.deleteQuietly(new File(rootDir + "/" + photoUrl.getOverPhotoUrl()));
        FileUtils.deleteQuietly(new File(rootDir + "/" + photoUrl.getThumbPhotoUrl()));
    }
	
    public void savePlacePhotoUrl(PlacePhotoUrl photoUrl, final File file) {
        
    	placePhotoUrlRepository.save(photoUrl);
    	
    	executor.execute(new Runnable() {
			
			@Override
			public void run() {
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
		});
        
    }

	@Override
	public void savePhoto(Photo photo, File dest) {
		savePlacePhotoUrl((PlacePhotoUrl) photo, dest);
	}
	
}
