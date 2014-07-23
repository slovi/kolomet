package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.service.PlaceTypeService;

public class PlaceTypeServiceImpl implements PlaceTypeService {
	
	@Override
	public List<PlaceType> findAllPlaceTypes() {
		return placeTypeRepository.findAll(Codelist.defaultSort());
	}  
	
	@Override
	public Page<PlaceType> findPlaceTypeEntries(Pageable pageable) {
        return placeTypeRepository.findAll(pageable);
    }
	
}
