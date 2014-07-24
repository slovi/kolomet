package cz.kolomet.repository;

import cz.kolomet.domain.codelist.Region;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Region.class)
public interface RegionRepository {
	
	public Region findByGoogleAlias(String googleAlias);
	
}
