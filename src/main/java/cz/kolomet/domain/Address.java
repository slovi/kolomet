package cz.kolomet.domain;

import javax.persistence.Embeddable;

@Embeddable
public class Address {
	
	private String street;
	
	private String city;
	
	private String zipCode;
	
	private Integer houseNr;

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Integer getHouseNr() {
		return houseNr;
	}

	public void setHouseNr(Integer houseNr) {
		this.houseNr = houseNr;
	}
	
}
