package cz.kolomet.repository;
import java.util.List;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;

@RooJpaRepository(domainType = Rate.class)
public interface RateRepository {
	
	public List<Rate> findByRateTypeAndEntityIdAndIpAddress(RateType rateType, Long entityId, String ipAddress);
	
}
