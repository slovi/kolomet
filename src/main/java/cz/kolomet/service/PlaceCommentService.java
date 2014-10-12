package cz.kolomet.service;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.PlaceComment;

public interface PlaceCommentService {
	
	public Page<PlaceComment> findPlaceCommentEntries(Pageable pageable);
	
	public Page<PlaceComment> findPlaceCommentEntriesByPlace(Long placeId, Pageable pageable);
	

	public abstract long countAllPlaceComments();


	public abstract void deletePlaceComment(PlaceComment placeComment);


	public abstract PlaceComment findPlaceComment(Long id);


	public abstract List<PlaceComment> findAllPlaceComments();


	public abstract List<PlaceComment> findPlaceCommentEntries(int firstResult, int maxResults);


	public abstract void savePlaceComment(PlaceComment placeComment);


	public abstract PlaceComment updatePlaceComment(PlaceComment placeComment);

}
