package cz.kolomet.repository;
import cz.kolomet.domain.PlacePhotoUrl;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = PlacePhotoUrl.class)
public interface PlacePhotoUrlRepository {
}
