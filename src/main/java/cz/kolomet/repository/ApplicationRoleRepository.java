package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.ApplicationRole;

@Repository
public interface ApplicationRoleRepository extends JpaRepository<ApplicationRole, Long>, JpaSpecificationExecutor<ApplicationRole> {
	
	public ApplicationRole findByRoleName(String roleName);
	
}
