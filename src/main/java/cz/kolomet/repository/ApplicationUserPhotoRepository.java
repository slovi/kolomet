package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.ApplicationUserPhoto;

@Repository
public interface ApplicationUserPhotoRepository extends JpaRepository<ApplicationUserPhoto, Long>, JpaSpecificationExecutor<ApplicationUserPhoto>{

}
