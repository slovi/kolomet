package cz.kolomet.dto;

import java.util.List;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;

public class PlaceFilterDto {
	
	private Region region;
	
	private List<PlaceType> placeTypes;
	
	private boolean actual = true;
	
	private boolean usedFilter;

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public List<PlaceType> getPlaceTypes() {
		return placeTypes;
	}

	public void setPlaceTypes(List<PlaceType> placeTypes) {
		this.placeTypes = placeTypes;
	}

	public boolean isUsedFilter() {
		return usedFilter;
	}

	public void setUsedFilter(boolean usedFilter) {
		this.usedFilter = usedFilter;
	}

	public boolean isActual() {
		return actual;
	}

	public void setActual(boolean actual) {
		this.actual = actual;
	}

}
