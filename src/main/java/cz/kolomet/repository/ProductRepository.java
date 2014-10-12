package cz.kolomet.repository;
import java.math.BigDecimal;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Product;

@Repository
public interface ProductRepository extends JpaSpecificationExecutor<Product>, JpaRepository<Product, Long> {
	
	@Query("select max(p.price) from Product p inner join p.seller s where s.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")
	BigDecimal findMaxPrice();
	
	@Query("select max(p.discount) from Product p inner join p.seller s where s.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")
	BigDecimal findMaxDiscount();
	
	@Query("select max(p.weight) from Product p inner join p.seller s where s.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")
	Double findMaxWeight();
	
	@Query("select p from Product p inner join p.seller s inner join s.sellerStatus ss where s.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")
	Page<Product> findByPriority(Pageable pageable);
	
	@Query("select p from Product p inner join p.seller s where s.enabled = true and s.id = :sellerId and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")
	Page<Product> findBySellerId(@Param("sellerId") Long sellerId, Pageable pageable);
	
}