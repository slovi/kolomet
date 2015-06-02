package cz.kolomet.dto;

import java.util.List;

public class PlaceMapDto {
	
	private List<PlaceDto> places;
	
	private String staticMapLink;

	public List<PlaceDto> getPlaces() {
		return places;
	}

	public void setPlaces(List<PlaceDto> places) {
		this.places = places;
	}

	public String getStaticMapLink() {
		return staticMapLink;
	}

	public void setStaticMapLink(String staticMapLink) {
		this.staticMapLink = staticMapLink;
	}

}
