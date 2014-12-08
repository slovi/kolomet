package cz.kolomet.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.ProductColor;

@Repository
public interface ProductColorRepository extends JpaSpecificationExecutor<ProductColor>, JpaRepository<ProductColor, Long> {
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<ProductColor> findAll(Sort sort);
	
}
