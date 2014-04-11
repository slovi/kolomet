package cz.kolomet.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.AuditorAware;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.repository.ApplicationUserRepository;

public class SpringSecurityAuditorAware implements AuditorAware<ApplicationUser>{
	
	@Autowired
	private ApplicationUserRepository applicationUserRepository;

	@Override
	public ApplicationUser getCurrentAuditor() {
		
	    ApplicationUser applicationUser = ApplicationUserDetails.getActualApplicationUserDetails().getUser();
	    
	    return applicationUserRepository.findOne(applicationUser.getId());
	}

}
