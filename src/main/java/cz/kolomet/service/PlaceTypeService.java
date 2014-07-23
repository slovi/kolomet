package cz.kolomet.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.PlaceType;

@RooService(domainTypes = { cz.kolomet.domain.codelist.PlaceType.class })
public interface PlaceTypeService {
	
    public Page<PlaceType> findPlaceTypeEntries(Pageable pageable);
	
}
