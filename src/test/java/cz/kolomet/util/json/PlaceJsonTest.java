package cz.kolomet.util.json;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cz.kolomet.dto.PlaceDto;
import cz.kolomet.dto.PlaceFilterDto;
import cz.kolomet.service.PlaceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:/META-INF/spring/applicationContext*.xml"})
public class PlaceJsonTest {
	
	@Autowired
	private JsonSerializer jsonSerializer;
	
	@Autowired
	private PlaceService placeService;
	
	@Test
	@Transactional
	public void testMarshall() {
		
		List<PlaceDto> placeCollection = placeService.findPlaceDtos(new PlaceFilterDto(), null);
		
		System.out.println(jsonSerializer.toJsonArray(placeCollection));
	}

}
