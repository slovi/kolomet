package cz.kolomet.repository;
import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Rate.class)
public interface RateRepository {
	
	public Rate findByRateTypeAndEntityIdAndIpAddress(RateType rateType, Long entityId, String ipAddress);
	
}
