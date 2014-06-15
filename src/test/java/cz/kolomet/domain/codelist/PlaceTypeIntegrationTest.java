package cz.kolomet.domain.codelist;
import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;

import cz.kolomet.domain.security.SecurityContextTestExecutionListener;

@RooIntegrationTest(entity = PlaceType.class)
@TestExecutionListeners({
	SecurityContextTestExecutionListener.class, 
	DependencyInjectionTestExecutionListener.class, 
	DirtiesContextTestExecutionListener.class, 
	TransactionalTestExecutionListener.class})
public class PlaceTypeIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
