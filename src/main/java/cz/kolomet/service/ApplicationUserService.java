package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.dto.ApplicationUserPasswordDto;

@RooService(domainTypes = { cz.kolomet.domain.ApplicationUser.class })
public interface ApplicationUserService extends PhotoContainerService {
	
	public void activateApplicationUser(String token);
	
	public void registerApplicationUser(ApplicationUser applicationUser);
	
	public void saveApplicationUser(ApplicationUser applicationUser, boolean generatePassword);
	
	public void updatePassword(ApplicationUserPasswordDto applicationUserPassword);
	
	public void resetPassword(String username);
	
	public Page<ApplicationUser> findApplicationUserEntries(Pageable pageable);
	
}
