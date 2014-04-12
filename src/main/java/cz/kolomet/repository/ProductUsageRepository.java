package cz.kolomet.repository;

import cz.kolomet.domain.codelist.ProductUsage;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ProductUsage.class)
public interface ProductUsageRepository {
}
