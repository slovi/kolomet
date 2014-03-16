package cz.kolomet.repository;
import java.util.List;

import cz.kolomet.domain.Product;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Product.class)
public interface ProductRepository {
	
	@Query("select p from Product p inner join p.category c where c.codeKey = :categoryCodeKey")
	List<Product> findByCategory(@Param("categoryCodeKey") String categoryCodeKey);
	
	@Query("select p from Product p inner join p.category c inner join c.categoryType ct where ct.codeKey = :categoryTypeCodeKey")
	List<Product> findByCategoryType(@Param("categoryTypeCodeKey") String categoryTypeCodeKey);
	
}
