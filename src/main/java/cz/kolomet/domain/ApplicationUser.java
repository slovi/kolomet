package cz.kolomet.domain;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
public class ApplicationUser extends DomainEntity {
	
	/**
	 */
	private String username;

	/**
	 */
	private String password;

	/**
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SELLER_ID")
	private Seller seller;
	
}
