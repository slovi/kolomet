package cz.kolomet.domain;

import javax.persistence.Embeddable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@Embeddable
@RooSerializable
public class Person {
	
    private String salutation;
    
    private String degree;
    
    private String name;
    
    private String surname;
	
}
