package cz.kolomet.domain;

import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

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
public class ApplicationRole extends DomainEntity {
	
	/**
	 */
	private String roleName;
	
	@ManyToMany
	  @JoinTable(
	      name="APPLICATION_ROLE_PERMISSION",
	      joinColumns={@JoinColumn(name="PERMISSION_ID", referencedColumnName="ID")},
	      inverseJoinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")})
	private List<ApplicationPermission> permissions;
	
}