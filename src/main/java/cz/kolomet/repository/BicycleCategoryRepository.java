package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.BicycleCategory;

@Repository
public interface BicycleCategoryRepository extends JpaSpecificationExecutor<BicycleCategory>, JpaRepository<BicycleCategory, Long> {
}
