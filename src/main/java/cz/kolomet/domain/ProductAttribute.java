package cz.kolomet.domain;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import cz.kolomet.domain.codelist.ProductAttributeType;

@Entity
public class ProductAttribute extends BaseDomainEntity implements Serializable {
    
    /**
     */
    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    private ProductAttributeType attributeType;
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRODUCT_ID")
    private Product product;

    /**
     */
    @NotNull
    private String attributeValue;
    
    public boolean isColorAttribute() {
    	return this.attributeType.isColorType();
    }

	public ProductAttributeType getAttributeType() {
        return this.attributeType;
    }

	public void setAttributeType(ProductAttributeType attributeType) {
        this.attributeType = attributeType;
    }

	public Product getProduct() {
        return this.product;
    }

	public void setProduct(Product product) {
        this.product = product;
    }

	public String getAttributeValue() {
        return this.attributeValue;
    }

	public void setAttributeValue(String attributeValue) {
        this.attributeValue = attributeValue;
    }

}
