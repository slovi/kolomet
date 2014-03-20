package cz.kolomet.domain;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
public class Product extends DomainEntity {

    /**
     */
    @NotNull
    @Size(max = 50)
    private String productName;

    /**
     */
    @NotNull
    private BigDecimal price;

    /**
     */
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
    private Boolean active;
    
    /**
     */
    @DateTimeFormat(style="M-")
    private Date validTo;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL)
    private List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
}
