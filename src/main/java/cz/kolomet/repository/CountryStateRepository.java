package cz.kolomet.repository;

import cz.kolomet.domain.codelist.CountryState;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = CountryState.class)
public interface CountryStateRepository {
}
