package cz.kolomet.domain;

import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.NumberFormat;

@Embeddable
public class GpsLocation {
	
	@NotNull
	@NumberFormat(pattern = "###.#################")
	private Double north;
	
	@NotNull
	@NumberFormat(pattern = "###.#################")
	private Double west;
	
	public GpsLocation() {
		
	}
	
	public GpsLocation(Double north, Double west) {
		this.north = north;
		this.west = west;
	}

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
