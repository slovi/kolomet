package cz.kolomet.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.PlaceType;

@RooJpaRepository(domainType = PlaceType.class)
public interface PlaceTypeRepository {
}
