package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.ProductUsage;

@RooJpaRepository(domainType = ProductUsage.class)
public interface ProductUsageRepository {
}
