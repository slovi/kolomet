package cz.kolomet.domain;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.io.FilenameUtils;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"product", "createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"}, appendSuper = false)
@RooSerializable
public class PhotoUrl extends DomainEntity implements Cloneable {
	
	public static final String PHOTO_URL_PREFIX = "product";
	public static String ORIGINAL_IMG_SUFFIX = "_orig.jpg";
	public static String OVERVIEW_IMG_SUFFIX = "_over.jpg";
	public static String THUMBNAIL_IMG_SUFFIX = "_thumb.jpg";
	
    /**
     */
    @Size(max = 255)
    private String fileName;
    
    /**
     */
    @Size(max = 30)
    @Column(updatable = false)
    private String contentType;
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRODUCT_ID")
    private Product product;
    
    public String getPhotoUrl() {
    	return PHOTO_URL_PREFIX + "/" + getPhotoId() + "/" + FilenameUtils.getBaseName(fileName) + ORIGINAL_IMG_SUFFIX;
    }
    
    public String getThumbPhotoUrl() {
    	return PHOTO_URL_PREFIX + "/" + getPhotoId() + "/" + FilenameUtils.getBaseName(fileName) + THUMBNAIL_IMG_SUFFIX;
    }
    
    public String getOverPhotoUrl() {
    	return PHOTO_URL_PREFIX + "/" + getPhotoId() + "/" + FilenameUtils.getBaseName(fileName) + OVERVIEW_IMG_SUFFIX;
    }
    
    private Long getPhotoId() {
    	Long id = product.getId();
    	if (id == null && product.getCopiedFrom() != null) {
    		id = product.getCopiedFrom().getId();
    	}
    	if (id == null) {
    		throw new IllegalStateException("Cannot get any id for photo url link creation (product: " + product + ", photo: " + this + ")");
    	}
    	return id;
    }
    
    @Transient
    private List<CommonsMultipartFile> contents;
    
    public PhotoUrl copy() {
    	try {
			return (PhotoUrl) clone();
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
    }
    
    @Override
    public Object clone() throws CloneNotSupportedException {
    	PhotoUrl photoUrl = (PhotoUrl) super.clone();
    	photoUrl.setBaseParamsAsNull();
    	photoUrl.setProduct(null);
    	return photoUrl;
    }
    
}
