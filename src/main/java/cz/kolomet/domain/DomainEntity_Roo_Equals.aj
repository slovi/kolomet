// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.DomainEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect DomainEntity_Roo_Equals {
    
    public boolean DomainEntity.equals(Object obj) {
        if (!(obj instanceof DomainEntity)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        DomainEntity rhs = (DomainEntity) obj;
        return new EqualsBuilder().append(id, rhs.id).isEquals();
    }
    
    public int DomainEntity.hashCode() {
        return new HashCodeBuilder().append(id).toHashCode();
    }
    
}