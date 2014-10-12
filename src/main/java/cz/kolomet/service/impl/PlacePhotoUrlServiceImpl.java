package cz.kolomet.service.impl;
import java.awt.Dimension;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.repository.PlacePhotoUrlRepository;
import cz.kolomet.service.PlacePhotoUrlService;

@Service
@Transactional
public class PlacePhotoUrlServiceImpl extends AbstractPhotoUrlService implements PlacePhotoUrlService {
	
	@Value("${place.img.width}")
	private Integer width;
	@Value("${place.img.height}")
	private Integer height;
	
	@Value("${place.img.detail.width}")
	private Integer detailWidth;
	@Value("${place.img.detail.height}")
	private Integer detailHeight;
	
	@Value("${place.img.overview.width}")
	private Integer overviewWidth;
	@Value("${place.img.overview.height}")
	private Integer overviewHeight;
	
	@Value("${place.img.thumbnail.width}")
	private Integer thumbnailWidth;
	@Value("${place.img.thumbnail.height}")
	private Integer thumbnailHeight;
	
	@Override
    public void deletePhoto(Photo photo) {
    	this.deletePlacePhotoUrl((PlacePhotoUrl) photo);
    }
	
	public void deletePlacePhotoUrl(PlacePhotoUrl photoUrl) {
        placePhotoUrlRepository.delete(photoUrl);
        super.deletePhoto(photoUrl);
    }
	
	@Override
	public ResizeInfo[] getResizeInfos() {
		ResizeInfo[] resizeInfos = new ResizeInfo[4];
		resizeInfos[0] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX, false); // save thumb image
		resizeInfos[1] = new ResizeInfo(new Dimension(overviewWidth, overviewHeight), PhotoUrl.OVERVIEW_IMG_SUFFIX); // save overview image
		resizeInfos[2] = new ResizeInfo(new Dimension(detailWidth, detailHeight), PhotoUrl.DETAIL_IMG_SUFFIX); // save detail image
		resizeInfos[3] = new ResizeInfo(new Dimension(width, height), PhotoUrl.ORIGINAL_IMG_SUFFIX); // save original image
		return resizeInfos;
	}
	
	@Override
	public void savePhoto(Photo photo) {
		// TODO - optimize this cast
		placePhotoUrlRepository.save((PlacePhotoUrl) photo);
	}
	

	@Autowired
    PlacePhotoUrlRepository placePhotoUrlRepository;

	public long countAllPlacePhotoUrls() {
        return placePhotoUrlRepository.count();
    }

	public PlacePhotoUrl findPlacePhotoUrl(Long id) {
        return placePhotoUrlRepository.findOne(id);
    }

	public List<PlacePhotoUrl> findAllPlacePhotoUrls() {
        return placePhotoUrlRepository.findAll();
    }

	public List<PlacePhotoUrl> findPlacePhotoUrlEntries(int firstResult, int maxResults) {
        return placePhotoUrlRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void savePlacePhotoUrl(PlacePhotoUrl placePhotoUrl) {
        placePhotoUrlRepository.save(placePhotoUrl);
    }

	public PlacePhotoUrl updatePlacePhotoUrl(PlacePhotoUrl placePhotoUrl) {
        return placePhotoUrlRepository.save(placePhotoUrl);
    }
}