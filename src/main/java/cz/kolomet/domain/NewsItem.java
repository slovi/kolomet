package cz.kolomet.domain;

import java.util.Date;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.ParamDef;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
@FilterDef(name = "newsItemEnabledFilter", parameters = @ParamDef(type = "boolean", name = "enabled"))
@Filters({
	@Filter(name = "newsItemEnabledFilter", condition = "enabled = :enabled")
})
public class NewsItem extends DomainEntity {
	
	@NotNull
	private Boolean enabled = true;
	
	@DateTimeFormat(style="S-")
	private Date newsItemDate;
	
	@Lob
	@NotNull
	private String text;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLICATIONUSER_ID")
	private ApplicationUser creater;
	
}
