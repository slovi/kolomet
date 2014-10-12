package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.repository.ApplicationRoleRepository;
import cz.kolomet.service.ApplicationRoleService;

@Service
@Transactional
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
	

	@Autowired
    ApplicationRoleRepository applicationRoleRepository;

	public long countAllApplicationRoles() {
        return applicationRoleRepository.count();
    }

	public void deleteApplicationRole(ApplicationRole applicationRole) {
        applicationRoleRepository.delete(applicationRole);
    }

	public ApplicationRole findApplicationRole(Long id) {
        return applicationRoleRepository.findOne(id);
    }

	public List<ApplicationRole> findAllApplicationRoles() {
        return applicationRoleRepository.findAll();
    }

	public List<ApplicationRole> findApplicationRoleEntries(int firstResult, int maxResults) {
        return applicationRoleRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveApplicationRole(ApplicationRole applicationRole) {
        applicationRoleRepository.save(applicationRole);
    }

	public ApplicationRole updateApplicationRole(ApplicationRole applicationRole) {
        return applicationRoleRepository.save(applicationRole);
    }
}
