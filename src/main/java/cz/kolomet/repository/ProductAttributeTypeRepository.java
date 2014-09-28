package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.ProductAttributeType;

@RooJpaRepository(domainType = ProductAttributeType.class)
public interface ProductAttributeTypeRepository {
}
