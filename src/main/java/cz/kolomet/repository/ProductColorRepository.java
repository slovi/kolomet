package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.ProductColor;

@Repository
public interface ProductColorRepository extends JpaSpecificationExecutor<ProductColor>, JpaRepository<ProductColor, Long> {
}
