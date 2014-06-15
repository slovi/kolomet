package cz.kolomet.domain;

import javax.validation.constraints.NotNull;

public class GpsLocation {
	
	@NotNull
	private Double north;
	
	@NotNull
	private Double west;

	public Double getNorth() {
		return north;
	}

	public void setNorth(Double north) {
		this.north = north;
	}

	public Double getWest() {
		return west;
	}

	public void setWest(Double west) {
		this.west = west;
	}

}
