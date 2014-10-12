package cz.kolomet.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
@Entity
public class ApplicationRole extends BaseDomainEntity implements Serializable {
	
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

	public String getRoleName() {
        return this.roleName;
    }

	public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

	public List<ApplicationUser> getUsers() {
        return this.users;
    }

	public void setUsers(List<ApplicationUser> users) {
        this.users = users;
    }

	public List<ApplicationPermission> getPermissions() {
        return this.permissions;
    }

	public void setPermissions(List<ApplicationPermission> permissions) {
        this.permissions = permissions;
    }
}
