package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Seller;

@RooJpaRepository(domainType = ApplicationUser.class)
public interface ApplicationUserRepository {
	
	public ApplicationUser findByToken(String token);
	
	public ApplicationUser findByUsername(String username);
	
	public ApplicationUser findBySeller(Seller seller);
	
}
