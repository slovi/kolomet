package cz.kolomet.domain;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import cz.kolomet.domain.codelist.CategoryType;

@Entity
public class Category extends BaseDomainEntity implements Serializable {
	
	public static final String ALL_CATEGORY_CODE_KEY = "cat_bike_all";
	
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

	@NotNull
	@ManyToOne
	private CategoryType categoryType;

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

	public CategoryType getCategoryType() {
        return this.categoryType;
    }

	public void setCategoryType(CategoryType categoryType) {
        this.categoryType = categoryType;
    }

}
