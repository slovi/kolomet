package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.ProductAttributeType;

@Repository
public interface ProductAttributeTypeRepository extends JpaSpecificationExecutor<ProductAttributeType>, JpaRepository<ProductAttributeType, Long> {
}
