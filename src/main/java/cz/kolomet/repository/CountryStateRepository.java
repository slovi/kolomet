package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.CountryState;

@RooJpaRepository(domainType = CountryState.class)
public interface CountryStateRepository {
}
