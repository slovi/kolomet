// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.ApplicationPermissionDataOnDemand;
import cz.kolomet.domain.ApplicationPermissionIntegrationTest;
import cz.kolomet.repository.ApplicationPermissionRepository;
import cz.kolomet.service.ApplicationPermissionService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationPermissionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ApplicationPermissionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ApplicationPermissionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ApplicationPermissionIntegrationTest: @Transactional;
    
    @Autowired
    ApplicationPermissionDataOnDemand ApplicationPermissionIntegrationTest.dod;
    
    @Autowired
    ApplicationPermissionService ApplicationPermissionIntegrationTest.applicationPermissionService;
    
    @Autowired
    ApplicationPermissionRepository ApplicationPermissionIntegrationTest.applicationPermissionRepository;
    
    @Test
    public void ApplicationPermissionIntegrationTest.testCountAllApplicationPermissions() {
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", dod.getRandomApplicationPermission());
        long count = applicationPermissionService.countAllApplicationPermissions();
        Assert.assertTrue("Counter for 'ApplicationPermission' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ApplicationPermissionIntegrationTest.testFindApplicationPermission() {
        ApplicationPermission obj = dod.getRandomApplicationPermission();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to provide an identifier", id);
        obj = applicationPermissionService.findApplicationPermission(id);
        Assert.assertNotNull("Find method for 'ApplicationPermission' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ApplicationPermission' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ApplicationPermissionIntegrationTest.testFindAllApplicationPermissions() {
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", dod.getRandomApplicationPermission());
        long count = applicationPermissionService.countAllApplicationPermissions();
        Assert.assertTrue("Too expensive to perform a find all test for 'ApplicationPermission', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ApplicationPermission> result = applicationPermissionService.findAllApplicationPermissions();
        Assert.assertNotNull("Find all method for 'ApplicationPermission' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ApplicationPermission' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ApplicationPermissionIntegrationTest.testFindApplicationPermissionEntries() {
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", dod.getRandomApplicationPermission());
        long count = applicationPermissionService.countAllApplicationPermissions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ApplicationPermission> result = applicationPermissionService.findApplicationPermissionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ApplicationPermission' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ApplicationPermission' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ApplicationPermissionIntegrationTest.testFlush() {
        ApplicationPermission obj = dod.getRandomApplicationPermission();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to provide an identifier", id);
        obj = applicationPermissionService.findApplicationPermission(id);
        Assert.assertNotNull("Find method for 'ApplicationPermission' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyApplicationPermission(obj);
        Integer currentVersion = obj.getVersion();
        applicationPermissionRepository.flush();
        Assert.assertTrue("Version for 'ApplicationPermission' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ApplicationPermissionIntegrationTest.testUpdateApplicationPermissionUpdate() {
        ApplicationPermission obj = dod.getRandomApplicationPermission();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to provide an identifier", id);
        obj = applicationPermissionService.findApplicationPermission(id);
        boolean modified =  dod.modifyApplicationPermission(obj);
        Integer currentVersion = obj.getVersion();
        ApplicationPermission merged = (ApplicationPermission)applicationPermissionService.updateApplicationPermission(obj);
        applicationPermissionRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ApplicationPermission' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ApplicationPermissionIntegrationTest.testSaveApplicationPermission() {
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", dod.getRandomApplicationPermission());
        ApplicationPermission obj = dod.getNewTransientApplicationPermission(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ApplicationPermission' identifier to be null", obj.getId());
        applicationPermissionService.saveApplicationPermission(obj);
        applicationPermissionRepository.flush();
        Assert.assertNotNull("Expected 'ApplicationPermission' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ApplicationPermissionIntegrationTest.testDeleteApplicationPermission() {
        ApplicationPermission obj = dod.getRandomApplicationPermission();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationPermission' failed to provide an identifier", id);
        obj = applicationPermissionService.findApplicationPermission(id);
        applicationPermissionService.deleteApplicationPermission(obj);
        applicationPermissionRepository.flush();
        Assert.assertNull("Failed to remove 'ApplicationPermission' with identifier '" + id + "'", applicationPermissionService.findApplicationPermission(id));
    }
    
}