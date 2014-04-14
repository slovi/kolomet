package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.ApplicationPermission;

@RooService(domainTypes = { cz.kolomet.domain.ApplicationPermission.class })
public interface ApplicationPermissionService {
	
	public Page<ApplicationPermission> findApplicationPermissionEntries(Pageable pageable);
	
}
