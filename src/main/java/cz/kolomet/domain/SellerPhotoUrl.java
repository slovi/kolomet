package cz.kolomet.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class SellerPhotoUrl extends BasePhoto implements Serializable {
	
	public static final String PHOTO_URL_PREFIX = "seller";
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SELLER_ID")
    private Seller seller;
    
    @Override
    protected String getPhotoUrlPrefix() {
    	return PHOTO_URL_PREFIX;
    }
    
    @Override
    protected Long getParentContainerId() {
    	return seller.getId();
    }

	@Override
	public PhotoContainer getParentContainer() {
		return seller;
	}

	public Seller getSeller() {
        return this.seller;
    }

	public void setSeller(Seller seller) {
        this.seller = seller;
    }

}
