// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Entity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Entity_Roo_Equals {
    
    public boolean Entity.equals(Object obj) {
        if (!(obj instanceof Entity)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Entity rhs = (Entity) obj;
        return new EqualsBuilder().append(id, rhs.id).isEquals();
    }
    
    public int Entity.hashCode() {
        return new HashCodeBuilder().append(id).toHashCode();
    }
    
}