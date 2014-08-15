package cz.kolomet.service.impl;
import java.awt.Dimension;
import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.service.PhotoUrlService;

public class PhotoUrlServiceImpl extends AbstractPhotoUrlService implements PhotoUrlService {
	
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
		
    public void deletePhotoUrl(PhotoUrl photoUrl) {
        photoUrlRepository.delete(photoUrl);
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
    
    public void savePhotoUrl(PhotoUrl photoUrl, final File file) {
    	photoUrlRepository.save(photoUrl);
    }
    
    @Override
    public List<PhotoUrl> findByProduct(Product product) {
    	return photoUrlRepository.findByProduct(product);
    }

	@Override
	public void savePhoto(Photo photo, File dest) {
		savePhotoUrl((PhotoUrl) photo, dest);
	}
   
}
