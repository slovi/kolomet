package cz.kolomet.repository;

import cz.kolomet.domain.Place;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Place.class)
public interface PlaceRepository {
}
