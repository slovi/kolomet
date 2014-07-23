package cz.kolomet.domain;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.NumberFormat;

public class GpsLocation {
	
	@NotNull
	@NumberFormat(pattern = "###")
	private Double north;
	
	@NotNull
	@NumberFormat(pattern = "###")
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
