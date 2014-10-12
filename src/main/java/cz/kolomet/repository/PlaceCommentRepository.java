package cz.kolomet.repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlaceComment;

@Repository
public interface PlaceCommentRepository extends JpaRepository<PlaceComment, Long>, JpaSpecificationExecutor<PlaceComment> {
	
	public Page<PlaceComment> findByPlace(Place place, Pageable pageable);
	
}
