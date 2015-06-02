package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import cz.kolomet.domain.PagePhotoUrl;
import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.repository.PagePhotoUrlRepository;
import cz.kolomet.service.PagePhotoUrlService;

@Service
public class PagePhotoUrlServiceImpl extends AbstractPhotoUrlService implements PagePhotoUrlService {

	@Value("${newsitem.img.thumbnail.width}")
	private Integer thumbnailWidth;
	@Value("${newsitem.img.thumbnail.height}")
	private Integer thumbnailHeight;
	
	@Autowired
	private PagePhotoUrlRepository pagePhotoUrlRepository;
	
	@Override
    public void deletePagePhotoUrl(PagePhotoUrl pagePhotoUrl) {
        pagePhotoUrlRepository.delete(pagePhotoUrl);
        super.deletePhoto(pagePhotoUrl);
    }
    
    @Override
    public void deletePhoto(Photo photo) {
    	this.deletePagePhotoUrl((PagePhotoUrl) photo);
    }
	
    @Override
    public ResizeInfo[] getThumbnailResizeInfos() {
    	ResizeInfo[] resizeInfos = new ResizeInfo[1];
    	resizeInfos[0] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX, false);
    	return resizeInfos;
    }
    
    @Override
    public ResizeInfo[] getResizeInfos() {
    	ResizeInfo[] resizeInfos = new ResizeInfo[1];
    	resizeInfos[0] = new ResizeInfo(PhotoUrl.ORIGINAL_IMG_SUFFIX);
    	return resizeInfos;
    }

    @Override
	public void savePhoto(Photo photo) {
    	// TODO - optimize this cast
		pagePhotoUrlRepository.save((PagePhotoUrl) photo);
	}

    @Override
	public long countAllPagePhotoUrls() {
        return pagePhotoUrlRepository.count();
    }

    @Override
	public PagePhotoUrl findPagePhotoUrl(Long id) {
        return pagePhotoUrlRepository.findOne(id);
    }

    @Override
	public List<PagePhotoUrl> findAllPagePhotoUrls() {
        return pagePhotoUrlRepository.findAll();
    }

    @Override
	public List<PagePhotoUrl> findPagePhotoUrlEntries(int firstResult, int maxResults) {
        return pagePhotoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

    @Override
	public void savePagePhotoUrl(PagePhotoUrl pagePhotoUrl) {
        pagePhotoUrlRepository.save(pagePhotoUrl);
    }

    @Override
	public PagePhotoUrl updatePagePhotoUrl(PagePhotoUrl pagePhotoUrl) {
        return pagePhotoUrlRepository.save(pagePhotoUrl);
    }

}
