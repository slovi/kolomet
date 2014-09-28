package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.service.ApplicationRoleService;

public class ApplicationRoleServiceImpl implements ApplicationRoleService {
	
	public ApplicationRole findApplicationRole(String name) {
		return applicationRoleRepository.findByRoleName(name);
	}
	
	public Page<ApplicationRole> findApplicationRoleEntries(Pageable pageable) {
		return applicationRoleRepository.findAll(pageable);
	}
	
	public List<ApplicationRole> findApplicationRoleEntries(Sort sort) {
		return applicationRoleRepository.findAll(sort);
	}
	
}
