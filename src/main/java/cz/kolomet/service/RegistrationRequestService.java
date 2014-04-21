package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.RegistrationRequest;

@RooService(domainTypes = { cz.kolomet.domain.RegistrationRequest.class })
public interface RegistrationRequestService {
	
	public Page<RegistrationRequest> findRegistrationRequestEntries(Pageable pageable);
	
}
