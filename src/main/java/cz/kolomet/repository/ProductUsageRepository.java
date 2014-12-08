package cz.kolomet.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.ProductUsage;

@Repository
public interface ProductUsageRepository extends JpaRepository<ProductUsage, Long>, JpaSpecificationExecutor<ProductUsage> {
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<ProductUsage> findAll(Sort sort);
	
}
