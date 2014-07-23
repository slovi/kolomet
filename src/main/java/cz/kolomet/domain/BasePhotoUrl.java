package cz.kolomet.domain;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.Size;

import org.apache.commons.io.FilenameUtils;

@MappedSuperclass
public abstract class BasePhotoUrl extends DomainEntity implements Photo {
	
	public static String ORIGINAL_IMG_SUFFIX = "_orig.jpg";
	public static String OVERVIEW_IMG_SUFFIX = "_over.jpg";
	public static String THUMBNAIL_IMG_SUFFIX = "_thumb.jpg";
	
    /**
     */
    @Size(max = 255)
    protected String fileName;
    
    /**
     */
    @Size(max = 30)
    @Column(updatable = false)
    protected String contentType;
    
    public String getPhotoUrl() {
    	return getPhotoUrlPrefix() + "/" + getParentContainerId() + "/" + FilenameUtils.getBaseName(fileName) + ORIGINAL_IMG_SUFFIX;
    }
    
    public String getThumbPhotoUrl() {
    	return getPhotoUrlPrefix() + "/" + getParentContainerId() + "/" + FilenameUtils.getBaseName(fileName) + THUMBNAIL_IMG_SUFFIX;
    }
    
    public String getOverPhotoUrl() {
    	return getPhotoUrlPrefix() + "/" + getParentContainerId() + "/" + FilenameUtils.getBaseName(fileName) + OVERVIEW_IMG_SUFFIX;
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
