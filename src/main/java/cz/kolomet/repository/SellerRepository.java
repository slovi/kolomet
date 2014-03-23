package cz.kolomet.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.Seller;

@RooJpaRepository(domainType = Seller.class)
public interface SellerRepository {
	
	@Query("select s from Seller s inner join s.region r where r.codeKey = :regionCodeKey order by s.sellerName desc")
	public List<Seller> findByRegionCodeKeyOrderBySellerNameDesc(@Param("regionCodeKey") String regionCodeKey);
	
}
