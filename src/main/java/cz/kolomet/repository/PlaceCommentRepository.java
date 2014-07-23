package cz.kolomet.repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlaceComment;

@RooJpaRepository(domainType = PlaceComment.class)
public interface PlaceCommentRepository {
	
	public Page<PlaceComment> findByPlace(Place place, Pageable pageable);
	
}
