package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.service.RateService;
import cz.kolomet.service.RatedService;
import cz.kolomet.service.exception.ExistingRateException;

public class RateServiceImpl implements RateService {
	
	@Autowired
	private List<RatedService> ratedServices;
	
	@Override
	public void saveRate(Rate rate) {
		
		List<Rate> existingRates = findRate(rate.getRateType(), rate.getEntityId(), rate.getIpAddress()); 
		if (existingRates.isEmpty()) {
			rateRepository.save(rate);
			for (RatedService ratedService: ratedServices) {
				if (ratedService.supports(rate.getRateType())) {
					ratedService.addRate(rate.getEntityId(), rate.getValue());
				}
			}
		} else {
			throw new ExistingRateException(rate);
		}
	}
	
	@Override
	public List<Rate> findRate(RateType rateType, Long entityId, String ipAddress) {
		return rateRepository.findByRateTypeAndEntityIdAndIpAddress(rateType, entityId, ipAddress);
	}
	
}
