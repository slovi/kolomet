// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import cz.kolomet.domain.codelist.Region;
import cz.kolomet.repository.RegionRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect RegionRepository_Roo_Jpa_Repository {
    
    declare parents: RegionRepository extends JpaRepository<Region, Long>;
    
    declare parents: RegionRepository extends JpaSpecificationExecutor<Region>;
    
    declare @type: RegionRepository: @Repository;
    
}