package cz.kolomet.repository;

import cz.kolomet.domain.codelist.ProductColor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ProductColor.class)
public interface ProductColorRepository {
}
