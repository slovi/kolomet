// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.repository.NewsItemPhotoUrlRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect NewsItemPhotoUrlRepository_Roo_Jpa_Repository {
    
    declare parents: NewsItemPhotoUrlRepository extends JpaRepository<NewsItemPhotoUrl, Long>;
    
    declare parents: NewsItemPhotoUrlRepository extends JpaSpecificationExecutor<NewsItemPhotoUrl>;
    
    declare @type: NewsItemPhotoUrlRepository: @Repository;
    
}
