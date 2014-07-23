package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.Place;

@RooJpaRepository(domainType = Place.class)
public interface PlaceRepository {
	
	
	
}
