package cz.kolomet.service.impl;
import java.awt.Dimension;
import java.io.File;

import org.springframework.beans.factory.annotation.Value;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.service.PlacePhotoUrlService;

public class PlacePhotoUrlServiceImpl extends AbstractPhotoUrlService implements PlacePhotoUrlService {
	
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
	
	public void deletePlacePhotoUrl(PlacePhotoUrl photoUrl) {
        placePhotoUrlRepository.delete(photoUrl);
        super.deletePhoto(photoUrl);
    }
	
	@Override
	protected ResizeInfo[] getResizeInfos() {
		ResizeInfo[] resizeInfos = new ResizeInfo[3];
		resizeInfos[0] = new ResizeInfo(new Dimension(width, height), PhotoUrl.ORIGINAL_IMG_SUFFIX); // save original image
		resizeInfos[1] = new ResizeInfo(new Dimension(overviewWidth, overviewHeight), PhotoUrl.OVERVIEW_IMG_SUFFIX); // save overview image
		resizeInfos[2] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX); // save thumb image
		return resizeInfos;
	}
	
    public void savePlacePhotoUrl(PlacePhotoUrl photoUrl, final File file) {
    	placePhotoUrlRepository.save(photoUrl);
    }

	@Override
	public void savePhoto(Photo photo, File dest) {
		savePlacePhotoUrl((PlacePhotoUrl) photo, dest);
	}
	
}
