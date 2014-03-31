// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain.codelist;

import cz.kolomet.domain.codelist.CategoryType;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect CategoryType_Roo_Equals {
    
    public boolean CategoryType.equals(Object obj) {
        if (!(obj instanceof CategoryType)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        CategoryType rhs = (CategoryType) obj;
        return new EqualsBuilder().append(codeDescription, rhs.codeDescription).append(codeKey, rhs.codeKey).append(created, rhs.created).append(id, rhs.id).append(lastModified, rhs.lastModified).isEquals();
    }
    
    public int CategoryType.hashCode() {
        return new HashCodeBuilder().append(codeDescription).append(codeKey).append(created).append(id).append(lastModified).toHashCode();
    }
    
}
