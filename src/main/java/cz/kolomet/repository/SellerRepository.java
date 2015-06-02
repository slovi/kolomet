package cz.kolomet.repository;
import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Seller;

@Repository
public interface SellerRepository extends JpaSpecificationExecutor<Seller>, JpaRepository<Seller, Long> {
	
	public Seller findByIdAndEnabled(Long id, Boolean enabled);
	
	public List<Seller> findByEnabledOrderBySellerNameAsc(Boolean enabled);
	
	@Query("select s from Seller s inner join s.region r where r.codeKey = :regionCodeKey and s.enabled = true order by s.sellerName asc")
	public List<Seller> findByRegionCodeKeyOrderBySellerNameAsc(@Param("regionCodeKey") String regionCodeKey);
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Seller> findAll(Sort sort);
	
}