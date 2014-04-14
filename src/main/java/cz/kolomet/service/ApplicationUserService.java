package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.dto.ApplicationUserPasswordDto;

@RooService(domainTypes = { cz.kolomet.domain.ApplicationUser.class })
public interface ApplicationUserService {
	
	public void updatePassword(ApplicationUserPasswordDto applicationUserPassword);
	
	public Page<ApplicationUser> findApplicationUserEntries(Pageable pageable);
	
}
