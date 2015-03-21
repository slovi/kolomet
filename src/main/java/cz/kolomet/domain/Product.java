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
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.BatchSize;
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
@BatchSize(size = 20)
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
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    		name="PRODUCT_FIGURE_HEIGHT",
    		joinColumns={@JoinColumn(name="PRODUCT_ID", referencedColumnName="ID")},
    		inverseJoinColumns={@JoinColumn(name="FIGURE_HEIGHT_ID", referencedColumnName="ID")})
    @OrderBy("sequenceNr ASC, codeDescription ASC")
    private List<FigureHeight> figureHeights;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    		name="PRODUCT_PRODUCT_COLOR",
    		joinColumns={@JoinColumn(name="PRODUCT_ID", referencedColumnName="ID")},
    		inverseJoinColumns={@JoinColumn(name="PRODUCT_COLOR_ID", referencedColumnName="ID")})
    private List<ProductColor> productColors;
    
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
    
    @Min(1)
    @Max(1000)
    @NumberFormat(pattern = "###.#################")
    private Double weight;
    
    @NotNull
    @Size(max = 255)
    private String buyUrl;
    
    private ProductState productState;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
    @BatchSize(size = 20)
    private List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
    @BatchSize(size = 20)
    private List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
    
    @Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();
    
    public void normalizeBuyUrl() {
    	if (StringUtils.isNotEmpty(buyUrl) && !buyUrl.startsWith("http://") && !buyUrl.startsWith("https://")) {
    		this.buyUrl = "http://" + buyUrl; 
    	}
    }
    
    @Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getProductName() == null) ? 0 : getProductName().hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (!(obj instanceof Product))
			return false;
		Product other = (Product) obj;
		if (getProductName() == null) {
			if (other.getProductName() != null)
				return false;
		} else if (!getProductName().equals(other.getProductName()))
			return false;
		return true;
	}

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
    		Product product = clone();
    		product.setBaseParamsAsNull();
        	product.setCopiedFrom(this);
        	List<FileInfo> fileInfos = new ArrayList<FileInfo>();   
        	for (PhotoUrl photoUrl: this.photoUrls) {
        		FileInfo fileInfo = new FileInfo(photoUrl.getFileName(), photoUrl.getContentType());
        		fileInfos.add(fileInfo);
        	}
        	product.setFileInfos(fileInfos);
        	product.setPhotoUrls(new ArrayList<PhotoUrl>());
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
    	} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
    }
    
    @Override
    protected Product clone() throws CloneNotSupportedException {
    	return (Product) super.clone();
    }
    
	public boolean isPhotoCopied(FileInfo fileInfo) {
		Product copiedFrom = getCopiedFrom();
		if (copiedFrom != null) {
			for (PhotoUrl photoUrl: copiedFrom.getPhotoUrls()) {
				if (photoUrl.getFileName().equals(fileInfo.getFileName())) {
					return true;
				}
			}
		}
		return false;
	}

    public void copyPhotoUrlFiles(String fileName, File baseFolder, File targetFolder) {
    	
    	try {
	    	String detailFileName = BasePhoto.getPhotoUrlFileName(fileName, BasePhoto.DETAIL_IMG_SUFFIX);
	    	FileUtils.copyFile(new File(baseFolder, detailFileName), new File(targetFolder, detailFileName));
	    	
	    	String overFileName = BasePhoto.getPhotoUrlFileName(fileName, BasePhoto.OVERVIEW_IMG_SUFFIX);
			FileUtils.copyFile(new File(baseFolder, overFileName), new File(targetFolder, overFileName));
			
			String thumbFileName = BasePhoto.getPhotoUrlFileName(fileName, BasePhoto.THUMBNAIL_IMG_SUFFIX);
			FileUtils.copyFile(new File(baseFolder, thumbFileName), new File(targetFolder, thumbFileName));
			
			String origFileName = BasePhoto.getPhotoUrlFileName(fileName, BasePhoto.ORIGINAL_IMG_SUFFIX);
			FileUtils.copyFile(new File(baseFolder, origFileName), new File(targetFolder, origFileName));
    	} catch (IOException e) {
    		throw new RuntimeException(e);
    	}
    }
    
    public void copyAllPhotoUrlFiles(Product copiedFrom, File baseFolder, File targetFolder) {
    	for (PhotoUrl photoUrl: copiedFrom.getPhotoUrls()) {
    		copyPhotoUrlFiles(photoUrl.getFileName(), baseFolder, targetFolder);
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

	public List<FigureHeight> getFigureHeights() {
        return this.figureHeights;
    }

	public void setFigureHeights(List<FigureHeight> figureHeights) {
        this.figureHeights = figureHeights;
    }

	public List<ProductColor> getProductColors() {
        return this.productColors;
    }

	public void setProductColors(List<ProductColor> productColors) {
        this.productColors = productColors;
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
