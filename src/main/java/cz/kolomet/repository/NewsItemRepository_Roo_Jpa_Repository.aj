// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.repository.NewsItemRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect NewsItemRepository_Roo_Jpa_Repository {
    
    declare parents: NewsItemRepository extends JpaRepository<NewsItem, Long>;
    
    declare parents: NewsItemRepository extends JpaSpecificationExecutor<NewsItem>;
    
    declare @type: NewsItemRepository: @Repository;
    
}