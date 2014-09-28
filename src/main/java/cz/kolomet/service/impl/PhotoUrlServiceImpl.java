package cz.kolomet.service.impl;
import java.awt.Dimension;
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
	
	@Value("${product.img.detail.width}")
	private Integer detailWidth;
	@Value("${product.img.detail.height}")
	private Integer detailHeight;
	
	@Value("${product.img.overview.width}")
	private Integer overviewWidth;
	@Value("${product.img.overview.height}")
	private Integer overviewHeight;
	
	@Value("${product.img.thumbnail.width}")
	private Integer thumbnailWidth;
	@Value("${product.img.thumbnail.height}")
	private Integer thumbnailHeight;
		
	@Override
    public void deletePhoto(Photo photo) {
    	this.deletePhotoUrl((PhotoUrl) photo);
    }
	
    public void deletePhotoUrl(PhotoUrl photoUrl) {
    	photoUrl.getProduct().getPhotoUrls().remove(photoUrl);
        super.deletePhoto(photoUrl);
        photoUrl.setProduct(null);
        photoUrlRepository.delete(photoUrl);
    }
    
    @Override
    protected ResizeInfo[] getResizeInfos() {
    	ResizeInfo[] resizeInfos = new ResizeInfo[4];
    	resizeInfos[0] = new ResizeInfo(new Dimension(width, height), PhotoUrl.ORIGINAL_IMG_SUFFIX); // save original image
    	resizeInfos[1] = new ResizeInfo(new Dimension(detailWidth, detailHeight), PhotoUrl.DETAIL_IMG_SUFFIX); // save detail image
		resizeInfos[2] = new ResizeInfo(new Dimension(overviewWidth, overviewHeight), PhotoUrl.OVERVIEW_IMG_SUFFIX); // save overview image
		resizeInfos[3] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX, false); // save thumb image
    	return resizeInfos;
    }
    
    @Override
    public List<PhotoUrl> findByProduct(Product product) {
    	return photoUrlRepository.findByProduct(product);
    }

	@Override
	public void savePhoto(Photo photo) {
		// TODO - optimize this cast
		photoUrlRepository.save((PhotoUrl) photo);
	}
   
}
