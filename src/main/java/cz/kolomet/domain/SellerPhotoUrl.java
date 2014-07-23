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
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"seller", "createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller"})
@RooSerializable
public class SellerPhotoUrl extends BasePhotoUrl {
	
	public static final String PHOTO_URL_PREFIX = "seller";
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SELLER_ID")
    private Seller seller;
    
    @Transient
    private List<CommonsMultipartFile> contents;
    
    @Override
    protected String getPhotoUrlPrefix() {
    	return PHOTO_URL_PREFIX;
    }
    
    @Override
    protected Long getParentContainerId() {
    	return seller.getId();
    }
    
    public List<CommonsMultipartFile> getContents() {
    	return contents;
    }
    
    public void setContents(List<CommonsMultipartFile> contents) {
    	this.contents = contents;
    }

	@Override
	public PhotoContainer getParentContainer() {
		return seller;
	}
	
}
