package cz.kolomet.repository;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Product;
import cz.kolomet.util.repository.CustomRepository;

@Repository
public interface ProductRepository extends CustomRepository<Product, Long> {
	
	@Query("select max(p.finalPrice) from Product p "
			+ "where 1 = (select s.enabled from Seller s where s = p.seller) "
				+ "and p.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")
	BigDecimal findMaxPrice();
	
	@Query("select max(p.discount) from Product p "
			+ "where 1 = (select s.enabled from Seller s where s = p.seller) "
				+ "and p.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")	
	BigDecimal findMaxDiscount();
	
	@Query("select max(p.weight) from Product p "
			+ "where 1 = (select s.enabled from Seller s where s = p.seller) "
				+ "and p.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")	
	Double findMaxWeight();
	
	@Query(
			"select p from Product p "
			+ "where 1 = (select s.enabled from Seller s where s = p.seller) "
				+ "and p.enabled = true and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE")
	List<Product> findByPriority(Pageable pageable);
	
	@Query(
			"select p from Product p "
			+ "inner join p.seller s "
			+ "where s.enabled = true and s.id = :sellerId and p.enabled = true "
				+ "and p.validFrom <= CURRENT_DATE and p.validTo >= CURRENT_DATE "
			+ "order by p.id desc")
	List<Product> findBySellerId(@Param("sellerId") Long sellerId, Pageable pageable);
	
	@Modifying
	@Query("update Product set copiedFrom = null where copiedFrom = :copiedFrom")
	void deleteCopiedFrom(@Param("copiedFrom") Product product);
	
}