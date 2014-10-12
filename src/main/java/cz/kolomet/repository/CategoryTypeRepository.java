package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.CategoryType;

@Repository
public interface CategoryTypeRepository extends JpaSpecificationExecutor<CategoryType>, JpaRepository<CategoryType, Long> {
	
	public CategoryType findByCodeKeyOrderBySequenceNrDesc(String codeKey);
	
}
