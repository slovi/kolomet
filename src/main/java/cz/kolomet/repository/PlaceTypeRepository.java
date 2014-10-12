package cz.kolomet.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.PlaceType;

@Repository
public interface PlaceTypeRepository extends JpaRepository<PlaceType, Long>, JpaSpecificationExecutor<PlaceType> {
}
