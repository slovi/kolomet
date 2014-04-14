package cz.kolomet.repository;

import cz.kolomet.domain.codelist.BicycleSize;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = BicycleSize.class)
public interface BicycleSizeRepository {
}
