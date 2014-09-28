package cz.kolomet.service.impl;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.service.NewsItemPhotoUrlService;

public class NewsItemPhotoUrlServiceImpl extends AbstractPhotoUrlService implements NewsItemPhotoUrlService {
	
    public void deleteNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl) {
        newsItemPhotoUrlRepository.delete(newsItemPhotoUrl);
        super.deletePhoto(newsItemPhotoUrl);
    }
    
    @Override
    public void deletePhoto(Photo photo) {
    	this.deleteNewsItemPhotoUrl((NewsItemPhotoUrl) photo);
    }
	
    @Override
    protected ResizeInfo[] getResizeInfos() {
    	ResizeInfo[] resizeInfos = new ResizeInfo[1];
    	resizeInfos[0] = new ResizeInfo(PhotoUrl.ORIGINAL_IMG_SUFFIX);
    	return resizeInfos;
    }

    @Override
	public void savePhoto(Photo photo) {
    	// TODO - optimize this cast
		newsItemPhotoUrlRepository.save((NewsItemPhotoUrl) photo);
	}
	
}
