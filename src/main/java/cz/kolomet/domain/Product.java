package cz.kolomet.domain;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.dto.FileInfo;

@Entity
public class Product extends BaseDomainEntity implements Cloneable, PhotoContainer, Serializable {
	
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

    @NotNull
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
    @ManyToOne(fetch = FetchType.LAZY)
    private Seller seller;

    /**
     */
    @ManyToOne(fetch = FetchType.LAZY)
    private Category category;

    /**
     */
    @ManyToOne(fetch = FetchType.LAZY)
    private Producer producer;
    
    /**
     */
    @ManyToOne(fetch = FetchType.LAZY)
    private ProductUsage productUsage;
    
    @ManyToOne(fetch = FetchType.LAZY)
    private BicycleCategory bicycleCategory;
    
    @ManyToOne(fetch = FetchType.LAZY)
    private FigureHeight figureHeight;
    
    @ManyToOne(fetch = FetchType.LAZY)
    private ProductColor productColor;
    
    @ManyToOne(fetch = FetchType.LAZY)
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
    
    @Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();
    
    @Override
    public String getPhotoType() {
    	return PhotoUrl.PHOTO_URL_PREFIX;
    }

    public Photo getPhotoByName(String photoName) {
    	for (Photo photo: getPhotos()) {
    		if (photo.getFileName().equals(photoName)) {
    			return photo;
    		}
    	}
    	return null;
    }
    
    public ProductAttribute getColorAttribute() {
    	for (ProductAttribute productAttribute: productAttributes) {
    		if (productAttribute.isColorAttribute()) {
    			return productAttribute;
    		}
    	}
    	return null;
    }
    
    public ProductAttribute getProductAttribute(String productAttributeName) {
    	for (ProductAttribute productAttribute: productAttributes) {
    		if (productAttribute.getAttributeType().getCodeKey().equals(productAttributeName)) {
    			return productAttribute;
    		}
    	}
    	return null;
    }
    
    public Product copy() {
    	try {
			return clone();
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
    }
    
    @Override
    protected Product clone() throws CloneNotSupportedException {
    	Product product = (Product) super.clone();
    	product.setBaseParamsAsNull();
    	product.setCopiedFrom(this);
    	List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();   
    	for (PhotoUrl photoUrl: this.photoUrls) {
    		PhotoUrl newPhotoUrl = photoUrl.copy();
    		newPhotoUrl.setProduct(product);
    		photoUrls.add(newPhotoUrl);
    	}
    	product.setPhotoUrls(photoUrls);
    	List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
    	for (ProductAttribute productAttribute: this.productAttributes) {
    		ProductAttribute newProductAttribute = new ProductAttribute();
    		newProductAttribute.setAttributeType(productAttribute.getAttributeType());
    		newProductAttribute.setAttributeValue(productAttribute.getAttributeValue());
    		newProductAttribute.setProduct(this);
    		productAttributes.add(newProductAttribute);
    	}
    	product.setProductAttributes(productAttributes);
    	return product;
    }
    
    public void copyPhotoUrls(List<PhotoUrl> photoUrls) {
    	for (PhotoUrl photoUrl: photoUrls) {
    		addPhotoUrl(photoUrl.copy());
    	}
    }
    
    public void copyPhotoUrlFiles(File baseFolder) {
    	this.copyPhotoUrlFiles(baseFolder, getCopiedFrom());
    }
    
    public void copyPhotoUrlFiles(File baseFolder, Product copiedFromProduct) {
    	this.photoUrls.clear();
    	for (PhotoUrl photoUrl: copiedFromProduct.getPhotoUrls()) {
    		PhotoUrl newPhotoUrl = photoUrl.copy();
    		newPhotoUrl.setProduct(this);
    		try {
    			FileUtils.copyFile(new File(baseFolder, photoUrl.getPhotoUrl()), new File(baseFolder, newPhotoUrl.getPhotoUrl()));
    			FileUtils.copyFile(new File(baseFolder, photoUrl.getOverPhotoUrl()), new File(baseFolder, newPhotoUrl.getOverPhotoUrl()));
				FileUtils.copyFile(new File(baseFolder, photoUrl.getThumbPhotoUrl()), new File(baseFolder, newPhotoUrl.getThumbPhotoUrl()));
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
    		addPhotoUrl(newPhotoUrl);
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
	
	public boolean isEmptyState() {
		return productState == null;
	}
	
	public boolean isCopyState() {
		return productState == ProductState.COPY;
	}
	
	public boolean isActiveState() {
		return productState == ProductState.ACTIVE;
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
		if (price != null && finalPrice != null) {
			return price.subtract(finalPrice);
		} else {
			return BigDecimal.ZERO;
		}
	}
	
	public boolean isAnyDiscount() {
		return computeDiscount().compareTo(BigDecimal.ZERO) > 0;
	}

	@Override
	public List<? extends Photo> getPhotos() {
		return photoUrls;
	}

	@Override
	public Photo addPhoto(String fileName, String contentType) {
		final PhotoUrl photoUrl = new PhotoUrl();
    	photoUrl.setFileName(fileName);
    	photoUrl.setContentType(contentType);
    	photoUrl.setProduct(this);
    	this.getPhotoUrls().add(photoUrl);
    	return photoUrl;
	}

	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}

	public String getProductName() {
        return this.productName;
    }

	public void setProductName(String productName) {
        this.productName = productName;
    }

	public BigDecimal getPrice() {
        return this.price;
    }

	public void setPrice(BigDecimal price) {
        this.price = price;
    }

	public BigDecimal getFinalPrice() {
        return this.finalPrice;
    }

	public void setFinalPrice(BigDecimal finalPrice) {
        this.finalPrice = finalPrice;
    }

	public BigDecimal getDiscount() {
        return this.discount;
    }

	public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

	public String getDescription() {
        return this.description;
    }

	public void setDescription(String description) {
        this.description = description;
    }

	public Seller getSeller() {
        return this.seller;
    }

	public void setSeller(Seller seller) {
        this.seller = seller;
    }

	public Category getCategory() {
        return this.category;
    }

	public void setCategory(Category category) {
        this.category = category;
    }

	public Producer getProducer() {
        return this.producer;
    }

	public void setProducer(Producer producer) {
        this.producer = producer;
    }

	public ProductUsage getProductUsage() {
        return this.productUsage;
    }

	public void setProductUsage(ProductUsage productUsage) {
        this.productUsage = productUsage;
    }

	public BicycleCategory getBicycleCategory() {
        return this.bicycleCategory;
    }

	public void setBicycleCategory(BicycleCategory bicycleCategory) {
        this.bicycleCategory = bicycleCategory;
    }

	public FigureHeight getFigureHeight() {
        return this.figureHeight;
    }

	public void setFigureHeight(FigureHeight figureHeight) {
        this.figureHeight = figureHeight;
    }

	public ProductColor getProductColor() {
        return this.productColor;
    }

	public void setProductColor(ProductColor productColor) {
        this.productColor = productColor;
    }

	public Product getCopiedFrom() {
        return this.copiedFrom;
    }

	public void setCopiedFrom(Product copiedFrom) {
        this.copiedFrom = copiedFrom;
    }

	public Boolean getEnabled() {
        return this.enabled;
    }

	public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

	public Date getValidFrom() {
        return this.validFrom;
    }

	public void setValidFrom(Date validFrom) {
        this.validFrom = validFrom;
    }

	public Date getValidTo() {
        return this.validTo;
    }

	public void setValidTo(Date validTo) {
        this.validTo = validTo;
    }

	public Boolean getCanSendToAllCountry() {
        return this.canSendToAllCountry;
    }

	public void setCanSendToAllCountry(Boolean canSendToAllCountry) {
        this.canSendToAllCountry = canSendToAllCountry;
    }

	public Boolean getDeliveryForFree() {
        return this.deliveryForFree;
    }

	public void setDeliveryForFree(Boolean deliveryForFree) {
        this.deliveryForFree = deliveryForFree;
    }

	public Double getWeight() {
        return this.weight;
    }

	public void setWeight(Double weight) {
        this.weight = weight;
    }

	public String getBuyUrl() {
        return this.buyUrl;
    }

	public void setBuyUrl(String buyUrl) {
        this.buyUrl = buyUrl;
    }

	public ProductState getProductState() {
        return this.productState;
    }

	public void setProductState(ProductState productState) {
        this.productState = productState;
    }

	public List<PhotoUrl> getPhotoUrls() {
        return this.photoUrls;
    }

	public void setPhotoUrls(List<PhotoUrl> photoUrls) {
        this.photoUrls = photoUrls;
    }

	public List<ProductAttribute> getProductAttributes() {
        return this.productAttributes;
    }

	public void setProductAttributes(List<ProductAttribute> productAttributes) {
        this.productAttributes = productAttributes;
    }

}
