package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.Region;

@RooService(domainTypes = { cz.kolomet.domain.codelist.Region.class })
public interface RegionService {
	
	public Page<Region> findRegionEntries(Pageable pageable);  
	
	public Region findByGoogleAlias(String googleAlias);
	
}
