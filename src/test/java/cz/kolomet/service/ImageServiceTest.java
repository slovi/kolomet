package cz.kolomet.service;

import static org.junit.Assert.assertTrue;

import java.awt.Dimension;
import java.io.File;

import org.junit.Test;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import cz.kolomet.service.impl.ImageServiceImpl;

public class ImageServiceTest {

	@Test
	public void testResizeAndSave() throws Exception {
		
		Resource image = new ClassPathResource("Koala.jpg", this.getClass());
		
		ImageService imageService = new ImageServiceImpl();
		File source = image.getFile();
		File target = new File(image.getFile().getParent(), "Koala_resized.jpg");
		imageService.resizeAndSave(source, target, new Dimension(508, 338));
		
		assertTrue(target.exists());
		
	}
	
}
