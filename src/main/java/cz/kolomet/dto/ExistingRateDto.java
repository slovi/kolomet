package cz.kolomet.dto;

import cz.kolomet.domain.Rate;

public class ExistingRateDto {
	
	private final boolean existAny;
	
	private final Rate rate;
	
	public ExistingRateDto() {
		this.existAny = false;
		this.rate = null;
	}
	
	public ExistingRateDto(Rate rate) {
		this.existAny = true;
		this.rate = rate;
	}

	public boolean isExistAny() {
		return existAny;
	}

	public Rate getRate() {
		return rate;
	}

}
