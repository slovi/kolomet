package cz.kolomet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AdminProductFilterDto {
	
	private String name;
	
	@DateTimeFormat(style="M-")
	private Date validFrom;
	
	@DateTimeFormat(style="M-")
	private Date validTo;
	
	public String getName() {
		return name;
	}

	public Date getValidFrom() {
		return validFrom;
	}

	public void setValidFrom(Date validFrom) {
		this.validFrom = validFrom;
	}

	public Date getValidTo() {
		return validTo;
	}

	public void setValidTo(Date validTo) {
		this.validTo = validTo;
	}

	public void setName(String name) {
		this.name = name;
	}

}
