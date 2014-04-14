package cz.kolomet.repository;

import cz.kolomet.domain.codelist.FigureHeight;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FigureHeight.class)
public interface FigureHeightRepository {
}
