package cz.kolomet.domain;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Embedded;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@Embeddable
@RooSerializable
public class Address {

    /**
     */
    @NotNull
    @Size(max = 100)
    @Column(columnDefinition="ADDRESS_STREET")
    private String street;

    /**
     */
    @NotNull
    @Size(max = 100)
    @Column(columnDefinition="ADDRESS_CITY")
    private String city;

    /**
     */
    @NotNull
    @Size(max = 10)
    @Column(columnDefinition="ADDRESS_POSTCODE")
    private String postCode;

    /**
     */
    @NotNull
    @Column(columnDefinition="ADDRESS_STREETNR")
    private Integer streetNr;
    
    @NotNull
    @Column(columnDefinition="ADDRESS_EMAIL")
    private String email;
    
    @Embedded
    @AttributeOverrides({
    	@AttributeOverride(name="salutation", column=@Column(columnDefinition="ADDRESS_SALUTATION")),
    	@AttributeOverride(name="name", column=@Column(columnDefinition="ADDRESS_NAME")),
    	@AttributeOverride(name="surname", column=@Column(columnDefinition="ADDRESS_SURNAME")),
    	@AttributeOverride(name="degree", column=@Column(columnDefinition="ADDRESS_DEGREE")),
    		})
    private Person person;
    
}
