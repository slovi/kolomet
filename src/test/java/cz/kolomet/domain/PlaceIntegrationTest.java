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
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.service.PlaceService;

@Configurable
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@TestExecutionListeners({
	SecurityContextTestExecutionListener.class, 
	DependencyInjectionTestExecutionListener.class, 
	DirtiesContextTestExecutionListener.class, 
	TransactionalTestExecutionListener.class})
public class PlaceIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    PlaceDataOnDemand dod;

	@Autowired
    PlaceService placeService;

	@Autowired
    PlaceRepository placeRepository;

	@Test
    public void testCountAllPlaces() {
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", dod.getRandomPlace());
        long count = placeService.countAllPlaces();
        Assert.assertTrue("Counter for 'Place' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindPlace() {
        Place obj = dod.getRandomPlace();
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Place' failed to provide an identifier", id);
        obj = placeService.findPlace(id);
        Assert.assertNotNull("Find method for 'Place' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Place' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllPlaces() {
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", dod.getRandomPlace());
        long count = placeService.countAllPlaces();
        Assert.assertTrue("Too expensive to perform a find all test for 'Place', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Place> result = placeService.findAllPlaces();
        Assert.assertNotNull("Find all method for 'Place' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Place' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindPlaceEntries() {
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", dod.getRandomPlace());
        long count = placeService.countAllPlaces();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Place> result = placeService.findPlaceEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Place' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Place' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        Place obj = dod.getRandomPlace();
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Place' failed to provide an identifier", id);
        obj = placeService.findPlace(id);
        Assert.assertNotNull("Find method for 'Place' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPlace(obj);
        Integer currentVersion = obj.getVersion();
        placeRepository.flush();
        Assert.assertTrue("Version for 'Place' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdatePlaceUpdate() {
        Place obj = dod.getRandomPlace();
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Place' failed to provide an identifier", id);
        obj = placeService.findPlace(id);
        boolean modified =  dod.modifyPlace(obj);
        Integer currentVersion = obj.getVersion();
        Place merged = (Place)placeService.updatePlace(obj);
        placeRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Place' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSavePlace() {
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", dod.getRandomPlace());
        Place obj = dod.getNewTransientPlace(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Place' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Place' identifier to be null", obj.getId());
        try {
            placeService.savePlace(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        placeRepository.flush();
        Assert.assertNotNull("Expected 'Place' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeletePlace() {
        Place obj = dod.getRandomPlace();
        Assert.assertNotNull("Data on demand for 'Place' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Place' failed to provide an identifier", id);
        obj = placeService.findPlace(id);
        placeService.deletePlace(obj);
        placeRepository.flush();
        Assert.assertNull("Failed to remove 'Place' with identifier '" + id + "'", placeService.findPlace(id));
    }
}
