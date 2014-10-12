package cz.kolomet.domain;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.security.SecurityContextTestExecutionListener;
import cz.kolomet.repository.ApplicationRoleRepository;
import cz.kolomet.service.ApplicationRoleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@Configurable
@TestExecutionListeners({
	SecurityContextTestExecutionListener.class, 
	DependencyInjectionTestExecutionListener.class, 
	DirtiesContextTestExecutionListener.class, 
	TransactionalTestExecutionListener.class})
public class ApplicationRoleIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    ApplicationRoleDataOnDemand dod;

	@Autowired
    ApplicationRoleService applicationRoleService;

	@Autowired
    ApplicationRoleRepository applicationRoleRepository;

	@Test
    public void testCountAllApplicationRoles() {
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", dod.getRandomApplicationRole());
        long count = applicationRoleService.countAllApplicationRoles();
        Assert.assertTrue("Counter for 'ApplicationRole' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindApplicationRole() {
        ApplicationRole obj = dod.getRandomApplicationRole();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to provide an identifier", id);
        obj = applicationRoleService.findApplicationRole(id);
        Assert.assertNotNull("Find method for 'ApplicationRole' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ApplicationRole' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllApplicationRoles() {
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", dod.getRandomApplicationRole());
        long count = applicationRoleService.countAllApplicationRoles();
        Assert.assertTrue("Too expensive to perform a find all test for 'ApplicationRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ApplicationRole> result = applicationRoleService.findAllApplicationRoles();
        Assert.assertNotNull("Find all method for 'ApplicationRole' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ApplicationRole' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindApplicationRoleEntries() {
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", dod.getRandomApplicationRole());
        long count = applicationRoleService.countAllApplicationRoles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ApplicationRole> result = applicationRoleService.findApplicationRoleEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ApplicationRole' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ApplicationRole' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        ApplicationRole obj = dod.getRandomApplicationRole();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to provide an identifier", id);
        obj = applicationRoleService.findApplicationRole(id);
        Assert.assertNotNull("Find method for 'ApplicationRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyApplicationRole(obj);
        Integer currentVersion = obj.getVersion();
        applicationRoleRepository.flush();
        Assert.assertTrue("Version for 'ApplicationRole' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdateApplicationRoleUpdate() {
        ApplicationRole obj = dod.getRandomApplicationRole();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to provide an identifier", id);
        obj = applicationRoleService.findApplicationRole(id);
        boolean modified =  dod.modifyApplicationRole(obj);
        Integer currentVersion = obj.getVersion();
        ApplicationRole merged = (ApplicationRole)applicationRoleService.updateApplicationRole(obj);
        applicationRoleRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ApplicationRole' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSaveApplicationRole() {
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", dod.getRandomApplicationRole());
        ApplicationRole obj = dod.getNewTransientApplicationRole(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ApplicationRole' identifier to be null", obj.getId());
        try {
            applicationRoleService.saveApplicationRole(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        applicationRoleRepository.flush();
        Assert.assertNotNull("Expected 'ApplicationRole' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteApplicationRole() {
        ApplicationRole obj = dod.getRandomApplicationRole();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationRole' failed to provide an identifier", id);
        obj = applicationRoleService.findApplicationRole(id);
        applicationRoleService.deleteApplicationRole(obj);
        applicationRoleRepository.flush();
        Assert.assertNull("Failed to remove 'ApplicationRole' with identifier '" + id + "'", applicationRoleService.findApplicationRole(id));
    }
}
