package cz.kolomet.domain;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals
@RooSerializable
public class Seller extends DomainEntity {
	
	@NotNull
	@Size(max = 20)
	private String sellerName;

    /**
     */
    @NotNull
    @Lob
    private String sellerDescription;
    
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
    
    @Size(max = 255)
    private String photoUrl;
    
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
    
}
