// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain.codelist;

import cz.kolomet.domain.codelist.BicycleSize;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect BicycleSize_Roo_Equals {
    
    public boolean BicycleSize.equals(Object obj) {
        if (!(obj instanceof BicycleSize)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        BicycleSize rhs = (BicycleSize) obj;
        return new EqualsBuilder().append(codeDescription, rhs.codeDescription).append(codeKey, rhs.codeKey).append(created, rhs.created).append(id, rhs.id).append(lastModified, rhs.lastModified).isEquals();
    }
    
    public int BicycleSize.hashCode() {
        return new HashCodeBuilder().append(codeDescription).append(codeKey).append(created).append(id).append(lastModified).toHashCode();
    }
    
}