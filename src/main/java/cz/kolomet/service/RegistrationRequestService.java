package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.RegistrationRequest;

public interface RegistrationRequestService {
	
	public Page<RegistrationRequest> findRegistrationRequestEntries(Pageable pageable);
	

	public abstract long countAllRegistrationRequests();


	public abstract void deleteRegistrationRequest(RegistrationRequest registrationRequest);


	public abstract RegistrationRequest findRegistrationRequest(Long id);


	public abstract List<RegistrationRequest> findAllRegistrationRequests();


	public abstract List<RegistrationRequest> findRegistrationRequestEntries(int firstResult, int maxResults);


	public abstract void saveRegistrationRequest(RegistrationRequest registrationRequest);


	public abstract RegistrationRequest updateRegistrationRequest(RegistrationRequest registrationRequest);

}
