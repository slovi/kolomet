package cz.kolomet.domain;
import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
public class PhotoUrl extends BasePhoto implements Cloneable, Serializable {
	
	public static final String PHOTO_URL_PREFIX = "product";
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRODUCT_ID")
    private Product product;
    
    private Long getProductId() {
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
		return getProductId();
	}
	
	public Product getProduct() {
        return this.product;
    }

	public void setProduct(Product product) {
        this.product = product;
    }

	public List<CommonsMultipartFile> getContents() {
        return this.contents;
    }

	public void setContents(List<CommonsMultipartFile> contents) {
        this.contents = contents;
    }

}
