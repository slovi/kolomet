package cz.kolomet.domain;
import java.util.List;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

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
public class PhotoUrl extends BasePhotoUrl implements Cloneable {
	
	public static final String PHOTO_URL_PREFIX = "product";
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRODUCT_ID")
    private Product product;
    
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

	@Override
	public PhotoContainer getParentContainer() {
		return product;
	}

	@Override
	protected String getPhotoUrlPrefix() {
		return PHOTO_URL_PREFIX;
	}

	@Override
	protected Long getParentContainerId() {
		return getPhotoId();
	}
    
}
