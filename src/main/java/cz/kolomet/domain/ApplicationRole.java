package cz.kolomet.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "permissions", "users"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "permissions", "users"})
@RooSerializable
public class ApplicationRole extends DomainEntity {
	
	/**
	 */
	private String roleName;
	
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "roles", cascade = CascadeType.REMOVE)
	private List<ApplicationUser> users;
	
	@ManyToMany
	  @JoinTable(
	      name="APPLICATION_ROLE_PERMISSION",
	      joinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")},
	      inverseJoinColumns={@JoinColumn(name="PERMISSION_ID", referencedColumnName="ID")})
	private List<ApplicationPermission> permissions;
	
}
