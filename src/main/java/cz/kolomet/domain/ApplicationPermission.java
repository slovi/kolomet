package cz.kolomet.domain;

import java.util.List;

import javax.persistence.ManyToMany;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "roles"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "roles"})
@RooSerializable
public class ApplicationPermission extends DomainEntity {
	
	/**
	 */
	private String permissionName;

	/**
	 * 
	 */
	@ManyToMany(mappedBy = "permissions")
	private List<ApplicationRole> roles;
	
}
