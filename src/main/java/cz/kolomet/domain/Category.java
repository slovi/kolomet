package cz.kolomet.domain;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import cz.kolomet.domain.codelist.CategoryType;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
public class Category extends DomainEntity {
	
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

}
