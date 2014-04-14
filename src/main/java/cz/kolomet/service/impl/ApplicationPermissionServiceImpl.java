package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.service.ApplicationPermissionService;

public class ApplicationPermissionServiceImpl implements ApplicationPermissionService {
	
	public Page<ApplicationPermission> findApplicationPermissionEntries(Pageable pageable) {
		return applicationPermissionRepository.findAll(pageable);
	}
	
}
