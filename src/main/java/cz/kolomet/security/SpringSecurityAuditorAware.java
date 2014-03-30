package cz.kolomet.security;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import cz.kolomet.domain.ApplicationUser;

public class SpringSecurityAuditorAware implements AuditorAware<ApplicationUser>{

	@Override
	public ApplicationUser getCurrentAuditor() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	    if (authentication == null || !authentication.isAuthenticated()) {
	      return null;
	    }

	    return ((ApplicationUserDetails) authentication.getPrincipal()).getUser();
	}

}
