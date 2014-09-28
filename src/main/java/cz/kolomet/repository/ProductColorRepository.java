package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.ProductColor;

@RooJpaRepository(domainType = ProductColor.class)
public interface ProductColorRepository {
}
