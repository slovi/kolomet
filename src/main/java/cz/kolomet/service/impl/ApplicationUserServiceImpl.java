package cz.kolomet.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.PasswordEncoder;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.dto.ApplicationUserPasswordDto;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.exception.ApplicationUserPasswordException;

public class ApplicationUserServiceImpl implements ApplicationUserService {
	
	@Autowired
	ApplicationUserRepository applicationUserRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@PreAuthorize("hasRole('ROLE_per_applicationusers') or #applicationUser.id == principal.userId")
	public void saveApplicationUser(ApplicationUser applicationUser) {

		applicationUser.setPassword(passwordEncoder.encodePassword(applicationUser.getPassword(), null));
        applicationUserRepository.save(applicationUser);
    }
	
	public Page<ApplicationUser> findApplicationUserEntries(Pageable pageable) {
		return applicationUserRepository.findAll(pageable);
	}
	
    public ApplicationUser updateApplicationUser(ApplicationUser applicationUser) {
    	String password = applicationUser.getPassword();
    	if (StringUtils.isNotEmpty(password)) {
    		applicationUser.setPassword(this.passwordEncoder.encodePassword(password, null));
    	}
        return applicationUserRepository.save(applicationUser);
    }

	public void updatePassword(ApplicationUserPasswordDto applicationUserPassword) {
		ApplicationUser user = applicationUserRepository.findByUsername(applicationUserPassword.getUsername());
		if (!user.getPassword().equals(passwordEncoder.encodePassword(applicationUserPassword.getPassword(), null))) {
			throw new ApplicationUserPasswordException("Cannot change password - old password is incorrect.", "exception_old_password_incorrect");
		}
		if (!applicationUserPassword.sameNewPassword()) {
			throw new ApplicationUserPasswordException("Cannot change password - new passwords are not the same.", "exception_new_password_incorrect");
		}
		user.setPassword(passwordEncoder.encodePassword(applicationUserPassword.getNewPassword(), null));
		applicationUserRepository.save(user);
	}
	
}
