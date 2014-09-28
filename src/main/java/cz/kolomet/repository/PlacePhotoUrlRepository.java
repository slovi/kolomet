package cz.kolomet.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.PlacePhotoUrl;

@RooJpaRepository(domainType = PlacePhotoUrl.class)
public interface PlacePhotoUrlRepository {
}
