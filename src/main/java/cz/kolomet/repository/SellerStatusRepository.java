package cz.kolomet.repository;

import cz.kolomet.domain.codelist.SellerStatus;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = SellerStatus.class)
public interface SellerStatusRepository {
	
	public SellerStatus findByCodeKey(String codeKey);
	
}
