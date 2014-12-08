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

import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.service.ApplicationUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@Configurable
@TestExecutionListeners({
	DependencyInjectionTestExecutionListener.class, 
	DirtiesContextTestExecutionListener.class, 
	TransactionalTestExecutionListener.class})
public class ApplicationUserIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    ApplicationUserDataOnDemand dod;

	@Autowired
    ApplicationUserService applicationUserService;

	@Autowired
    ApplicationUserRepository applicationUserRepository;

	@Test
    public void testCountAllApplicationUsers() {
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", dod.getRandomApplicationUser());
        long count = applicationUserService.countAllApplicationUsers();
        Assert.assertTrue("Counter for 'ApplicationUser' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindApplicationUser() {
        ApplicationUser obj = dod.getRandomApplicationUser();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to provide an identifier", id);
        obj = applicationUserService.findApplicationUser(id);
        Assert.assertNotNull("Find method for 'ApplicationUser' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ApplicationUser' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllApplicationUsers() {
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", dod.getRandomApplicationUser());
        long count = applicationUserService.countAllApplicationUsers();
        Assert.assertTrue("Too expensive to perform a find all test for 'ApplicationUser', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ApplicationUser> result = applicationUserService.findAllApplicationUsers();
        Assert.assertNotNull("Find all method for 'ApplicationUser' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ApplicationUser' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindApplicationUserEntries() {
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", dod.getRandomApplicationUser());
        long count = applicationUserService.countAllApplicationUsers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ApplicationUser> result = applicationUserService.findApplicationUserEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ApplicationUser' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ApplicationUser' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        ApplicationUser obj = dod.getRandomApplicationUser();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to provide an identifier", id);
        obj = applicationUserService.findApplicationUser(id);
        Assert.assertNotNull("Find method for 'ApplicationUser' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyApplicationUser(obj);
        Integer currentVersion = obj.getVersion();
        applicationUserRepository.flush();
        Assert.assertTrue("Version for 'ApplicationUser' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdateApplicationUserUpdate() {
        ApplicationUser obj = dod.getRandomApplicationUser();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to provide an identifier", id);
        obj = applicationUserService.findApplicationUser(id);
        boolean modified =  dod.modifyApplicationUser(obj);
        Integer currentVersion = obj.getVersion();
        ApplicationUser merged = (ApplicationUser)applicationUserService.updateApplicationUser(obj, null);
        applicationUserRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ApplicationUser' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSaveApplicationUser() {
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", dod.getRandomApplicationUser());
        ApplicationUser obj = dod.getNewTransientApplicationUser(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ApplicationUser' identifier to be null", obj.getId());
        try {
            applicationUserService.saveApplicationUser(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        applicationUserRepository.flush();
        Assert.assertNotNull("Expected 'ApplicationUser' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteApplicationUser() {
        ApplicationUser obj = dod.getRandomApplicationUser();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ApplicationUser' failed to provide an identifier", id);
        obj = applicationUserService.findApplicationUser(id);
        applicationUserService.deleteApplicationUser(obj);
        applicationUserRepository.flush();
        Assert.assertNull("Failed to remove 'ApplicationUser' with identifier '" + id + "'", applicationUserService.findApplicationUser(id));
    }
}
