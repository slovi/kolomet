package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.service.RateService;
import cz.kolomet.service.RatedService;

public class RateServiceImpl implements RateService {
	
	@Autowired
	private List<RatedService> ratedServices;
	
	@Override
	public void saveRate(Rate rate) {
		rateRepository.save(rate);
		for (RatedService ratedService: ratedServices) {
			if (ratedService.supports(rate.getRateType())) {
				ratedService.addRate(rate.getEntityId(), rate.getValue());
			}
		}
	}
	
	@Override
	public Rate findRate(RateType rateType, Long entityId, String ipAddress) {
		return rateRepository.findByRateTypeAndEntityIdAndIpAddress(rateType, entityId, ipAddress);
	}
	
}
