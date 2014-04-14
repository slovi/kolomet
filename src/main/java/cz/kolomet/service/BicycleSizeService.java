package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.BicycleSize;

@RooService(domainTypes = { cz.kolomet.domain.codelist.BicycleSize.class })
public interface BicycleSizeService {
	
	public Page<BicycleSize> findBicycleSizeEntries(Pageable pageable);
	
}
