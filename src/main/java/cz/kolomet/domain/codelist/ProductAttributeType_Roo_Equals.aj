// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain.codelist;

import cz.kolomet.domain.codelist.ProductAttributeType;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect ProductAttributeType_Roo_Equals {
    
    public boolean ProductAttributeType.equals(Object obj) {
        if (!(obj instanceof ProductAttributeType)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ProductAttributeType rhs = (ProductAttributeType) obj;
        return new EqualsBuilder().append(codeDescription, rhs.codeDescription).append(codeKey, rhs.codeKey).append(id, rhs.id).isEquals();
    }
    
    public int ProductAttributeType.hashCode() {
        return new HashCodeBuilder().append(codeDescription).append(codeKey).append(id).toHashCode();
    }
    
}