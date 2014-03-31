package cz.kolomet.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.service.ApplicationUserService;

public class ApplicationUserServiceImpl implements ApplicationUserService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void saveApplicationUser(ApplicationUser applicationUser) {

		applicationUser.setPassword(passwordEncoder.encodePassword(applicationUser.getPassword(), null));
        applicationUserRepository.save(applicationUser);
    }
	
}
