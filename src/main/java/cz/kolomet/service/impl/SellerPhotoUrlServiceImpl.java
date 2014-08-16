package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.io.File;

import org.springframework.beans.factory.annotation.Value;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.service.SellerPhotoUrlService;

public class SellerPhotoUrlServiceImpl extends AbstractPhotoUrlService implements SellerPhotoUrlService {
	
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
	
	
	@Override
	protected ResizeInfo[] getResizeInfos() {
		ResizeInfo[] resizeInfos = new ResizeInfo[3];
		resizeInfos[0] = new ResizeInfo(new Dimension(width, height), PhotoUrl.ORIGINAL_IMG_SUFFIX); // save original image
		resizeInfos[1] = new ResizeInfo(new Dimension(overviewWidth, overviewHeight), PhotoUrl.OVERVIEW_IMG_SUFFIX); // save overview image
		resizeInfos[2] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX); // save thumb image
		return resizeInfos;
	}

	@Override
	public void savePhoto(Photo photo) {
		// TODO - optimize this cast
		sellerPhotoUrlRepository.save((SellerPhotoUrl) photo);
	}
	
}
