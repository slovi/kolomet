package cz.kolomet.repository;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.CategoryType;

@Repository
public interface CategoryTypeRepository extends JpaSpecificationExecutor<CategoryType>, JpaRepository<CategoryType, Long> {
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public CategoryType findByCodeKeyOrderBySequenceNrDesc(String codeKey);
	
}
