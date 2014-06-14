package cz.kolomet.repository;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Seller;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ApplicationUser.class)
public interface ApplicationUserRepository {
	
	public ApplicationUser findByUsername(String username);
	
	public ApplicationUser findBySeller(Seller seller);
	
}
