package cz.kolomet.domain;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.io.FilenameUtils;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
public class PhotoUrl extends DomainEntity {
	
	public static String ORIGINAL_IMG_SUFFIX = "_orig.jpg";
	public static String THUMBNAIL_IMG_SUFFIX = "_thumb.jpg";
	
    /**
     */
    @Size(max = 20)
    private String fileName;
    
    /**
     */
    @Size(max = 20)
    private String contentType;
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRODUCT_ID")
    private Product product;
    
    public String getPhotoUrl() {
    	return product.getId() + "/" + FilenameUtils.getBaseName(fileName) + ORIGINAL_IMG_SUFFIX;
    }
    
    public String getThumbPhotoUrl() {
    	return product.getId() + "/" + FilenameUtils.getBaseName(fileName) + THUMBNAIL_IMG_SUFFIX;
    }
    
}
