// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.CountryState;

privileged aspect CountryStateRepository_Roo_Jpa_Repository {
    
    declare parents: CountryStateRepository extends JpaRepository<CountryState, Long>;
    
    declare parents: CountryStateRepository extends JpaSpecificationExecutor<CountryState>;
    
    declare @type: CountryStateRepository: @Repository;
    
}
