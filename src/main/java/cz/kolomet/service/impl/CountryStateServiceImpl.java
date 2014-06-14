package cz.kolomet.service.impl;

import java.util.List;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.service.CountryStateService;

public class CountryStateServiceImpl implements CountryStateService {
	
    public List<CountryState> findAllCountryStates() {
        return countryStateRepository.findAll(Codelist.defaultSort());
    }
	
}
