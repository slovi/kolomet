package cz.kolomet.service;

import cz.kolomet.domain.codelist.CountryState;
import java.util.List;

public interface CountryStateService {

	public abstract long countAllCountryStates();


	public abstract void deleteCountryState(CountryState countryState);


	public abstract CountryState findCountryState(Long id);


	public abstract List<CountryState> findAllCountryStates();


	public abstract List<CountryState> findCountryStateEntries(int firstResult, int maxResults);


	public abstract void saveCountryState(CountryState countryState);


	public abstract CountryState updateCountryState(CountryState countryState);

}
