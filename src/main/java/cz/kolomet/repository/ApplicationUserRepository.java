package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.ApplicationUser;

@Repository
public interface ApplicationUserRepository extends JpaRepository<ApplicationUser, Long>, JpaSpecificationExecutor<ApplicationUser> {
	
	public ApplicationUser findByToken(String token);
	
	public ApplicationUser findByUsernameAndEnabled(String username, Boolean enabled);	
	
}
