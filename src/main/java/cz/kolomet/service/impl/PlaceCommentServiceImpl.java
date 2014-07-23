package cz.kolomet.service.impl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlaceComment;
import cz.kolomet.service.PlaceCommentService;

public class PlaceCommentServiceImpl implements PlaceCommentService {
	
	public Page<PlaceComment> findPlaceCommentEntries(Pageable pageable) {
		return placeCommentRepository.findAll(pageable);
	}
	
	public Page<PlaceComment> findPlaceCommentEntriesByPlace(Long placeId, Pageable pageable) {
		Place place = new Place();
		place.setId(placeId);
		return placeCommentRepository.findByPlace(place, pageable);
	}
	
}
