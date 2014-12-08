package cz.kolomet.dto;

import cz.kolomet.domain.GpsLocation;

public class PlaceDto {
	
	private Long id;
	private String name;
	private String placeType;
	private String placeTypeColor;
	private GpsLocation gpsLocation;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPlaceType() {
		return placeType;
	}

	public void setPlaceType(String placeType) {
		this.placeType = placeType;
	}

	public String getPlaceTypeColor() {
		return placeTypeColor;
	}

	public void setPlaceTypeColor(String placeTypeColor) {
		this.placeTypeColor = placeTypeColor;
	}

	public GpsLocation getGpsLocation() {
		return gpsLocation;
	}
	
	public void setGpsLocation(GpsLocation gpsLocation) {
		this.gpsLocation = gpsLocation;
	}
	
}
