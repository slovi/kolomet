package cz.kolomet.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.core.convert.ConversionService;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.BasePhoto;
import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoContainer;
import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.domain.PhotoContainerService.ResizeInfo;
import cz.kolomet.dto.FileInfo;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.util.web.Regex;

public class AbstractController implements MessageSourceAware {

	public static final int DEFAULT_PAGE_SIZE = 25;
	
	public static final int DEFAULT_MAX_ATTEMPT_COUNT = 10;
	
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
	
	@Autowired
	protected ConversionService converionService;

	private int maxAttemptCount = DEFAULT_MAX_ATTEMPT_COUNT;
	
	@ModelAttribute("regex")
	public Regex getRegex() {
		return new Regex();
	}
	
	@ModelAttribute("subContext")
	public String getSubContext(HttpServletRequest request) {
		return request.getServletPath();
	}
	
	public boolean isTour(HttpServletRequest request) {
		return getSubContext(request).equals("/tour");
	}
	
	public boolean isStore(HttpServletRequest request) {
		return getSubContext(request).equals("/store");
	}
	
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
	
	protected ApplicationUserDetails getActualUserDetails() {
		return ApplicationUserDetails.getActualApplicationUserDetails();
	}
	
	protected ApplicationUser getActualUser() {
		return ApplicationUserDetails.getActualApplicationUser();
	}
	
	protected void savePhotos(final PhotoContainer photoContainer, final PhotoContainerService photoContainerService, String folder) {
		
		File uploadedFileParent = new File(getTempDir(), folder);
		
		for (final Photo photo: photoContainer.getPhotos()) {
			if (photo.isNew()) {
				String fileName = photo.getFileName();
				photoContainerService.savePhoto(photo);
				movePhotos(photoContainer, photoContainerService, uploadedFileParent, fileName);
			}
		}
	}
	
	protected void savePhotos(final PhotoContainer photoContainer, final PhotoContainerService photoContainerService, String folder, List<FileInfo> fileInfos) {
		
		File uploadedFileParent = new File(getTempDir(), folder);

		for (final FileInfo fileInfo: fileInfos) {
			if (fileInfo != null && fileInfo.isNew()) {
				if (StringUtils.isNotEmpty(fileInfo.getFileName())) {
					String fileName = fileInfo.getFileName();
					String contentType = fileInfo.getContentType();
					Photo photo = photoContainer.addPhoto(fileName, contentType);
					photoContainerService.savePhoto(photo);
					movePhotos(photoContainer, photoContainerService, uploadedFileParent, fileName);
				}
			}
		}
	}
	
	protected void saveFile(final PhotoContainerService photoContainerService, MultipartFile file, String folder) {
		File parent = new File(getTempDir(), folder);
		try {
			FileUtils.forceMkdir(parent);
			File dest = new File(parent, file.getOriginalFilename());
			logger.debug("Saving uploaded file from (" + file.getOriginalFilename() + ") to dest (" + dest.getAbsolutePath() + ")");
			file.transferTo(dest);
			photoContainerService.resizePhoto(dest);
			logger.debug("Successfully save file: " + dest + " " + dest.exists());
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	private File getTempDir() {
		return new File(rootDir, tempDir);
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
	
	// TODO move to new class
	private void movePhotos(final PhotoContainer photoContainer, final PhotoContainerService photoContainerService, File uploadedFileParent, String fileName) {
		for (ResizeInfo resizeInfo: photoContainerService.getResizeInfos()) {
			File sourceFile = new File(uploadedFileParent, BasePhoto.getPhotoUrlFileName(fileName, resizeInfo.getSuffix()));
			tryToMoveFile(photoContainer, fileName, resizeInfo, sourceFile, 0);
		}
	}

	// TODO move to new class
	private void tryToMoveFile(final PhotoContainer photoContainer, String fileName, ResizeInfo resizeInfo, File sourceFile, int attemptCount) {
		
		if (attemptCount >= maxAttemptCount) {
			logger.warn("Cannot move file (" + sourceFile.getAbsolutePath() + ") to target file (" + fileName + ")");
			return;
		}
		if (sourceFile.exists()) {
			File targetFile = new File(getDestFolder(photoContainer.getId(), photoContainer.getPhotoType()), BasePhoto.getPhotoUrlFileName(fileName, resizeInfo.getSuffix()));
			moveFile(sourceFile, targetFile, true);
		} else {
			waitForImageResize();
			tryToMoveFile(photoContainer, fileName, resizeInfo, sourceFile, ++attemptCount);
		}
	}
	
	// TODO move to new class
	private void waitForImageResize() {
		try {
			Thread.sleep(1000l);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	// TODO move to new class
	private void moveFile(File sourceFile, File targetFile, boolean replaceExisting) {
		try {
			if (replaceExisting && targetFile.exists()) {
				FileUtils.forceDelete(targetFile);
			}
			FileUtils.moveFile(sourceFile, targetFile);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
		this.messageSourceAcessor = new MessageSourceAccessor(messageSource);
	}

}
