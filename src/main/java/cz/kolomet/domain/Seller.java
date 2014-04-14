package cz.kolomet.domain;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.FilterDefs;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.ParamDef;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "products", "sellersPhotoUrls"})
@RooJpaEntity
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "products", "sellersPhotoUrls"})
@RooSerializable
@FilterDefs({
	@FilterDef(name = "sellerEnabledFilter", parameters = @ParamDef(type = "boolean", name = "enabled")),
	@FilterDef(name = "sellerOwnFilter", parameters = @ParamDef(type = "long", name= "sellerId"))
})
@Filters({
	@Filter(name = "sellerEnabledFilter", condition = "enabled = :enabled"),
	@Filter(name = "sellerOwnFilter", condition = "id = :sellerId")
})
public class Seller extends DomainEntity {
	
	@NotNull
	@Size(max = 20)
	private String sellerName;

    /**
     */
    @NotNull
    @Lob
    private String sellerDescription;
    
    private String sellerTitle;
    
    private Boolean enabled = true;
    
    // zodpovedna osoba
    @Size(max = 20)
    private String personSalutation;
    
    @Size(max = 20)
    private String personDegree;
    
    @Size(max = 20)
    private String personName;
    
    @Size(max = 20)
    private String personSurname;
    
    // provozovna
    @NotNull
    @ManyToOne
    private CountryState businessCountry;
    
    @Size(max = 30)
    private String businessCity;
    
    @Size(max = 30)
    private String businessStreet;
    
    @Size(max = 30)
    private String businessPostCode;
    
    @Size(max = 20)
    private String businessSalutation;
    
    @Size(max = 20)
    private String businessDegree;
    
    @Size(max = 30)
    private String businessName;
    
    @Size(max = 50)
    private String businessEmail;
    
    @Size(max = 30)
    private String businessPhoneNumber;

    // ostatni
    
    @NotNull
    @ManyToOne
    private SellerStatus sellerStatus;
    
    @NotNull
    @ManyToOne
    private Region region;
    
    @Size(max = 255)
    private String web;
    
    @Size(max = 255)
    private String saleType;
    
    @Size(max = 255)
    private String mapUrl;
    
    // korespondencni adresa
    @NotNull
    @ManyToOne
    private CountryState addressCountry;
    
    @Size(max = 30)
    private String addressCity;
    
    @Size(max = 50)
    private String addressStreet;
    
    @Size(max = 5)
    private String addressPostCode;
    
    @Size(max = 20)
    private String addressSalutation;
    
    @Size(max = 20)
    private String addressDegree;
    
    @Size(max = 50)
    private String addressName;
    
    @Size(max = 50)
    private String addressEmail;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "seller", cascade = CascadeType.ALL)
    private List<SellerPhotoUrl> sellerPhotoUrls;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "seller", cascade = CascadeType.ALL)
    private List<Product> products;
    
    public String getPersonString() {
    	
    	StringBuilder builder = new StringBuilder();
    	if (StringUtils.isNotEmpty(personSalutation)) {
    		builder.append(personSalutation);
    		builder.append(" ");
    	}
    	if (StringUtils.isNotEmpty(personDegree)) {
    		builder.append(personDegree);
    		builder.append(" ");
    	}
    	if (StringUtils.isNotEmpty(personName)) {
    		builder.append(personName);
    		builder.append(" ");
    	}
    	if (StringUtils.isNotEmpty(personSurname)) {
    		builder.append(personSurname);
    		builder.append(" ");
    	}
    	return builder.toString();
    }
    
    public String getAddressString() {
    	StringBuilder builder = new StringBuilder();
    	if (StringUtils.isNotEmpty(addressStreet)) {
    		builder.append(addressStreet);
    		builder.append(", ");
    	}
    	if (StringUtils.isNotEmpty(addressCity)) {
    		builder.append(addressCity);
    		builder.append(", ");
    	}
    	if (StringUtils.isNotEmpty(addressPostCode)) {
    		builder.append(addressPostCode);
    	}
    	return builder.toString();
    }
    
    public String getContactString() {
    	StringBuilder builder = new StringBuilder();
    	if (StringUtils.isNotEmpty(businessEmail)) {
    		builder.append(businessEmail);
    		builder.append(", ");
    	}
    	if (StringUtils.isNotEmpty(businessPhoneNumber)) {
    		builder.append(businessPhoneNumber);
    	}
    	return builder.toString();
    }
    
}
