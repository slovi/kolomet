// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.ApplicationUser;

privileged aspect ApplicationUserRepository_Roo_Jpa_Repository {
    
    declare parents: ApplicationUserRepository extends JpaRepository<ApplicationUser, Long>;
    
    declare parents: ApplicationUserRepository extends JpaSpecificationExecutor<ApplicationUser>;
    
    declare @type: ApplicationUserRepository: @Repository;
    
}
