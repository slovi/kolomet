package cz.kolomet.service;

import cz.kolomet.domain.RateType;

public interface RatedService {
	
	public boolean supports(RateType rateType);
	
	public void addRate(Long id, Integer value);

}
