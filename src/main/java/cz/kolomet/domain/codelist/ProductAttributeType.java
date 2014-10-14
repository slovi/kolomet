package cz.kolomet.domain.codelist;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)public class ProductAttributeType extends Codelist implements Serializable {
	
	@ManyToOne(fetch = FetchType.LAZY)
	private CategoryType categoryType;
	
	private String units;
	
	private Boolean required = true;
	
	public boolean isColorType() {
		return this.getCodeKey().equals("pat.bike.color");
	}

	public CategoryType getCategoryType() {
        return this.categoryType;
    }

	public void setCategoryType(CategoryType categoryType) {
        this.categoryType = categoryType;
    }

	public String getUnits() {
        return this.units;
    }

	public void setUnits(String units) {
        this.units = units;
    }

	public Boolean getRequired() {
        return this.required;
    }

	public void setRequired(Boolean required) {
        this.required = required;
    }

}
