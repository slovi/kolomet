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
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"seller", "createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller"})
@RooSerializable
public class SellerPhotoUrl extends DomainEntity {
	
	public static String ORIGINAL_IMG_SUFFIX = "_orig.jpg";

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
    @JoinColumn(name = "SELLER_ID")
    private Seller seller;
    
    public String getPhotoUrl() {
    	return seller.getId() + "/" + FilenameUtils.getBaseName(fileName) + ORIGINAL_IMG_SUFFIX;
    }
	
}
