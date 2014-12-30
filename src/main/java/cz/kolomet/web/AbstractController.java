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
import org.springframework.js.ajax.AjaxHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoContainer;
import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.domain.Product;
import cz.kolomet.dto.FileInfo;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.util.json.JsonSerializer;
import cz.kolomet.util.web.Regex;

public class AbstractController implements MessageSourceAware {

	public static final int DEFAULT_PAGE_SIZE = 15;
	
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

	@Value("${menu.google.link}")
	private String menuGoogleLink;
	
	@Value("${domain.static}")
	private String staticDomain;
	
	protected MessageSource messageSource;
	
	protected MessageSourceAccessor messageSourceAcessor;
	
	@Autowired
	protected ConversionService converionService;
	
	@Autowired
	protected AjaxHandler ajaxHandler;
	
	@Autowired
	protected JsonSerializer jsonSerializer;
	
	@ModelAttribute("pageTitleCode")
	public String getPageTitleCode() {
		return "page_title_default";
	}
	
	@ModelAttribute("pageTitleArgs")
	public Object[] getPageTitleArgs() {
		return new Object[0];
	}
	
	@ModelAttribute("pageDescriptionCode")
	public String getPageDescription() {
		return "page_description_default";
	}
	
	@ModelAttribute("pageDescriptionArgs")
	public Object[] getPageDescriptionArgs() {
		return new Object[0];
	}
	
	@ModelAttribute("pageKeywordsCode")
	public String getPageKeywords() {
		return "page_keywords_default";
	}
	
	@ModelAttribute("pageKeywordsArgs")
	public Object[] getPageKeywordsArgs() {
		return new Object[0];
	}
	
	@ModelAttribute("menuGoogleLink")
	public String getMenuGoogleLink() {
		return menuGoogleLink;
	}

	@ModelAttribute("currencyFormat")
	public String getCurrencyFormat() {
		return "";
	}
	
	@ModelAttribute("dateFormat")
	public String getDateFormat() {
		return "dd.MM.yyyy";
	}
	
	@ModelAttribute("dateTimeFormat")
	public String getDateTimeFormat() {
		return "dd.MM.yyyy HH:mm";
	}
	
	@ModelAttribute("regex")
	public Regex getRegex() {
		return new Regex();
	}
	
	@ModelAttribute("subContext")
	public String getSubContext(HttpServletRequest request) {
		return request.getServletPath();
	}
	
	@ModelAttribute("staticDomain")
	public String getStaticDomain(HttpServletRequest request) {
		if (request.getScheme().equals("http") && StringUtils.isNotBlank(staticDomain)) {
			return "http://" + staticDomain;
		} else {
			return "";
		}
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
	
	protected boolean isAjaxRequest(HttpServletRequest servletRequest) {
		return ajaxHandler.isAjaxRequest(servletRequest, null);
	}
	
	protected ApplicationUserDetails getActualUserDetails() {
		return ApplicationUserDetails.getActualApplicationUserDetails();
	}
	
	protected ApplicationUser getActualUser() {
		return ApplicationUserDetails.getActualApplicationUser();
	}
	
	protected void savePhotos(final PhotoContainer photoContainer, final PhotoContainerService photoContainerService, String sessionFolder, List<FileInfo> fileInfos) {
		
		if (fileInfos != null) {
			for (final FileInfo fileInfo: fileInfos) {
				if (fileInfo != null && fileInfo.isNew()) {
					if (StringUtils.isNotEmpty(fileInfo.getFileName())) {
						String fileName = fileInfo.getFileName();
						String contentType = fileInfo.getContentType();
						Photo photo = photoContainer.addPhoto(fileName, contentType);
						photoContainerService.savePhoto(photo);
						File uploadedFile = new File(new File(getTempDir(), sessionFolder), fileInfo.getFileName());
						photoContainerService.createImages(uploadedFile, getDestFolder(photoContainer.getId(), photoContainer.getPhotoType()));
					}
				}
			}
		}
	}
	
	protected void saveCopied(final Product photoContainer, final PhotoContainerService photoContainerService, String sessionFolder, List<FileInfo> fileInfos) {
		
		if (fileInfos != null) {
			for (final FileInfo fileInfo: fileInfos) {
				if (fileInfo != null && fileInfo.isNew()) {
					if (StringUtils.isNotEmpty(fileInfo.getFileName())) {
						if (photoContainer.isPhotoCopied(fileInfo)) {
							String fileName = fileInfo.getFileName();
							String contentType = fileInfo.getContentType();
							Photo photo = photoContainer.addPhoto(fileName, contentType);
							photoContainerService.savePhoto(photo);
							photoContainer.copyPhotoUrlFiles(fileInfo.getFileName(), getTempDir(sessionFolder), getDestFolder(photoContainer));
						} else {
							String fileName = fileInfo.getFileName();
							String contentType = fileInfo.getContentType();
							Photo photo = photoContainer.addPhoto(fileName, contentType);
							photoContainerService.savePhoto(photo);
							File uploadedFile = new File(new File(getTempDir(), sessionFolder), fileInfo.getFileName());
							photoContainerService.createImages(uploadedFile, getDestFolder(photoContainer.getId(), photoContainer.getPhotoType()));
						}
						
					}
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
			photoContainerService.createThumbnail(dest);
			logger.debug("Successfully save file: " + dest + " " + dest.exists());
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	protected File getTempDir() {
		return new File(rootDir, tempDir);
	}
	
	protected File getTempDir(String sessionId) {
		return new File(getTempDir(), sessionId);
	}
	
	protected File getTempDir(HttpServletRequest httpServletRequest) {
		return getTempDir(httpServletRequest.getSession().getId());
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

	protected File getDestFolder(PhotoContainer photoContainer) {
		return getDestFolder(photoContainer.getId(), photoContainer.getPhotoType());
	}
	
	protected File getDestFile(Long id, String photoType, String fileName) {
		return new File(getDestFolder(id, photoType), fileName);
	}
	
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
		this.messageSourceAcessor = new MessageSourceAccessor(messageSource);
	}

}
