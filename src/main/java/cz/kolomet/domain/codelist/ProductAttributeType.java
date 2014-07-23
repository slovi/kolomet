package cz.kolomet.domain.codelist;

import javax.persistence.ManyToOne;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooSerializable
public class ProductAttributeType extends Codelist {
	
	@ManyToOne
	private CategoryType categoryType;
	
	private String units;
	
	private Boolean required = true;
	
	public boolean isColorType() {
		return this.getCodeKey().equals("pat.bike.color");
	}
	
}
