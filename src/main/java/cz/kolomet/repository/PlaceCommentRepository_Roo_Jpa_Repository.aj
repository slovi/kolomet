// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.repository;

import cz.kolomet.domain.PlaceComment;
import cz.kolomet.repository.PlaceCommentRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect PlaceCommentRepository_Roo_Jpa_Repository {
    
    declare parents: PlaceCommentRepository extends JpaRepository<PlaceComment, Long>;
    
    declare parents: PlaceCommentRepository extends JpaSpecificationExecutor<PlaceComment>;
    
    declare @type: PlaceCommentRepository: @Repository;
    
}