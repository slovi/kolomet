package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.repository.NewsItemPhotoUrlRepository;
import cz.kolomet.service.NewsItemPhotoUrlService;

@Service
@Transactional
public class NewsItemPhotoUrlServiceImpl extends AbstractPhotoUrlService implements NewsItemPhotoUrlService {
	
	@Value("${newsitem.img.thumbnail.width}")
	private Integer thumbnailWidth;
	@Value("${newsitem.img.thumbnail.height}")
	private Integer thumbnailHeight;
	
    public void deleteNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl) {
        newsItemPhotoUrlRepository.delete(newsItemPhotoUrl);
        super.deletePhoto(newsItemPhotoUrl);
    }
    
    @Override
    public void deletePhoto(Photo photo) {
    	this.deleteNewsItemPhotoUrl((NewsItemPhotoUrl) photo);
    }
	
    @Override
    public ResizeInfo[] getResizeInfos() {
    	ResizeInfo[] resizeInfos = new ResizeInfo[2];
    	resizeInfos[0] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX, false);
    	resizeInfos[1] = new ResizeInfo(PhotoUrl.ORIGINAL_IMG_SUFFIX);
    	return resizeInfos;
    }

    @Override
	public void savePhoto(Photo photo) {
    	// TODO - optimize this cast
		newsItemPhotoUrlRepository.save((NewsItemPhotoUrl) photo);
	}
	

	@Autowired
    NewsItemPhotoUrlRepository newsItemPhotoUrlRepository;

	public long countAllNewsItemPhotoUrls() {
        return newsItemPhotoUrlRepository.count();
    }

	public NewsItemPhotoUrl findNewsItemPhotoUrl(Long id) {
        return newsItemPhotoUrlRepository.findOne(id);
    }

	public List<NewsItemPhotoUrl> findAllNewsItemPhotoUrls() {
        return newsItemPhotoUrlRepository.findAll();
    }

	public List<NewsItemPhotoUrl> findNewsItemPhotoUrlEntries(int firstResult, int maxResults) {
        return newsItemPhotoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl) {
        newsItemPhotoUrlRepository.save(newsItemPhotoUrl);
    }

	public NewsItemPhotoUrl updateNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl) {
        return newsItemPhotoUrlRepository.save(newsItemPhotoUrl);
    }
}
