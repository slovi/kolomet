package cz.kolomet.domain;

public enum PlaceTypeColor {
		
	BLUE, GREEN, RED, YELLOW, ORANGE;
	
	private String markerImgUrl;

	private PlaceTypeColor() {
		this.markerImgUrl = "/resources/img/places/" + this.name().toLowerCase() + ".png"; 
	}
	
	public String getMarkerImgUrl() {
		return markerImgUrl;
	}
	
}