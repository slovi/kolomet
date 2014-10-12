package cz.kolomet.domain.codelist;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)public class SellerStatus extends Codelist implements Serializable {
	
	private Integer priority;
	

	public Integer getPriority() {
        return this.priority;
    }

	public void setPriority(Integer priority) {
        this.priority = priority;
    }

}
