package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.ApplicationUserPhoto;
import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.dto.ApplicationUserPasswordDto;
import cz.kolomet.repository.ApplicationUserPhotoRepository;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.security.PasswordGenerator;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.MailService;
import cz.kolomet.service.TokenGenerator;
import cz.kolomet.service.exception.ApplicationUserPasswordException;
import cz.kolomet.service.exception.ExistingUserException;
import cz.kolomet.service.exception.TokenNotFoundException;
import cz.kolomet.service.exception.UserNotFoundException;

@Service
@Transactional
public class ApplicationUserServiceImpl extends AbstractPhotoUrlService implements ApplicationUserService {
	
	@Autowired
	private ApplicationUserRepository applicationUserRepository;
	
	@Autowired
	private ApplicationUserPhotoRepository applicationUserPhotoRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private PasswordGenerator passwordGenerator;
	
	@Autowired
	private TokenGenerator tokenGenerator;
	
	@Autowired
	private MailService mailService;
	
	@Value("${applicationuser.agreement.version}")
	private String agreementVersion;
	
	@Value("${applicationuser.mail.new.subject}")
	private String newApplicationUserMailSubject;
	
	@Value("${applicationuser.mail.new.template}")
	private String newApplicationUserMailTemplate;
	
	@Value("${applicationuser.mail.reset.subject}")
	private String resetApplicationUserMailSubject;
	
	@Value("${applicationuser.mail.reset.template}")
	private String resetApplicationuserMailTemplate;
	
	@Value("${applicationuser.mail.register.subject}")
	private String registerApplicationuserMailSubject;
	
	@Value("${applicationuser.mail.register.template}")
	private String registerApplicationuserMailTemplate;
	
	@Value("${applicationuserregistration.img.thumbnail.width}")
	private Integer thumbnailWidth;
	
	@Value("${applicationuserregistration.img.thumbnail.height}")
	private Integer thumbnailHeight;
	
	@Value("${applicationuserregistration.registration.link}")
	private String registrationLinkBase;
	
	public ApplicationUserPhoto findApplicationUserPhoto(Long id) {
		return applicationUserPhotoRepository.findOne(id);
	}
	
	@Override
    public void deletePhoto(Photo photo) {
		applicationUserPhotoRepository.delete((ApplicationUserPhoto) photo);
		super.deletePhoto(photo);
	}
	
	@Override
	public void savePhoto(Photo photo) {
		applicationUserPhotoRepository.save((ApplicationUserPhoto) photo);
	}

	@Override
	public ResizeInfo[] getResizeInfos() {
		ResizeInfo[] resizeInfos = new ResizeInfo[1];
		resizeInfos[0] = new ResizeInfo(new Dimension(thumbnailWidth, thumbnailHeight), PhotoUrl.THUMBNAIL_IMG_SUFFIX, false);
    	return resizeInfos;
	}
	
	public void activateApplicationUser(String token) {
		ApplicationUser applicationUser = applicationUserRepository.findByToken(token);
		if (applicationUser == null) {
			throw new TokenNotFoundException(token);
		}
		if (applicationUser.getEnabled()) {
			throw new ExistingUserException(applicationUser);
		}
		applicationUser.setEnabled(true);
		applicationUserRepository.save(applicationUser);
	}
	
	public void registerApplicationUser(ApplicationUser applicationUser) {
		
		applicationUser.setConditionAgreement(new Date());
		applicationUser.setConditionVersion(agreementVersion);
		applicationUser.setToken(tokenGenerator.generateToken(applicationUser));
		
		saveApplicationUser(applicationUser, false);
		
		String link = registrationLinkBase + applicationUser.getToken();
		
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("applicationuser", applicationUser);
    	params.put("link", link);
		
		mailService.send(applicationUser.getUsername(), registerApplicationuserMailSubject, registerApplicationuserMailTemplate, params);
	}
	
	public void saveApplicationUser(ApplicationUser applicationUser, boolean generatePassword) {

    	if (applicationUserRepository.findByUsernameAndEnabled(applicationUser.getUsername(), true) == null) {
    		
    		if (generatePassword) {
    			
    			String password = passwordGenerator.generatePassword(applicationUser);
	    		applicationUser.setPassword(passwordEncoder.encodePassword(password, null));
	    		
	        	applicationUserRepository.save(applicationUser);
	        	
	        	Map<String, Object> params = new HashMap<String, Object>();
	        	params.put("applicationuser", applicationUser);
	        	params.put("password", password);
	        	
	        	mailService.send(applicationUser.getUsername(), newApplicationUserMailSubject, newApplicationUserMailTemplate, params);
	        	
    		} else {

    			applicationUserRepository.save(applicationUser);
    			
    		}
    	} else {
    		
    		throw new ExistingUserException(applicationUser);
    		
    	}
    }
	
	@PreAuthorize("principal.isCapableToSaveApplicationUser(#applicationUser)")
	public void saveApplicationUser(ApplicationUser applicationUser) {
		saveApplicationUser(applicationUser, true);
    }
	
	public Page<ApplicationUser> findApplicationUserEntries(Pageable pageable) {
		return applicationUserRepository.findAll(pageable);
	}
	
	@PreAuthorize("principal.isCapableToUpdateApplicationUser(#applicationUser)")
    public ApplicationUser updateApplicationUser(ApplicationUser applicationUser) {
    	
    	ApplicationUser existingUser = applicationUserRepository.findByUsernameAndEnabled(applicationUser.getUsername(), true);
    	
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

	@PreAuthorize("principal.isCapableToUpdatePassword(#applicationUserPassword)")
	public void updatePassword(ApplicationUserPasswordDto applicationUserPassword) {
		ApplicationUser user = applicationUserRepository.findByUsernameAndEnabled(applicationUserPassword.getUsername(), true);
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
		
		ApplicationUser user = applicationUserRepository.findByUsernameAndEnabled(username, true);
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
	

	public long countAllApplicationUsers() {
        return applicationUserRepository.count();
    }

	@PreAuthorize("principal.isCapableToDeleteApplicationUser(#applicationUser)")
	public void deleteApplicationUser(ApplicationUser applicationUser) {
		applicationUser.setEnabled(false);
		applicationUserRepository.save(applicationUser);
    }

	@PreAuthorize("principal.isApplicationUserOwner(#id)")
	public ApplicationUser findApplicationUser(Long id) {
        return applicationUserRepository.findOne(id);
    }

	public List<ApplicationUser> findAllApplicationUsers() {
        return applicationUserRepository.findAll();
    }

	public List<ApplicationUser> findApplicationUserEntries(int firstResult, int maxResults) {
        return applicationUserRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
}
