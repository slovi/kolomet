package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.FigureHeight;

@RooJpaRepository(domainType = FigureHeight.class)
public interface FigureHeightRepository {
	
}
