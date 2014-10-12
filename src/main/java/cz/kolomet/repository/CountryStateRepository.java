package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.CountryState;

@Repository
public interface CountryStateRepository extends JpaRepository<CountryState, Long>, JpaSpecificationExecutor<CountryState> {
}
