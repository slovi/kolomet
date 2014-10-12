package cz.kolomet.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Place;

public interface PlaceService {
	
	public Page<Place> findPlaceEntries(Specification<Place> specification, Pageable pageable);
	
	public List<Place> findPlaceEntries(Specification<Place> specification);    
	
	public List<Place> getTopPlaces(Specification<Place> specification, int nubmerOfPlaces);
	

	public abstract long countAllPlaces();


	public abstract void deletePlace(Place place);


	public abstract Place findPlace(Long id);


	public abstract List<Place> findAllPlaces();


	public abstract List<Place> findPlaceEntries(int firstResult, int maxResults);


	public abstract void savePlace(Place place);


	public abstract Place updatePlace(Place place);

}