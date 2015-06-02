package cz.kolomet.dto;

import cz.kolomet.domain.GpsLocation;

public class PlaceDto {
	
	private Long id;
	
	private String name;
	
	private String placeType;
	
	private String placeTypeColor;
	
	private GpsLocation gpsLocation;
	
	private boolean beenThere;

	private String url;
	
	private String iconUrl;
	
	private String largeIconUrl;
	
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

	public boolean isBeenThere() {
		return beenThere;
	}

	public void setBeenThere(boolean beenThere) {
		this.beenThere = beenThere;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

	public String getLargeIconUrl() {
		return largeIconUrl;
	}

	public void setLargeIconUrl(String largeIconUrl) {
		this.largeIconUrl = largeIconUrl;
	}
	
}
