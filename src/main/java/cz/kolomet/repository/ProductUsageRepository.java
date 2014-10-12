package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.ProductUsage;

@Repository
public interface ProductUsageRepository extends JpaRepository<ProductUsage, Long>, JpaSpecificationExecutor<ProductUsage> {
}
