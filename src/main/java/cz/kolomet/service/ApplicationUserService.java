package cz.kolomet.service;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.dto.ApplicationUserPasswordDto;

@RooService(domainTypes = { cz.kolomet.domain.ApplicationUser.class })
public interface ApplicationUserService {
	
	public void updatePassword(ApplicationUserPasswordDto applicationUserPassword);
	
}
