package cz.kolomet.repository;

import cz.kolomet.domain.codelist.ProductAttributeType;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ProductAttributeType.class)
public interface ProductAttributeTypeRepository {
}
