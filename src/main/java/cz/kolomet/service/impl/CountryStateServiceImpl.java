package cz.kolomet.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.repository.CountryStateRepository;
import cz.kolomet.service.CountryStateService;

@Service
@Transactional
public class CountryStateServiceImpl implements CountryStateService {
	
    public List<CountryState> findAllCountryStates() {
        return countryStateRepository.findAll(Codelist.defaultSort());
    }
	

	@Autowired
    CountryStateRepository countryStateRepository;

	public long countAllCountryStates() {
        return countryStateRepository.count();
    }

	public void deleteCountryState(CountryState countryState) {
        countryStateRepository.delete(countryState);
    }

	public CountryState findCountryState(Long id) {
        return countryStateRepository.findOne(id);
    }

	public List<CountryState> findCountryStateEntries(int firstResult, int maxResults) {
        return countryStateRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveCountryState(CountryState countryState) {
        countryStateRepository.save(countryState);
    }

	public CountryState updateCountryState(CountryState countryState) {
        return countryStateRepository.save(countryState);
    }
}
