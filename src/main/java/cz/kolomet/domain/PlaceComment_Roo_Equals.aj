// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.PlaceComment;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect PlaceComment_Roo_Equals {
    
    public boolean PlaceComment.equals(Object obj) {
        if (!(obj instanceof PlaceComment)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        PlaceComment rhs = (PlaceComment) obj;
        return new EqualsBuilder().append(created, rhs.created).append(createdBy, rhs.createdBy).append(id, rhs.id).append(lastModified, rhs.lastModified).append(lastModifiedBy, rhs.lastModifiedBy).append(parent, rhs.parent).append(place, rhs.place).append(text, rhs.text).isEquals();
    }
    
    public int PlaceComment.hashCode() {
        return new HashCodeBuilder().append(created).append(createdBy).append(id).append(lastModified).append(lastModifiedBy).append(parent).append(place).append(text).toHashCode();
    }
    
}
