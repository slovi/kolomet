package cz.kolomet.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.PlacePhotoUrl;

@Repository
public interface PlacePhotoUrlRepository extends JpaSpecificationExecutor<PlacePhotoUrl>, JpaRepository<PlacePhotoUrl, Long> {
}
