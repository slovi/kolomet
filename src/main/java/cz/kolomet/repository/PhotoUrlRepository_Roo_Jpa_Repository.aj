// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.repository.PhotoUrlRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect PhotoUrlRepository_Roo_Jpa_Repository {
    
    declare parents: PhotoUrlRepository extends JpaRepository<PhotoUrl, Long>;
    
    declare parents: PhotoUrlRepository extends JpaSpecificationExecutor<PhotoUrl>;
    
    declare @type: PhotoUrlRepository: @Repository;
    
}
