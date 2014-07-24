package cz.kolomet.service;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.Region;

@RooService(domainTypes = { cz.kolomet.domain.codelist.Region.class })
public interface RegionService {
	
	public Region findByGoogleAlias(String googleAlias);
	
}
