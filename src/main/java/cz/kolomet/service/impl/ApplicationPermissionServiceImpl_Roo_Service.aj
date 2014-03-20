// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.repository.ApplicationPermissionRepository;
import cz.kolomet.service.impl.ApplicationPermissionServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationPermissionServiceImpl_Roo_Service {
    
    declare @type: ApplicationPermissionServiceImpl: @Service;
    
    declare @type: ApplicationPermissionServiceImpl: @Transactional;
    
    @Autowired
    ApplicationPermissionRepository ApplicationPermissionServiceImpl.applicationPermissionRepository;
    
    public long ApplicationPermissionServiceImpl.countAllApplicationPermissions() {
        return applicationPermissionRepository.count();
    }
    
    public void ApplicationPermissionServiceImpl.deleteApplicationPermission(ApplicationPermission applicationPermission) {
        applicationPermissionRepository.delete(applicationPermission);
    }
    
    public ApplicationPermission ApplicationPermissionServiceImpl.findApplicationPermission(Long id) {
        return applicationPermissionRepository.findOne(id);
    }
    
    public List<ApplicationPermission> ApplicationPermissionServiceImpl.findAllApplicationPermissions() {
        return applicationPermissionRepository.findAll();
    }
    
    public List<ApplicationPermission> ApplicationPermissionServiceImpl.findApplicationPermissionEntries(int firstResult, int maxResults) {
        return applicationPermissionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ApplicationPermissionServiceImpl.saveApplicationPermission(ApplicationPermission applicationPermission) {
        applicationPermissionRepository.save(applicationPermission);
    }
    
    public ApplicationPermission ApplicationPermissionServiceImpl.updateApplicationPermission(ApplicationPermission applicationPermission) {
        return applicationPermissionRepository.save(applicationPermission);
    }
    
}