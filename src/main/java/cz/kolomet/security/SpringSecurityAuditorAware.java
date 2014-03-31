package cz.kolomet.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.repository.ApplicationUserRepository;

public class SpringSecurityAuditorAware implements AuditorAware<ApplicationUser>{
	
	@Autowired
	private ApplicationUserRepository applicationUserRepository;

	@Override
	public ApplicationUser getCurrentAuditor() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	    if (authentication == null || !authentication.isAuthenticated() || (authentication.getPrincipal() instanceof String)) {
	      return null;
	    }

	    ApplicationUser applicationUser = ((ApplicationUserDetails) authentication.getPrincipal()).getUser();
	    
	    return applicationUserRepository.findOne(applicationUser.getId());
	}

}
