package cz.kolomet.repository;
import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.util.repository.CustomRepository;

@Repository
public interface PlaceTypeRepository extends CustomRepository<PlaceType, Long> {
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<PlaceType> findAll(Sort sort);
	
}
