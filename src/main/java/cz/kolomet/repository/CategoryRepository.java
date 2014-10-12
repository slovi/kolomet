package cz.kolomet.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>, JpaSpecificationExecutor<Category> {
	
	List<Category> findByCodeKey(String codeKey);
	
	@Query("select c from Category c inner join c.categoryType ct where ct.id = :categoryTypeId order by c.codeDescription asc")
	List<Category> find(@Param("categoryTypeId") Long categoryTypeId);
	
}
