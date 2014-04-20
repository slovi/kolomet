package cz.kolomet.domain;

import java.util.List;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "roles"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "roles"})
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
	private Boolean enabled;

	/**
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SELLER_ID")
	private Seller seller;
		
	@ManyToMany
	  @JoinTable(
	      name="APPLICATION_USER_ROLE",
	      joinColumns={@JoinColumn(name="USER_ID", referencedColumnName="ID")},
	      inverseJoinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")})
	private List<ApplicationRole> roles;
	
}
