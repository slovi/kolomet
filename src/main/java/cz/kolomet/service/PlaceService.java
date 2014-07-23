package cz.kolomet.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.Place;

@RooService(domainTypes = { cz.kolomet.domain.Place.class })
public interface PlaceService {
	
	public List<Place> findPlaceEntries(Specification<Place> specification);    
	
	public List<Place> getTopPlaces(Specification<Place> specification, int nubmerOfPlaces);
	
}