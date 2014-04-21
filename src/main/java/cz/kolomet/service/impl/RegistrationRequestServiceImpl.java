package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.service.RegistrationRequestService;

public class RegistrationRequestServiceImpl implements RegistrationRequestService {
	
	public Page<RegistrationRequest> findRegistrationRequestEntries(Pageable pageable) {
		return registrationRequestRepository.findAll(pageable);
	}
	
}
