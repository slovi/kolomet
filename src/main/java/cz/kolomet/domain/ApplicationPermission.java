package cz.kolomet.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;

@Entity
public class ApplicationPermission extends BaseDomainEntity implements Serializable {
	
	/**
	 */
	private String permissionName;

	/**
	 * 
	 */
	@ManyToMany(mappedBy = "permissions")
	private List<ApplicationRole> roles;
	

	public String getPermissionName() {
        return this.permissionName;
    }

	public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

	public List<ApplicationRole> getRoles() {
        return this.roles;
    }

	public void setRoles(List<ApplicationRole> roles) {
        this.roles = roles;
    }

}
