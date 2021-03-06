package cz.kolomet.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;






import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Place;
import cz.kolomet.dto.PlaceDto;
import cz.kolomet.dto.PlaceFilterDto;
import cz.kolomet.dto.PlaceMapDto;

public interface PlaceService {
	
	
	public PlaceMapDto findPlaceMapDto(PlaceFilterDto placeFilterDto, Long user);
	
	
	public List<PlaceDto> findPlaceDtos(PlaceFilterDto placeFilterDto, Long user);
	
	
	public Page<Place> findPlaceEntries(Specification<Place> specification, Pageable pageable);
	
	
	public List<Place> findPlaceEntries(Specification<Place> specification);    
	
	
	public List<Place> findTopPlaces(Specification<Place> specification, int nubmerOfPlaces);
	

	public long countAllPlaces();


	public void deletePlace(Place place);


	public Place findPlace(Long id);


	public List<Place> findAllPlaces();


	public List<Place> findPlaceEntries(int firstResult, int maxResults);


	public void savePlace(Place place);


	public Place updatePlace(Place place);
	
	
	public void assignVisitedUser(Long placeId, Boolean beenThere, ApplicationUser user);	
	
	
	public void assignVisitedUser(Place place, Boolean beenThere, ApplicationUser user);	
	
	
	public String generateStaticMapLink(PlaceFilterDto placeFilterDto, Long user);


}