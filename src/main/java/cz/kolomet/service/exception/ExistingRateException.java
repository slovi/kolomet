package cz.kolomet.service.exception;

import cz.kolomet.domain.Rate;

public class ExistingRateException extends RuntimeException {
	
	private final Rate rate;
	
	public ExistingRateException(Rate rate) {
		super("Rate from entered ip has been already done");
		this.rate = rate;
	}

	public Rate getRate() {
		return rate;
	}

}
