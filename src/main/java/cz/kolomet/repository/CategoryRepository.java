package cz.kolomet.repository;
import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>, JpaSpecificationExecutor<Category> {
	
	Category findByCodeKey(String codeKey);
	
	@Query("select c from Category c join fetch c.categoryType ct where ct.id = :categoryTypeId order by c.codeDescription asc")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	List<Category> find(@Param("categoryTypeId") Long categoryTypeId);
	
}
