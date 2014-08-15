package cz.kolomet.domain;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.Size;

import org.apache.commons.io.FilenameUtils;

@MappedSuperclass
public abstract class BasePhotoUrl extends DomainEntity implements Photo {
	
	public static String ORIGINAL_IMG_SUFFIX = "_orig";
	public static String OVERVIEW_IMG_SUFFIX = "_over";
	public static String THUMBNAIL_IMG_SUFFIX = "_thumb";
	
    /**
     */
    @Size(max = 255)
    protected String fileName;
    
    /**
     */
    @Size(max = 30)
    @Column(updatable = false)
    protected String contentType;
    
    public static String getPhotoUrlFileName(String fileName, String suffix) {
    	return FilenameUtils.getBaseName(fileName) + suffix + FilenameUtils.getExtension(fileName);
    }
    
    public static String getPhotoUrl(String baseUrl, String fileName, String suffix) {
    	return baseUrl + "/" + getPhotoUrlFileName(fileName, suffix);
    }
    
    public String getPhotoUrl(String suffix) {
    	return getPhotoUrl(getPhotoUrlPrefix() + "/" + getParentContainerId(), fileName, suffix);
    }
    
    public String getPhotoUrl() {
    	return getPhotoUrl(ORIGINAL_IMG_SUFFIX);
    }
    
    public String getThumbPhotoUrl() {
    	return getPhotoUrl(THUMBNAIL_IMG_SUFFIX);
    }
    
    public String getOverPhotoUrl() {
    	return getPhotoUrl(OVERVIEW_IMG_SUFFIX);
    }
    
    protected abstract String getPhotoUrlPrefix();
    
    protected abstract Long getParentContainerId();

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
    
}
