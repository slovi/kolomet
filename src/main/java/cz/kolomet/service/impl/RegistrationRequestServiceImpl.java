package cz.kolomet.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.service.MailService;
import cz.kolomet.service.RegistrationRequestService;

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
	
}
