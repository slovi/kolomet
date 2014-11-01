package cz.kolomet.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.RateType;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.RatedService;
import cz.kolomet.service.exception.ExistingPlaceException;

@Service
@Transactional
public class PlaceServiceImpl implements PlaceService, RatedService {

	private static final Double LOCATION_RADIUS = 0.0006d;
	
	@Autowired
    private PlaceRepository placeRepository;

	public long countAllPlaces() {
        return placeRepository.count();
    }

	@PreAuthorize("principal.isCapableToDeletePlace(#place)")
	public void deletePlace(Place place) {
        placeRepository.delete(place);
    }

	@PostAuthorize("isAnonymous() or principal.isCapableToDisplayPlace(returnObject)")
	public Place findPlace(Long id) {
        return placeRepository.findOne(id);
    }

	public List<Place> findAllPlaces() {
        return placeRepository.findAll();
    }

	public List<Place> findPlaceEntries(int firstResult, int maxResults) {
        return placeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	@PreAuthorize("principal.isCapableToSavePlace(#place)")
	public void savePlace(Place place) {
		
		Double northFrom = place.getGpsLocation().getNorth() - LOCATION_RADIUS;
		Double northTo = place.getGpsLocation().getNorth() + LOCATION_RADIUS;
		Double westFrom = place.getGpsLocation().getWest() - LOCATION_RADIUS;
		Double westTo = place.getGpsLocation().getWest() + LOCATION_RADIUS;
		
		List<Place> placesInSameRadius = placeRepository.findByRadius(northFrom, northTo, westFrom, westTo);
		if (!placesInSameRadius.isEmpty()) {
			throw new ExistingPlaceException(placesInSameRadius.get(0));
		}
        placeRepository.save(place);
    }

	@PreAuthorize("principal.isCapableToUpdatePlace(#place)")
	public Place updatePlace(Place place) {
		
		Double northFrom = place.getGpsLocation().getNorth() - LOCATION_RADIUS;
		Double northTo = place.getGpsLocation().getNorth() + LOCATION_RADIUS;
		Double westFrom = place.getGpsLocation().getWest() - LOCATION_RADIUS;
		Double westTo = place.getGpsLocation().getWest() + LOCATION_RADIUS;
		
		List<Place> placesInSameRadius = placeRepository.findByRadius(northFrom, northTo, westFrom, westTo, Arrays.asList(new Place[]{place}));
		if (!placesInSameRadius.isEmpty()) {
			throw new ExistingPlaceException(placesInSameRadius.get(0));
		}
        return placeRepository.save(place);
    }

	@Override
	public void addRate(Long id, Integer value) {
		Place place = placeRepository.findOne(id);
		place.increaseRate(value);
		placeRepository.save(place);
	}
	
	@Override
	public boolean supports(RateType rateType) {
		return rateType == RateType.PLACE;
	}
	
	public Page<Place> findPlaceEntries(Specification<Place> specification, Pageable pageable) {
		return placeRepository.findAll(specification, pageable);
	}
	
	public List<Place> findPlaceEntries(Specification<Place> specification) {
		return placeRepository.findAll(specification);
	}
	
	public List<Place> getTopPlaces(Specification<Place> specification, int nubmerOfPlaces) {
		Pageable pagable = new PageRequest(0, nubmerOfPlaces, PlaceSpecifications.getTopSort());
		return placeRepository.findAll(specification, pagable).getContent();
	}
	
}
