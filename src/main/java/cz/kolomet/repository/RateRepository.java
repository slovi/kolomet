package cz.kolomet.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;

@Repository
public interface RateRepository extends JpaSpecificationExecutor<Rate>, JpaRepository<Rate, Long> {
	
	public List<Rate> findByRateTypeAndEntityIdAndIpAddress(RateType rateType, Long entityId, String ipAddress);
	
}
