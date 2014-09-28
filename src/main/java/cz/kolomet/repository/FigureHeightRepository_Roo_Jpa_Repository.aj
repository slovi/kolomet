// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.FigureHeight;

privileged aspect FigureHeightRepository_Roo_Jpa_Repository {
    
    declare parents: FigureHeightRepository extends JpaRepository<FigureHeight, Long>;
    
    declare parents: FigureHeightRepository extends JpaSpecificationExecutor<FigureHeight>;
    
    declare @type: FigureHeightRepository: @Repository;
    
}
