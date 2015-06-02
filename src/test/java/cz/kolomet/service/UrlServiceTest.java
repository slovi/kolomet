package cz.kolomet.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cz.kolomet.service.impl.UrlServiceImpl;
import cz.kolomet.util.json.JsonSerializer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:META-INF/spring/applicationContext-json.xml")
public class UrlServiceTest {
	
	@Autowired
	private JsonSerializer jsonSerializer;
	
	@Test
	public void testShortUrl() {
		
		UrlServiceImpl urlService = new UrlServiceImpl();
		urlService.setSerializer(jsonSerializer);
		
		assertNotNull(urlService.shortUrl("http://www.google.com"));
	}

}
