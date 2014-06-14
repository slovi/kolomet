package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.SellerStatus;

@RooJpaRepository(domainType = SellerStatus.class)
public interface SellerStatusRepository {
	
	public SellerStatus findByCodeKey(String codeKey);
	
}
