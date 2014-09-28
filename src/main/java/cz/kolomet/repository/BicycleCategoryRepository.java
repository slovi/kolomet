package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.BicycleCategory;

@RooJpaRepository(domainType = BicycleCategory.class)
public interface BicycleCategoryRepository {
}
