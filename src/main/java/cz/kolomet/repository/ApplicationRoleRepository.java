package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.ApplicationRole;

@RooJpaRepository(domainType = ApplicationRole.class)
public interface ApplicationRoleRepository {
	
	public ApplicationRole findByRoleName(String roleName);
	
}
