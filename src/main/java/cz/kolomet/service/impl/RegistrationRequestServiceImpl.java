package cz.kolomet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.repository.RegistrationRequestRepository;
import cz.kolomet.service.MailService;
import cz.kolomet.service.RegistrationRequestService;

@Service
@Transactional
public class RegistrationRequestServiceImpl implements RegistrationRequestService {
	
	@Value("${registrationrequest.mail.subject}")
	private String mailSubject;
	
	@Value("${registrationrequest.mail.templateNameClient}")
	private String templateNameClient;
	
	@Value("${registrationrequest.mail.templateNameEmployee}")
	private String templateNameEmployee;
	
	@Value("${registrationrequest.mail.employee.to}")
	private String registrationRequestEmployeeTo;
	
	@Autowired
	private MailService mailService;
	
	public void saveRegistrationRequest(RegistrationRequest registrationRequest) {
		
		registrationRequestRepository.save(registrationRequest);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("registrationrequest", registrationRequest);
		
		mailService.send(registrationRequest.getEmail(), mailSubject, templateNameClient, model);
		
		if (StringUtils.isNotEmpty(registrationRequestEmployeeTo)) {
			mailService.send(registrationRequestEmployeeTo.split(","), mailSubject, templateNameEmployee, model);
		}
	}
	
	public Page<RegistrationRequest> findRegistrationRequestEntries(Pageable pageable) {
		return registrationRequestRepository.findAll(pageable);
	}
	

	@Autowired
    RegistrationRequestRepository registrationRequestRepository;

	public long countAllRegistrationRequests() {
        return registrationRequestRepository.count();
    }

	public void deleteRegistrationRequest(RegistrationRequest registrationRequest) {
        registrationRequestRepository.delete(registrationRequest);
    }

	public RegistrationRequest findRegistrationRequest(Long id) {
        return registrationRequestRepository.findOne(id);
    }

	public List<RegistrationRequest> findAllRegistrationRequests() {
        return registrationRequestRepository.findAll();
    }

	public List<RegistrationRequest> findRegistrationRequestEntries(int firstResult, int maxResults) {
        return registrationRequestRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public RegistrationRequest updateRegistrationRequest(RegistrationRequest registrationRequest) {
        return registrationRequestRepository.save(registrationRequest);
    }
}
