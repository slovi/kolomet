package cz.kolomet.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.PlaceComment;

@RooService(domainTypes = { cz.kolomet.domain.PlaceComment.class })
public interface PlaceCommentService {
	
	public Page<PlaceComment> findPlaceCommentEntries(Pageable pageable);
	
	public Page<PlaceComment> findPlaceCommentEntriesByPlace(Long placeId, Pageable pageable);
	
}
