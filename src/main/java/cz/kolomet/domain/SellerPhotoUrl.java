package cz.kolomet.domain;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import flexjson.JSONSerializer;

@Entity
public class SellerPhotoUrl extends BasePhoto implements Serializable {
	
	public static final String PHOTO_URL_PREFIX = "seller";
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SELLER_ID")
    private Seller seller;
    
    public static String toJsonArray(Collection<SellerPhotoUrl> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*").serialize(collection);
    }
    
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
