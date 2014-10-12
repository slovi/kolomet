package cz.kolomet.service;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.PlaceType;

public interface PlaceTypeService {
	
    public Page<PlaceType> findPlaceTypeEntries(Pageable pageable);
	

	public abstract long countAllPlaceTypes();


	public abstract void deletePlaceType(PlaceType placeType);


	public abstract PlaceType findPlaceType(Long id);


	public abstract List<PlaceType> findAllPlaceTypes();


	public abstract List<PlaceType> findPlaceTypeEntries(int firstResult, int maxResults);


	public abstract void savePlaceType(PlaceType placeType);


	public abstract PlaceType updatePlaceType(PlaceType placeType);

}
