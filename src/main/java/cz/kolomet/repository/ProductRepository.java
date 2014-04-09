package cz.kolomet.repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;

@RooJpaRepository(domainType = Product.class)
public interface ProductRepository {
	
	@Query("select p from Product p inner join p.seller s inner join s.sellerStatus ss")
	Page<Product> findByPriority(Pageable pageable);
	
	@Query("select p from Product p inner join p.seller s where s.id = :sellerId")
	Page<Product> findBySellerId(@Param("sellerId") Long sellerId, Pageable pageable);
	
	@Query("select p from Product p inner join p.seller s inner join p.producer pr where pr.id = :producerId")
	Page<Product> findByProducerOrderByCreatedDateDesc(@Param("producer") Producer producer, Pageable pageable);
	
	@Query("select p from Product p inner join p.category c inner join p.seller s where c.id = :categoryId")
	Page<Product> findByCategory(@Param("category") Category category, Pageable pageable);
	
	@Query("select p from Product p inner join p.seller s inner join p.category c inner join c.categoryType ct where ct.codeKey = :categoryTypeCodeKey")
	Page<Product> findByCategoryType(@Param("categoryTypeCodeKey") String categoryTypeCodeKey, Pageable pageable);
	
}