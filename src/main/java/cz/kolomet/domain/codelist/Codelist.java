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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getCodeKey() == null) ? 0 : getCodeKey().hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (!(obj instanceof Codelist))
			return false;
		Codelist other = (Codelist) obj;
		if (getCodeKey() == null) {
			if (other.getCodeKey() != null)
				return false;
		} else if (!getCodeKey().equals(other.getCodeKey()))
			return false;
		return true;
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
