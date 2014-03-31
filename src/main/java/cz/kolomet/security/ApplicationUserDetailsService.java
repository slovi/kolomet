package cz.kolomet.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.repository.ApplicationUserRepository;

public class ApplicationUserDetailsService implements UserDetailsService {
	
	@Autowired
	private ApplicationUserRepository applicationUserRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		ApplicationUser user = applicationUserRepository.findByUsername(username);
		
		if (user == null) {
			throw new UsernameNotFoundException("Username \"" + username + "\" not found");
		}
		
		return new ApplicationUserDetails(user);
	}

}
