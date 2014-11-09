package cz.kolomet.service.impl;
import java.awt.Dimension;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.repository.PhotoUrlRepository;
import cz.kolomet.service.PhotoUrlService;

@Service
@Transactional
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
    public ResizeInfo[] getThumbnailResizeInfos() {
    	ResizeInfo[] resizeInfos = new ResizeInfo[1];
    	resizeInfos[0] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX, false); // save thumb image
    	return resizeInfos;
    }
    
    @Override
    public ResizeInfo[] getResizeInfos() {
    	ResizeInfo[] resizeInfos = new ResizeInfo[3];
    	resizeInfos[0] = new ResizeInfo(new Dimension(overviewWidth, overviewHeight), PhotoUrl.OVERVIEW_IMG_SUFFIX); // save overview image
    	resizeInfos[1] = new ResizeInfo(new Dimension(detailWidth, detailHeight), PhotoUrl.DETAIL_IMG_SUFFIX); // save detail image
    	resizeInfos[2] = new ResizeInfo(new Dimension(width, height), PhotoUrl.ORIGINAL_IMG_SUFFIX); // save original image
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
   

	@Autowired
    PhotoUrlRepository photoUrlRepository;

	public long countAllPhotoUrls() {
        return photoUrlRepository.count();
    }

	public PhotoUrl findPhotoUrl(Long id) {
        return photoUrlRepository.findOne(id);
    }

	public List<PhotoUrl> findAllPhotoUrls() {
        return photoUrlRepository.findAll();
    }

	public List<PhotoUrl> findPhotoUrlEntries(int firstResult, int maxResults) {
        return photoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void savePhotoUrl(PhotoUrl photoUrl) {
        photoUrlRepository.save(photoUrl);
    }

	public PhotoUrl updatePhotoUrl(PhotoUrl photoUrl) {
        return photoUrlRepository.save(photoUrl);
    }
}
