// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.ProductAttribute;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect ProductAttribute_Roo_Equals {
    
    public boolean ProductAttribute.equals(Object obj) {
        if (!(obj instanceof ProductAttribute)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ProductAttribute rhs = (ProductAttribute) obj;
        return new EqualsBuilder().append(attributeType, rhs.attributeType).append(attributeValue, rhs.attributeValue).append(created, rhs.created).append(id, rhs.id).append(lastModified, rhs.lastModified).append(unit, rhs.unit).isEquals();
    }
    
    public int ProductAttribute.hashCode() {
        return new HashCodeBuilder().append(attributeType).append(attributeValue).append(created).append(id).append(lastModified).append(unit).toHashCode();
    }
    
}
