package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.RateType;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.RatedService;

public class PlaceServiceImpl implements PlaceService, RatedService {

	@Override
	public void addRate(Long id, Integer value) {
		Place place = placeRepository.findOne(id);
		place.increaseRate(value);
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
