package cz.kolomet.dto;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;

public class PlaceFilterDto {
	
	private Region region;
	
	private PlaceType placeType;

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public PlaceType getPlaceType() {
		return placeType;
	}

	public void setPlaceType(PlaceType placeType) {
		this.placeType = placeType;
	}

}
