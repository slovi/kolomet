package cz.kolomet.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.Category;

@RooJpaRepository(domainType = Category.class)
public interface CategoryRepository {
	
	List<Category> findByCodeKey(String codeKey);
	
	@Query("select c from Category c inner join c.categoryType ct where ct.id = :categoryTypeId")
	List<Category> find(@Param("categoryTypeId") Long categoryTypeId);
	
}
