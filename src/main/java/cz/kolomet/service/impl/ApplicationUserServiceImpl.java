package cz.kolomet.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.PasswordEncoder;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.dto.ApplicationUserPasswordDto;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.security.PasswordGenerator;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.MailService;
import cz.kolomet.service.exception.ApplicationUserPasswordException;
import cz.kolomet.service.exception.ExistingUserException;
import cz.kolomet.service.exception.UserNotFoundException;

public class ApplicationUserServiceImpl implements ApplicationUserService {
	
	@Autowired
	ApplicationUserRepository applicationUserRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private PasswordGenerator passwordGenerator;
	
	@Autowired
	private MailService mailService;
	
	@Value("${applicationuser.mail.new.subject}")
	private String newApplicationUserMailSubject;
	
	@Value("${applicationuser.mail.new.template}")
	private String newApplicationUserMailTemplate;
	
	@Value("${applicationuser.mail.reset.subject}")
	private String resetApplicationUserMailSubject;
	
	@Value("${applicationuser.mail.reset.template}")
	private String resetApplicationuserMailTemplate;
	
	@PreAuthorize("hasRole('ROLE_per_applicationusers') or #applicationUser.id == principal.userId")
	public void saveApplicationUser(ApplicationUser applicationUser) {

    	if (applicationUserRepository.findByUsername(applicationUser.getUsername()) == null) {
    		
    		String password = passwordGenerator.generatePassword(applicationUser);
    		
    		applicationUser.setPassword(passwordEncoder.encodePassword(password, null));
        	applicationUserRepository.save(applicationUser);
        	
        	Map<String, Object> params = new HashMap<String, Object>();
        	params.put("applicationuser", applicationUser);
        	params.put("password", password);
        	
        	mailService.send(applicationUser.getUsername(), newApplicationUserMailSubject, newApplicationUserMailTemplate, params);
    	} else {
    		throw new ExistingUserException(applicationUser);
    	}
    	
    }
	
	public Page<ApplicationUser> findApplicationUserEntries(Pageable pageable) {
		return applicationUserRepository.findAll(pageable);
	}
	
    public ApplicationUser updateApplicationUser(ApplicationUser applicationUser) {
    	
    	ApplicationUser existingUser = applicationUserRepository.findByUsername(applicationUser.getUsername());
    	
    	// jestlize username existuje, ale jedna se o stejneho uzivatele nebo jestli username neexistuje, muzeme menit
    	if ((existingUser != null && existingUser.getId().equals(applicationUser.getId())) ||  (existingUser == null)) {
			String password = applicationUser.getPassword();
			String existingPassword = existingUser.getPassword();
			if (!existingPassword.equals(password)) {
				if (StringUtils.isNotEmpty(password)) {
					if (StringUtils.isNotEmpty(password)) {
						applicationUser.setPassword(this.passwordEncoder.encodePassword(password, null));
					}
				} else {
					throw new ApplicationUserPasswordException("Cannot change user password to empty value.");
				}
			}
		    return applicationUserRepository.save(applicationUser);
    	} else {
    		throw new ExistingUserException(applicationUser);
    	}
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
	
	public void resetPassword(String username) {
		
		ApplicationUser user = applicationUserRepository.findByUsername(username);
		if (user != null) {
			
			String password = passwordGenerator.generatePassword(user);
			user.setPassword(passwordEncoder.encodePassword(password, null));
			
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("applicationuser", user);
			params.put("password", password);
			
			mailService.send(user.getUsername(), resetApplicationUserMailSubject, resetApplicationuserMailTemplate, params);
			
		} else {
			throw new UserNotFoundException(username);
		}
	}
	
}
