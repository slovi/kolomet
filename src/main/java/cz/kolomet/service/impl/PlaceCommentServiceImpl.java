package cz.kolomet.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlaceComment;
import cz.kolomet.repository.PlaceCommentRepository;
import cz.kolomet.service.PlaceCommentService;

@Service
@Transactional
public class PlaceCommentServiceImpl implements PlaceCommentService {
	
	@Autowired
	PlaceCommentRepository placeCommentRepository;
	
	public long countAllPlaceComments() {
        return placeCommentRepository.count();
    }

	@PreAuthorize("principal.isCapableToDeletePlaceComment(#placeComment)")
	public void deletePlaceComment(PlaceComment placeComment) {
        placeCommentRepository.delete(placeComment);
    }

	@PostAuthorize("isAnonymous() or principal.isCapableToDisplayPlaceComment(returnObject)")
	public PlaceComment findPlaceComment(Long id) {
        return placeCommentRepository.findOne(id);
    }

	public List<PlaceComment> findAllPlaceComments() {
        return placeCommentRepository.findAll();
    }

	public List<PlaceComment> findPlaceCommentEntries(int firstResult, int maxResults) {
        return placeCommentRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	@PreAuthorize("isAuthenticated() and principal.isCapableToSavePlaceComment(#placeComment)")
	public void savePlaceComment(PlaceComment placeComment) {
        placeCommentRepository.save(placeComment);
    }

	@PreAuthorize("principal.isCapableToUpdatePlaceComment(#placeComment)")
	public PlaceComment updatePlaceComment(PlaceComment placeComment) {
        return placeCommentRepository.save(placeComment);
    }
	
	public Page<PlaceComment> findPlaceCommentEntries(Pageable pageable) {
		return placeCommentRepository.findAll(pageable);
	}
	
	public Page<PlaceComment> findPlaceCommentEntriesByPlace(Long placeId, Pageable pageable) {
		Place place = new Place();
		place.setId(placeId);
		return placeCommentRepository.findByPlace(place, pageable);
	}

}