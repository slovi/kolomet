package cz.kolomet.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import cz.kolomet.domain.ApplicationRole;

public interface ApplicationRoleService {
	
	public ApplicationRole findApplicationRole(String name);
	
	public Page<ApplicationRole> findApplicationRoleEntries(Pageable pageable);
	
	public List<ApplicationRole> findApplicationRoleEntries(Sort sort);
	

	public abstract long countAllApplicationRoles();


	public abstract void deleteApplicationRole(ApplicationRole applicationRole);


	public abstract ApplicationRole findApplicationRole(Long id);


	public abstract List<ApplicationRole> findAllApplicationRoles();


	public abstract List<ApplicationRole> findApplicationRoleEntries(int firstResult, int maxResults);


	public abstract void saveApplicationRole(ApplicationRole applicationRole);


	public abstract ApplicationRole updateApplicationRole(ApplicationRole applicationRole);

}
