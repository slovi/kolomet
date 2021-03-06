package cz.kolomet.domain.codelist;
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
import cz.kolomet.repository.PlaceTypeRepository;
import cz.kolomet.service.PlaceTypeService;

@Configurable
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@TestExecutionListeners({
	SecurityContextTestExecutionListener.class, 
	DependencyInjectionTestExecutionListener.class, 
	DirtiesContextTestExecutionListener.class, 
	TransactionalTestExecutionListener.class})
public class PlaceTypeIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    PlaceTypeDataOnDemand dod;

	@Autowired
    PlaceTypeService placeTypeService;

	@Autowired
    PlaceTypeRepository placeTypeRepository;

	@Test
    public void testCountAllPlaceTypes() {
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", dod.getRandomPlaceType());
        long count = placeTypeService.countAllPlaceTypes();
        Assert.assertTrue("Counter for 'PlaceType' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindPlaceType() {
        PlaceType obj = dod.getRandomPlaceType();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to provide an identifier", id);
        obj = placeTypeService.findPlaceType(id);
        Assert.assertNotNull("Find method for 'PlaceType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PlaceType' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllPlaceTypes() {
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", dod.getRandomPlaceType());
        long count = placeTypeService.countAllPlaceTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'PlaceType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PlaceType> result = placeTypeService.findAllPlaceTypes();
        Assert.assertNotNull("Find all method for 'PlaceType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PlaceType' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindPlaceTypeEntries() {
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", dod.getRandomPlaceType());
        long count = placeTypeService.countAllPlaceTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PlaceType> result = placeTypeService.findPlaceTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PlaceType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PlaceType' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        PlaceType obj = dod.getRandomPlaceType();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to provide an identifier", id);
        obj = placeTypeService.findPlaceType(id);
        Assert.assertNotNull("Find method for 'PlaceType' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPlaceType(obj);
        Integer currentVersion = obj.getVersion();
        placeTypeRepository.flush();
        Assert.assertTrue("Version for 'PlaceType' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdatePlaceTypeUpdate() {
        PlaceType obj = dod.getRandomPlaceType();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to provide an identifier", id);
        obj = placeTypeService.findPlaceType(id);
        boolean modified =  dod.modifyPlaceType(obj);
        Integer currentVersion = obj.getVersion();
        PlaceType merged = (PlaceType)placeTypeService.updatePlaceType(obj);
        placeTypeRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'PlaceType' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSavePlaceType() {
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", dod.getRandomPlaceType());
        PlaceType obj = dod.getNewTransientPlaceType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'PlaceType' identifier to be null", obj.getId());
        try {
            placeTypeService.savePlaceType(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        placeTypeRepository.flush();
        Assert.assertNotNull("Expected 'PlaceType' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeletePlaceType() {
        PlaceType obj = dod.getRandomPlaceType();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PlaceType' failed to provide an identifier", id);
        obj = placeTypeService.findPlaceType(id);
        placeTypeService.deletePlaceType(obj);
        placeTypeRepository.flush();
        Assert.assertNull("Failed to remove 'PlaceType' with identifier '" + id + "'", placeTypeService.findPlaceType(id));
    }
}
