package cz.kolomet.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.repository.ApplicationPermissionRepository;
import cz.kolomet.service.ApplicationPermissionService;

@Service
@Transactional
public class ApplicationPermissionServiceImpl implements ApplicationPermissionService {
	
	public Page<ApplicationPermission> findApplicationPermissionEntries(Pageable pageable) {
		return applicationPermissionRepository.findAll(pageable);
	}
	

	@Autowired
    ApplicationPermissionRepository applicationPermissionRepository;

	public long countAllApplicationPermissions() {
        return applicationPermissionRepository.count();
    }

	public void deleteApplicationPermission(ApplicationPermission applicationPermission) {
        applicationPermissionRepository.delete(applicationPermission);
    }

	public ApplicationPermission findApplicationPermission(Long id) {
        return applicationPermissionRepository.findOne(id);
    }

	public List<ApplicationPermission> findAllApplicationPermissions() {
        return applicationPermissionRepository.findAll();
    }

	public List<ApplicationPermission> findApplicationPermissionEntries(int firstResult, int maxResults) {
        return applicationPermissionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveApplicationPermission(ApplicationPermission applicationPermission) {
        applicationPermissionRepository.save(applicationPermission);
    }

	public ApplicationPermission updateApplicationPermission(ApplicationPermission applicationPermission) {
        return applicationPermissionRepository.save(applicationPermission);
    }
}
