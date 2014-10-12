package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.repository.RateRepository;
import cz.kolomet.service.RateService;
import cz.kolomet.service.RatedService;
import cz.kolomet.service.exception.ExistingRateException;

@Service
@Transactional
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
	

	@Autowired
    RateRepository rateRepository;

	public long countAllRates() {
        return rateRepository.count();
    }

	public void deleteRate(Rate rate) {
        rateRepository.delete(rate);
    }

	public Rate findRate(Long id) {
        return rateRepository.findOne(id);
    }

	public List<Rate> findAllRates() {
        return rateRepository.findAll();
    }

	public List<Rate> findRateEntries(int firstResult, int maxResults) {
        return rateRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public Rate updateRate(Rate rate) {
        return rateRepository.save(rate);
    }
}
