package cz.kolomet.domain;

import java.io.Serializable;

import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;

import cz.kolomet.domain.codelist.CountryState;

@MappedSuperclass
public class Address implements Serializable {
	
	private String street;
	
	private String city;
	
	private String postCode;
	
	private String houseNr;
	
    @NotNull
    @ManyToOne
	private CountryState countryState;
    
    public String getAddressString() {
    	StringBuilder builder = new StringBuilder();
    	if (StringUtils.isNotEmpty(street)) {
    		builder.append(street);
    		if (getHouseNr() != null) {
    			builder.append(" ");
    			builder.append(getHouseNr());
    		}
    		builder.append(", ");
    	}
    	if (StringUtils.isNotEmpty(city)) {
    		builder.append(city);
    		builder.append(", ");
    	}
    	if (StringUtils.isNotEmpty(postCode)) {
    		builder.append(postCode);
    	}
    	return builder.toString();
    }
	
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

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getHouseNr() {
		return houseNr;
	}

	public void setHouseNr(String houseNr) {
		this.houseNr = houseNr;
	}

	public CountryState getCountryState() {
		return countryState;
	}

	public void setCountryState(CountryState countryState) {
		this.countryState = countryState;
	}
	
}
