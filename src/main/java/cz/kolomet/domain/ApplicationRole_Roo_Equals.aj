// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.ApplicationRole;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect ApplicationRole_Roo_Equals {
    
    public boolean ApplicationRole.equals(Object obj) {
        if (!(obj instanceof ApplicationRole)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ApplicationRole rhs = (ApplicationRole) obj;
        return new EqualsBuilder().append(created, rhs.created).append(createdBy, rhs.createdBy).append(id, rhs.id).append(lastModified, rhs.lastModified).append(lastModifiedBy, rhs.lastModifiedBy).append(roleName, rhs.roleName).isEquals();
    }
    
    public int ApplicationRole.hashCode() {
        return new HashCodeBuilder().append(created).append(createdBy).append(id).append(lastModified).append(lastModifiedBy).append(roleName).toHashCode();
    }
    
}
