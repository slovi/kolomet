package cz.kolomet.repository;
import cz.kolomet.domain.codelist.PlaceType;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = PlaceType.class)
public interface PlaceTypeRepository {
}
