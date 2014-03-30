// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.PhotoUrl;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect PhotoUrl_Roo_Equals {
    
    public boolean PhotoUrl.equals(Object obj) {
        if (!(obj instanceof PhotoUrl)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        PhotoUrl rhs = (PhotoUrl) obj;
        return new EqualsBuilder().append(contentType, rhs.contentType).append(created, rhs.created).append(createdBy, rhs.createdBy).append(fileName, rhs.fileName).append(id, rhs.id).append(lastModified, rhs.lastModified).append(lastModifiedBy, rhs.lastModifiedBy).append(product, rhs.product).isEquals();
    }
    
    public int PhotoUrl.hashCode() {
        return new HashCodeBuilder().append(contentType).append(created).append(createdBy).append(fileName).append(id).append(lastModified).append(lastModifiedBy).append(product).toHashCode();
    }
    
}
