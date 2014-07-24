// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain.codelist;

import cz.kolomet.domain.codelist.Region;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Region_Roo_Equals {
    
    public boolean Region.equals(Object obj) {
        if (!(obj instanceof Region)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Region rhs = (Region) obj;
        return new EqualsBuilder().append(codeDescription, rhs.codeDescription).append(codeKey, rhs.codeKey).append(created, rhs.created).append(googleAlias, rhs.googleAlias).append(gpsLocation, rhs.gpsLocation).append(id, rhs.id).append(lastModified, rhs.lastModified).append(sequenceNr, rhs.sequenceNr).isEquals();
    }
    
    public int Region.hashCode() {
        return new HashCodeBuilder().append(codeDescription).append(codeKey).append(created).append(googleAlias).append(gpsLocation).append(id).append(lastModified).append(sequenceNr).toHashCode();
    }
    
}
