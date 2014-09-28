package cz.kolomet.service;
import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;

@RooService(domainTypes = { cz.kolomet.domain.Rate.class })
public interface RateService {
	
	public void saveRate(Rate rate);
	
	public List<Rate> findRate(RateType rateType, Long entityId, String ipAddress);    
	
}
