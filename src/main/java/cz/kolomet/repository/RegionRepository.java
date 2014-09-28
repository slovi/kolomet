package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.Region;

@RooJpaRepository(domainType = Region.class)
public interface RegionRepository {
	
	public Region findByGoogleAlias(String googleAlias);
	
}
