package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.repository.PlaceTypeRepository;
import cz.kolomet.service.PlaceTypeService;

@Service
@Transactional
public class PlaceTypeServiceImpl implements PlaceTypeService {
	
	@Autowired
	PlaceTypeRepository placeTypeRepository;
	
	@Override
	public List<PlaceType> findAllPlaceTypes() {
		return placeTypeRepository.findAll(Codelist.defaultSort());
	}  
	
	@Override
	public Page<PlaceType> findPlaceTypeEntries(Pageable pageable) {
        return placeTypeRepository.findAll(pageable);
    }

	public long countAllPlaceTypes() {
        return placeTypeRepository.count();
    }

	public void deletePlaceType(PlaceType placeType) {
        placeTypeRepository.delete(placeType);
    }

	public PlaceType findPlaceType(Long id) {
        return placeTypeRepository.findOne(id);
    }

	public List<PlaceType> findPlaceTypeEntries(int firstResult, int maxResults) {
        return placeTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void savePlaceType(PlaceType placeType) {
        placeTypeRepository.save(placeType);
    }

	public PlaceType updatePlaceType(PlaceType placeType) {
        return placeTypeRepository.save(placeType);
    }
}
