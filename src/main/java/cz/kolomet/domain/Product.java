package cz.kolomet.domain;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.ParamDef;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "category", "producer", "photoUrls", "productAttributes"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "category", "producer", "photoUrls", "productAttributes"})
@RooSerializable
@FilterDef(name = "productEnabledFilter", parameters = @ParamDef(type = "boolean", name = "enabled"))
@Filters({
	@Filter(name = "productEnabledFilter", condition = "enabled = :enabled")
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
    @NumberFormat(style = Style.NUMBER)
    private BigDecimal price;

    /**
     */
    @NumberFormat(style = Style.NUMBER)
    private BigDecimal discount;
    
    @Lob
    private String description;

    /**
     */
    @ManyToOne
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
    private Boolean enabled;
    
    /**
     */
    @DateTimeFormat(style="M-")
    private Date validTo;
    
    private Boolean canSendToAllCountry;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
}
