package cz.kolomet.service;
import java.util.List;


import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;

public interface RateService {
	
	public void saveRate(Rate rate);
	
	public List<Rate> findRate(RateType rateType, Long entityId, String ipAddress);    
	

	public abstract long countAllRates();


	public abstract void deleteRate(Rate rate);


	public abstract Rate findRate(Long id);


	public abstract List<Rate> findAllRates();


	public abstract List<Rate> findRateEntries(int firstResult, int maxResults);


	public abstract Rate updateRate(Rate rate);

}
