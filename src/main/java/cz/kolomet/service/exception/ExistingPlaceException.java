package cz.kolomet.service.exception;

import cz.kolomet.domain.Place;

public class ExistingPlaceException extends ServiceExpcetion {

	private final Place place;
	
	public ExistingPlaceException(Place place, Exception cause) {
		super("Places is this location already exists.", cause, "exception_bad_place_location", 
				new Object[] {place.getName(), place.getGpsLocation().getNorth(), place.getGpsLocation().getWest()});
		this.place = place;
	}

	public ExistingPlaceException(Place place) {
		super("Places is this location already exists.", "exception_bad_place_location", 
				new Object[] {place.getName(), place.getGpsLocation().getNorth(), place.getGpsLocation().getWest()});
		this.place = place;
	}

	public Place getPlace() {
		return place;
	}
	
}