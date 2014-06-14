package cz.kolomet.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.ApplicationRole;

@RooService(domainTypes = { cz.kolomet.domain.ApplicationRole.class })
public interface ApplicationRoleService {
	
	public Page<ApplicationRole> findApplicationRoleEntries(Pageable pageable);
	
	public List<ApplicationRole> findApplicationRoleEntries(Sort sort);
	
}
