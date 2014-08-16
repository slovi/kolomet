package cz.kolomet.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoContainer;
import cz.kolomet.domain.PhotoContainerService;

public class AbstractController implements MessageSourceAware {
	
	private static final String FILENAME_SEPARATOR = "__;__";

	public static final int DEFAULT_PAGE_SIZE = 25;
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Value("${img.rootdir}")
	protected String rootDir;
	
	@Value("${img.tempdir}")
	protected String tempDir;
	
	@Value("${build.version}")
	protected String version;
	
	@Value("${build.timestamp}")
	protected String buildTimestamp;
	
	protected MessageSource messageSource;
	
	protected MessageSourceAccessor messageSourceAcessor;
	
	@ModelAttribute("version")
	public String getVersion() {
		return version;
	}
	
	@ModelAttribute("buildTimestamp")
	public String getBuildTimestamp() {
		return buildTimestamp;
	}
	
	@ModelAttribute("categoryPageSize")
	public int getCategoryPageSize() {
		return DEFAULT_PAGE_SIZE;
	}
	
	protected void saveFile(final PhotoContainerService photoContainerService, MultipartFile file, String folder) {
		File parent = new File(getTempDir(), folder);
		try {
			FileUtils.forceMkdir(parent);
			File dest = new File(parent, file.getOriginalFilename());
			logger.debug("Saving uploaded file to dest: " + dest);
			file.transferTo(dest);
			photoContainerService.resizePhoto(dest);
			logger.debug("Successfully save file: " + dest + " " + dest.exists());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	protected void savePhotos(final PhotoContainer photoContainer, final PhotoContainerService photoContainerService, String folder, List<String> fileNamesAndContentTypes) {
		
		File uploadedFileParent = new File(getTempDir(), folder);
		
		for (final String fileNameAndContentType: fileNamesAndContentTypes) {
			if (StringUtils.isNotEmpty(fileNameAndContentType)) {
				
				String fileName = resolveFileName(fileNameAndContentType);
				String contentType = resolveContentType(fileNameAndContentType);
				Photo photo = photoContainer.addPhoto(fileName, contentType);
				photoContainerService.savePhoto(photo);
			}
		}
		
		copyFiles(uploadedFileParent, getDestFolder(photoContainer.getId(), photoContainer.getPhotoType()));
	}
	
	protected void savePhotos(final PhotoContainer photoContainer, final PhotoContainerService photoContainerService, List<CommonsMultipartFile> files) {
		if (files != null) {
			for (final CommonsMultipartFile content: files) {
				if (StringUtils.isNotEmpty(content.getOriginalFilename())) {
					final File dest = getDestFile(photoContainer.getId(), photoContainer.getPhotoType(), content.getOriginalFilename());
					try {
						logger.debug("Saving uploaded file to dest: " + dest);
						content.transferTo(dest);
						logger.debug("Successfully save file: " + dest + " " + dest.exists());
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
					Photo photo = photoContainer.addPhoto(dest.getName(), content.getContentType());
					photoContainerService.savePhoto(photo);
					photoContainerService.resizePhoto(dest);
				}
			}
		}
	}
	
	private File getTempDir() {
		return new File(rootDir, tempDir);
	}

	private String resolveContentType(final String fileNameAndContentType) {
		int index = fileNameAndContentType.indexOf(FILENAME_SEPARATOR);
		return fileNameAndContentType.substring(index + FILENAME_SEPARATOR.length());
	}

	private String resolveFileName(final String fileNameAndContentType) {
		int index = fileNameAndContentType.indexOf(FILENAME_SEPARATOR);
		return fileNameAndContentType.substring(0, index);
	}

	private void copyFiles(File parentFolder, final File dest) {

		File[] files = parentFolder.listFiles();
		for (File file: files) {
			try {
				FileUtils.copyFileToDirectory(file, dest);
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	protected File getDestFolder(Long id, String photoType) {
		File parent = new File(rootDir + "/" + photoType + "/"+ id);
		try {
			FileUtils.forceMkdir(parent);
			return parent;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	protected File getDestFile(Long id, String photoType, String fileName) {
		return new File(getDestFolder(id, photoType), fileName);
	}
	
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
		this.messageSourceAcessor = new MessageSourceAccessor(messageSource);
	}

}
