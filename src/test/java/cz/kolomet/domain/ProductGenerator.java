package cz.kolomet.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;

import cz.kolomet.domain.security.SecurityContextTestExecutionListener;
import cz.kolomet.service.ProductService;

@Configurable
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@TestExecutionListeners({
	SecurityContextTestExecutionListener.class, 
	DependencyInjectionTestExecutionListener.class, 
	DirtiesContextTestExecutionListener.class})
public class ProductGenerator {
	
	@Autowired
	private ProductDataOnDemand productData;
	
	@Autowired
	private ProductService productService;
	
	@Test
	public void generateData() {

		for (int i = 0; i < 40000; i++) {
			Product product = productData.getNewTransientProduct(1000 + i);
			productService.saveProduct(product);
		}
	}

}
