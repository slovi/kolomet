package cz.kolomet.domain.codelist;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import cz.kolomet.domain.DomainEntity;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooJpaEntity(mappedSuperclass = true)
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooSerializable
public abstract class Codelist extends DomainEntity {

    /**
     */
    @NotNull
    @Size(max = 20)
    private String codeKey;

    /**
     */
    @NotNull
    @Size(max = 100)
    private String codeDescription;
    
    private Integer sequenceNr = 0;
    
    public static Sort defaultSort() {
    	Order sequenceNrOrder = new Order(Direction.DESC, "sequenceNr");
    	Order codeDescriptionOrder = new Order(Direction.ASC, "codeDescription");
    	return new Sort(sequenceNrOrder, codeDescriptionOrder);
    }
    
}
