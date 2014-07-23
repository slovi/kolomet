package cz.kolomet.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoContainer;
import cz.kolomet.domain.PhotoContainerService;

public class AbstractController {
	
	public static final int DEFAULT_PAGE_SIZE = 25;
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Value("${img.rootdir}")
	protected String rootDir;
	
	@ModelAttribute("categoryPageSize")
	public int getCategoryPageSize() {
		return DEFAULT_PAGE_SIZE;
	}
	
	protected void savePhotos(final PhotoContainer photoContainer, final PhotoContainerService photoContainerService, List<CommonsMultipartFile> files) {
		if (files != null) {
			for (final CommonsMultipartFile content: files) {
	        	if (StringUtils.isNotEmpty(content.getOriginalFilename())) {
		        	final File dest = getDestFile(photoContainer.getId(), photoContainer.getPhotoType(), content);
		        	try {
		        		logger.info("Saving uploaded file to dest: " + dest);
						content.transferTo(dest);
						logger.info("Successfully save file: " + dest + " " + dest.exists());
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
		        	Photo photo = photoContainer.addPhoto(dest.getName(), content.getContentType());
		        	photoContainerService.savePhoto(photo, dest);
	        	}
	        }
		}
	}
	
	protected File getDestFile(Long id, String photoType, CommonsMultipartFile content) {
		File parent = new File(rootDir + "/" + photoType + "/"+ id);
		try {
			FileUtils.forceMkdir(parent);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		File dest = new File(parent, content.getOriginalFilename());
		return dest;
	}

}
