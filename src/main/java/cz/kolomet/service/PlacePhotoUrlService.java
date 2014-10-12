package cz.kolomet.service;
import java.util.List;

import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.domain.PlacePhotoUrl;

public interface PlacePhotoUrlService extends PhotoContainerService {

	public abstract long countAllPlacePhotoUrls();


	public abstract void deletePlacePhotoUrl(PlacePhotoUrl placePhotoUrl);


	public abstract PlacePhotoUrl findPlacePhotoUrl(Long id);


	public abstract List<PlacePhotoUrl> findAllPlacePhotoUrls();


	public abstract List<PlacePhotoUrl> findPlacePhotoUrlEntries(int firstResult, int maxResults);


	public abstract void savePlacePhotoUrl(PlacePhotoUrl placePhotoUrl);


	public abstract PlacePhotoUrl updatePlacePhotoUrl(PlacePhotoUrl placePhotoUrl);

}
