package cz.kolomet.domain;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.io.FileUtils;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.FilterDefs;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.ParamDef;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.ProductUsage;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "category", "producer", "photoUrls", "productAttributes"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "category", "producer", "photoUrls", "productAttributes"})
@RooSerializable
@FilterDefs({
	@FilterDef(name = "productEnabledFilter", parameters = @ParamDef(type = "boolean", name = "enabled")),
	@FilterDef(name = "productValidToFilter", parameters = @ParamDef(type = "date", name = "actualDate")),
	@FilterDef(name = "sellerOwnFilter", parameters = @ParamDef(type = "long", name= "sellerId"))
})
@Filters({
	@Filter(name = "productValidToFilter", condition = "validfrom <= :actualDate and validto >= :actualDate"),
	@Filter(name = "productEnabledFilter", condition = "enabled = :enabled"),
	@Filter(name = "sellerOwnFilter", condition = "seller_id = :sellerId")
})
public class Product extends DomainEntity implements Cloneable {
	
	public static final Date DEFAULT_VALID_TO_DATE = new DateTime(9999, 12, 31, 0, 0, 0, 0).toDate();
	
    /**
     */
    @NotNull
    @Size(max = 50)
    private String productName;

    /**
     */
    @DecimalMin("1")
    @DecimalMax("1000000")
    @NumberFormat(pattern="###")
    private BigDecimal price;

    @DecimalMin("1")
    @DecimalMax("1000000")
    @NumberFormat(pattern="###")
    private BigDecimal finalPrice;
    
    /**
     */
    @NumberFormat(pattern="###")
    private BigDecimal discount;
    
    @Lob
    private String description;

    /**
     */
    @ManyToOne
    @Filter(name = "sellerEnabledFilter", condition = "enabled = :enabled")
    private Seller seller;

    /**
     */
    @ManyToOne
    private Category category;

    /**
     */
    @ManyToOne
    private Producer producer;
    
    /**
     */
    @ManyToOne
    private ProductUsage productUsage;
    
    @ManyToOne
    private BicycleCategory bicycleCategory;
    
    @ManyToOne
    private FigureHeight figureHeight;
    
    @ManyToOne
    private ProductColor productColor;
    
    @ManyToOne
    @JoinColumn(name = "PRODUCT_ID")
    private Product copiedFrom;
    
    /**
     */
    private Boolean enabled = true;
    
    /**
     */
    @DateTimeFormat(style="M-")
    private Date validFrom = new Date();
    
    /**
     */
    @DateTimeFormat(style="M-")
    private Date validTo = DEFAULT_VALID_TO_DATE;
    
    private Boolean canSendToAllCountry;
    
    private Boolean deliveryForFree;
    
    @NotNull
    @Min(1)
    @Max(1000)
    @NumberFormat(pattern = "###")
    private Double weight;
    
    @NotNull
    @Size(max = 255)
    private String buyUrl;
    
    private ProductState productState;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
    
    @Transient
    private List<CommonsMultipartFile> contents;
    
    public Product createCopy() {
    	try {
			return clone();
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
    }
    
    @Override
    protected Product clone() throws CloneNotSupportedException {
    	Product product = (Product) super.clone();
    	product.setId(null);
    	product.setCreated(null);
    	product.setCreatedBy(null);
    	product.setLastModified(null);
    	product.setLastModifiedBy(null);
    	product.setVersion(null);
    	product.setCopiedFrom(this);
    	List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();   
    	for (PhotoUrl photoUrl: this.photoUrls) {
    		PhotoUrl newPhotoUrl = new PhotoUrl();
    		newPhotoUrl.setContentType(photoUrl.getContentType());
    		newPhotoUrl.setFileName(photoUrl.getFileName());
    		product.addPhotoUrl(newPhotoUrl);
    	}
    	product.setPhotoUrls(photoUrls);
    	List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
    	for (ProductAttribute productAttribute: this.productAttributes) {
    		ProductAttribute newProductAttribute = new ProductAttribute();
    		newProductAttribute.setAttributeType(productAttribute.getAttributeType());
    		newProductAttribute.setAttributeValue(productAttribute.getAttributeValue());
    		productAttributes.add(newProductAttribute);
    	}
    	product.setProductAttributes(productAttributes);
    	return product;
    }
    
    public void copyPhotoUrlFiles(File baseFolder, Product copiedFromProduct) {
    	this.photoUrls.clear();
    	for (PhotoUrl photoUrl: copiedFromProduct.getPhotoUrls()) {
    		PhotoUrl newPhotoUrl = new PhotoUrl();
    		newPhotoUrl.setContentType(photoUrl.getContentType());
    		newPhotoUrl.setFileName(photoUrl.getFileName());
    		newPhotoUrl.setProduct(this);
    		try {
    			FileUtils.copyFile(new File(baseFolder, photoUrl.getPhotoUrl()), new File(baseFolder, newPhotoUrl.getPhotoUrl()));
    			FileUtils.copyFile(new File(baseFolder, photoUrl.getOverPhotoUrl()), new File(baseFolder, newPhotoUrl.getOverPhotoUrl()));
				FileUtils.copyFile(new File(baseFolder, photoUrl.getThumbPhotoUrl()), new File(baseFolder, newPhotoUrl.getThumbPhotoUrl()));
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
    		addPhotoUrl(photoUrl);
    	}
    }
    
	public boolean containsProductAttributeType(ProductAttributeType productAttributeType) {
		for (ProductAttribute productAttribute: this.productAttributes) {
			if (productAttribute.getAttributeType().equals(productAttributeType)) {
				return true;
			}
		}
		return false;
	}

	public void addProductAttribute(ProductAttribute productAttribute) {
		productAttribute.setProduct(this);
		this.productAttributes.add(productAttribute);
	}
	
	public void addPhotoUrl(PhotoUrl photoUrl) {
		photoUrl.setProduct(this);
		this.photoUrls.add(photoUrl);
	}
	
	public boolean isCopyState() {
		return productState == ProductState.COPY;
	}
	
	public boolean isValidDateChangeable() {
		Date twoHoursAfterCreation = new DateTime(getCreated()).plusHours(2).toDate();
		return new Date().before(twoHoursAfterCreation);
	}
	
	public boolean isValid() {
		 return !isInvalid() && !isWaitingForValid();
	}
	
	public boolean isWaitingForValid() {
		Date now = new Date();
		return validFrom != null && validFrom.after(now);
	}
	
	public boolean isInvalid() {
		Date now = new Date();
		return validTo != null && validTo.before(now);
	}
	
	public void computeAndSetDiscount() {
		this.setDiscount(computeDiscount());
	}
	
	public BigDecimal computeDiscount() {
		if (price != null) {
			return price.subtract(finalPrice);
		} else {
			return BigDecimal.ZERO;
		}
	}
	
	public boolean isAnyDiscount() {
		return computeDiscount().compareTo(BigDecimal.ZERO) > 0;
	}
    
}
