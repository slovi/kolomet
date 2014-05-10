package cz.kolomet.domain;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
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

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.FilterDefs;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.ParamDef;
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
	@Filter(name = "productValidToFilter", condition = "validto > :actualDate"),
	@Filter(name = "productEnabledFilter", condition = "enabled = :enabled"),
	@Filter(name = "sellerOwnFilter", condition = "seller_id = :sellerId")
})
public class Product extends DomainEntity {
	
    /**
     */
    @NotNull
    @Size(max = 50)
    private String productName;

    /**
     */
    @NotNull
    @DecimalMin("1")
    @DecimalMax("1000000")
    @NumberFormat(pattern = "###")
    private BigDecimal price;

    /**
     */
    @DecimalMin("1")
    @DecimalMax("1000000")
    @NumberFormat(pattern = "###")
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
    
    /**
     */
    private Boolean enabled = true;
    
    /**
     */
    @DateTimeFormat(style="M-")
    private Date validTo;
    
    private Boolean canSendToAllCountry;
    
    private Boolean deliveryForFree;
    
    @NotNull
    @Min(1)
    @Max(1000)
    @NumberFormat(pattern = "###")
    private Integer weight;
    
    @NotNull
    @Size(max = 255)
    private String buyUrl;

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
    
}
