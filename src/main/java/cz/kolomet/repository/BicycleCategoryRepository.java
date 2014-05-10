package cz.kolomet.repository;

import cz.kolomet.domain.codelist.BicycleCategory;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = BicycleCategory.class)
public interface BicycleCategoryRepository {
}
