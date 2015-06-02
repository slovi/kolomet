package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import cz.kolomet.domain.PagePhotoUrl;

public interface PagePhotoUrlRepository extends JpaSpecificationExecutor<PagePhotoUrl>, JpaRepository<PagePhotoUrl, Long> {

}
