package cz.kolomet.domain.codelist;
import java.io.Serializable;

import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;

import cz.kolomet.domain.BaseDomainEntity;

@MappedSuperclasspublic abstract class Codelist extends BaseDomainEntity implements Serializable {

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
    

	public String getCodeKey() {
        return this.codeKey;
    }

	public void setCodeKey(String codeKey) {
        this.codeKey = codeKey;
    }

	public String getCodeDescription() {
        return this.codeDescription;
    }

	public void setCodeDescription(String codeDescription) {
        this.codeDescription = codeDescription;
    }

	public Integer getSequenceNr() {
        return this.sequenceNr;
    }

	public void setSequenceNr(Integer sequenceNr) {
        this.sequenceNr = sequenceNr;
    }

}
